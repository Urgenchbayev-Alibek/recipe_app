import 'package:flutter/cupertino.dart';
import 'package:recipe_app/features/following/presentation/widgets/user_tile_widget.dart';

class UserListWidget extends StatelessWidget {
  final List<Map<String, String>> users;
  const UserListWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserTileWidget(user: users[index]);
      },
    );
  }
}