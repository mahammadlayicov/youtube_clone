import 'package:flutter/material.dart';
import 'package:youtube_clone/model/user_model.dart';
import 'package:youtube_clone/view/screens/notification_screen.dart';
import 'package:youtube_clone/view/screens/search_screen.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 100,
      leading: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Image.asset("lib/assets/youtube_logo.png")),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotificationScreen()));
            },
            icon: Icon(Icons.notifications_outlined)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {},
            icon: CircleAvatar(
                foregroundImage:
                    NetworkImage(UserModel.currentUser.profileImagePath)))
      ],
    );
  }
}
