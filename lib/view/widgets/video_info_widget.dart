import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeage;
import 'package:youtube_clone/view/widgets/author_info_widget.dart';

import '../../model/video_model.dart';
import 'actions_row_widget.dart';

class VideoInfoWidget extends StatelessWidget {
  VideoModel video;
  VideoInfoWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            video.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            ' ${video.viewCount} ● ${timeage.format(video.timestamp)}',
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
          ),
        ),
        const Divider(),
        ActionsRowWidget(video: video),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AuthorInfoWidget(user: video.author),
        ),
      ],
    );
  }
}
