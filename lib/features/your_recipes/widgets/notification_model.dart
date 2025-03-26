// import 'package:flutter/cupertino.dart';
//
// import 'notification_body.dart';
//
// class NotificationList extends StatelessWidget {
//   final List<NotificationModel> notifications = [
//     NotificationModel(
//
//       title: "Béchamel  Pasta",
//       description: "A creamy and indulgent",
//       time: "12:50",
//       rating: "4",
//     ),
//     NotificationModel(
//       title: "Meal Reminder",
//       description: "Time to cook your healthy meal of the day",
//       time: "15min",
//       rating: "5",
//     ),
//     NotificationModel(
//       title: "Grilled Skewers",
//       description: "Performance improvements and bug fixes.",
//       time: "20min",
//       rating: "5",
//     ),
//     NotificationModel(
//       title: "Reminder",
//       description: "Don't forget to complete your profile to \naccess all app features",
//       time: "27min",
//       rating: "4",
//     ),
//     NotificationModel(
//       title: "Important Notice",
//       description: "Remember to change your password \nregularly  to keep your account secure",
//       time: "27min",
//       rating: "4",
//     )
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: notifications.length,
//         itemBuilder: (context, index) {
//           return NotificationBody(notifications: notifications[index]);
//         },
//       ),
//     );
//   }
// }
//
//
// class NotificationModel {
//   final String title, description, time, rating;
//
//   NotificationModel({
//     required this.title,
//     required this.description,
//     required this.rating,
//     required this.time,
//   });
// }