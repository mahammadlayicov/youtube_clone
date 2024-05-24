import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:youtube_clone/model/user_model.dart';

class AuthorInfoWidget extends StatelessWidget {
  UserModel user;
  AuthorInfoWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          foregroundImage: NetworkImage(user.profileImagePath),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  user.username,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Flexible(
                child: Text(
                  '${user.subscribe} subscribers',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text("SUBSCRIBE",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.red)))
      ],
    );
  }
}
