import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/sizes.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/singUp_view_model.dart';

class RecipeDataOfBirthField extends StatelessWidget {
  const RecipeDataOfBirthField({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var sd = context.select((SingUpViewModel vm) => vm.selectedDate);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            "Date Of Birth",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          GestureDetector(
            onTap: () async {
              context.read<SingUpViewModel>().selectedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
            },
            child: Container(
              padding: EdgeInsets.only(left: AppSizes.padding36),
              alignment: Alignment.centerLeft,
              width: 357 * AppSizes.wRatio,
              height: 41 * AppSizes.hRatio,
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                sd == null ? "DD/MM/YYYY" : "${sd.day}/${sd.month}/${sd.year}",
                style: TextStyle(
                  color: Colors.black.withValues(
                    alpha: sd == null ? 0.5 : 1,
                  ),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
