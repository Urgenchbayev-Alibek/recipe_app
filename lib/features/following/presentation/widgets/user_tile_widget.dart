import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'following_button.dart';

class UserTileWidget extends StatelessWidget {
  final Map<String, String> user;
  const UserTileWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(user['image']!),
      ),
      title: Text(
        user['username']!,
        style: const TextStyle(color: Colors.pink),
      ),
      subtitle: Text(user['name']!, style: const TextStyle(color: Colors.grey)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           FollowingButton(),
           SizedBox(width: 1),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/three_dots.svg"),
          ),
        ],
      ),
    );
  }
}

