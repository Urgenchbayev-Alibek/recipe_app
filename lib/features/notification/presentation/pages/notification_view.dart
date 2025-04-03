import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../Core/utils/colors.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../common/widgets/recipe_app_bar.dart';
import '../../../common/widgets/recipe_bottom_navigation_bar.dart';
import '../manager/notifications_bloc.dart';
import '../manager/notifications_state.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  String formatDateLabel(String inputDate) {
    DateTime date = DateTime.parse(inputDate);
    DateTime now = DateTime.now();

    if (DateFormat("yyyy-MM-dd").format(date) == DateFormat("yyyy-MM-dd").format(now)) {
      return "Today";
    } else {
      return DateFormat("EEEE", "en_US").format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const RecipeAppBar(
        title: 'Notification',
        actions: [],
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          final notifications = state.notification;

          return switch (state.notificationStatus) {
            NotificationsStatus.idle => const Center(child: Text("Idle")),
            NotificationsStatus.loading => const Center(child: CircularProgressIndicator()),
            NotificationsStatus.error => const Center(child: Text("Something went wrong!!!")),
            NotificationsStatus.success => notifications == null || notifications.isEmpty
                ? const Center(child: Text("No notifications available"))
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 20.h),
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatDateLabel(notification.date.toIso8601String()),
                            style: const TextStyle(fontFamily: "Poppins", fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            width: 355,
                            height: 75,
                            decoration: BoxDecoration(
                              color: AppColors.pink,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 12),
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/icons/star.svg",
                                      height: 27,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notification.title,
                                      style: const TextStyle(
                                        color: AppColors.pinkSub,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 252.w,
                                      child: Text(
                                        notification.subtitle,
                                        maxLines: 1,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Poppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                formatDate(notification.date.toIso8601String()),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
            _ => const Center(child: Text("Unknown state")),
          };
        },
      ),
      bottomNavigationBar: const RecipeBottomNavigationBar(),
    );
  }
}
