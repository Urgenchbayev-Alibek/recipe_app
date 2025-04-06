import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/recipe_create_gulnoza/manager/recipe_create_bloc.dart';
import 'package:recipe_app/features/recipe_create_gulnoza/manager/recipe_create_state.dart';
import 'package:recipe_app/features/recipe_create_gulnoza/pages/recipe_create_ingredient_item.dart';
import 'package:recipe_app/features/recipe_create_gulnoza/pages/recipe_create_instruction_item.dart';
import 'package:recipe_app/features/recipe_create_gulnoza/pages/recipe_text_form_field.dart';
import '../../../Core/utils/colors.dart';
import '../../common/widgets/recipe_app_bar.dart';
import '../../common/widgets/recipe_bottom_navigation_bar.dart';
import '../../common/widgets/recipe_text_button_container.dart';

class RecipeCreateView extends StatefulWidget {
  const RecipeCreateView({super.key});

  @override
  State<RecipeCreateView> createState() => _RecipeCreateViewState();
}

class _RecipeCreateViewState extends State<RecipeCreateView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = ScrollController();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeController = TextEditingController();

  List<Map<String, TextEditingController>> ingredientsControllers = [];
  List<TextEditingController> instructions = [];

  @override
  void initState() {
    super.initState();
    // Dastlab ingredientsCount = 1 deb faraz qilinadi.
    ingredientsControllers.add({
      'amt': TextEditingController(),
      'ingr': TextEditingController(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecipeCreateBloc(),
      child: Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: "Create Recipe",
          actions: [],
        ),
        body: BlocBuilder<RecipeCreateBloc, RecipeCreateState>(
          builder: (context, state) {
            // ingredientsControllers ro'yxatini blok holatidagi ingredientsCount ga moslashtiramiz
            while (ingredientsControllers.length < state.ingredientsCount) {
              ingredientsControllers.add({
                'amt': TextEditingController(),
                'ingr': TextEditingController(),
              });
            }
            while (ingredientsControllers.length > state.ingredientsCount) {
              ingredientsControllers.removeLast();
            }

            return ListView(
              controller: controller,
              padding: EdgeInsets.fromLTRB(36.w, 20.h, 36.w, 120.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeTextButtonContainer(
                      text: "Publish",
                      textColor: AppColors.pinkSub,
                      containerColor: AppColors.pink,
                      callback: () {
                        // Bu yerda submit eventini yuborishingiz mumkin:
                        context
                            .read<RecipeCreateBloc>()
                            .add(RecipeCreateSubmit());
                      },
                      containerWidth: 177.w,
                      containerHeight: 27.h,
                    ),
                    RecipeTextButtonContainer(
                      text: "Delete",
                      textColor: AppColors.pinkSub,
                      containerColor: AppColors.pink,
                      callback: () {},
                      containerWidth: 177.w,
                      containerHeight: 27.h,
                    ),
                  ],
                ),
                SizedBox(height: 26.h),
                Container(
                  height: 281.h,
                  decoration: BoxDecoration(
                    color: AppColors.brownish,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: 26.h),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RecipeTextFormField(
                        label: "Title",
                        hintText: "Recipe Title",
                        controller: titleController,
                      ),
                      RecipeTextFormField(
                        label: "Description",
                        hintText: "Recipe Description",
                        minLines: 2,
                        maxLines: 3,
                        controller: descriptionController,
                      ),
                      RecipeTextFormField(
                        label: "Time Required (mins)",
                        hintText: "15, 25, 30...",
                        controller: timeController,
                      ),
                      Text(
                        "Ingredients",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ReorderableListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          for (int i = 0; i < ingredientsControllers.length; i++)
                            Padding(
                              key: ValueKey(i),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: RecipeCreateIngredientItem(
                                index: i,
                                amtController:
                                ingredientsControllers[i]['amt']!,
                                ingrController:
                                ingredientsControllers[i]['ingr']!,
                                callback: () {
                                  // Agar ingredient o'chirishni istasangiz,
                                  // ingredientsControllers ni lokal holatda yangilashingiz mumkin.
                                  // Shu yerda blokga ham xabar yuborish mumkin, lekin hozir faqat lokal o'chirish ko'rsatilmoqda.
                                  setState(() {
                                    ingredientsControllers.removeAt(i);
                                    // Agar ingredientsCount ni yangilash kerak bo'lsa, bu yerda mos event qo'shish mumkin.
                                  });
                                },
                              ),
                            ),
                        ],
                        onReorder: (oldIndex, newIndex) {
                          if (newIndex > oldIndex) newIndex--;
                          final oldItem =
                          ingredientsControllers.removeAt(oldIndex);
                          ingredientsControllers.insert(newIndex, oldItem);
                          setState(() {});
                        },
                      ),
                      Center(
                        child: RecipeTextButtonContainer(
                          text: "+ Add Ingredient",
                          textColor: AppColors.beigeColor,
                          containerColor: AppColors.redPinkMain,
                          containerWidth: 211.w,
                          containerHeight: 35.h,
                          callback: () {
                            // Yangi ingredient qo'shish uchun RecipeCreateAddIngredient eventini yuboramiz
                            context
                                .read<RecipeCreateBloc>()
                                .add(RecipeCreateAddIngredient());
                            controller.animateTo(
                              controller.offset + 72,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOutExpo,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Instructions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ReorderableListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          for (int i = 0; i < instructions.length; i++)
                            Padding(
                              key: ValueKey(i),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: RecipeCreateInstructionItem(
                                index: i,
                                instController: instructions[i],
                                callback: () {
                                  instructions.removeAt(i);
                                  setState(() {});
                                },
                              ),
                            ),
                        ],
                        onReorder: (oldIndex, newIndex) {
                          if (newIndex > oldIndex) newIndex--;
                          final oldInst = instructions.removeAt(oldIndex);
                          instructions.insert(newIndex, oldInst);
                          setState(() {});
                        },
                      ),
                      Center(
                        child: RecipeTextButtonContainer(
                          text: "+ Add Instruction",
                          textColor: AppColors.beigeColor,
                          containerColor: AppColors.redPinkMain,
                          containerWidth: 211.w,
                          containerHeight: 35.h,
                          callback: () {
                            instructions.add(TextEditingController());
                            setState(() {});
                            controller.animateTo(
                              controller.offset + 72,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOutExpo,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
