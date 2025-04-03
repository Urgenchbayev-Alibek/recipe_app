// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../manager/following_bloc.dart';
// import '../manager/following_state.dart';
//
// class FollowingView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Following")),
//       body: BlocBuilder<FollowingBloc, FollowingState>(
//         builder: (context, state) {
//           if (state is FollowingLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is FollowingLoaded) {
//             return ListView.builder(
//               itemCount: state.users.length,
//               itemBuilder: (context, index) {
//                 final user = state.users[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: NetworkImage(user.profilePhoto),
//                   ),
//                   title: Text(user.firstName + " " + user.lastName),
//                   subtitle: Text(user.username),
//                   trailing: ElevatedButton(
//                     onPressed: () {},
//                     child: Text("Following"),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text("Error loading data"));
//           }
//         },
//       ),
//     );
//   }
// }
