import 'package:flutter/material.dart';

import '../../model/video_model.dart';

class ActionsRowWidget extends StatelessWidget {
  VideoModel video;

  ActionsRowWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAction(context, Icons.thumb_up_outlined, video.likes),
        _buildAction(context, Icons.thumb_down_outlined, video.dislikes),
        _buildAction(context, Icons.reply_outlined, "Share"),
        _buildAction(context, Icons.download, "Download"),
        _buildAction(context, Icons.library_add_outlined, "Save")
      ],
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          SizedBox(
            height: 6,
          ),
          Text(label)
        ],
      ),
    );
  }
}
