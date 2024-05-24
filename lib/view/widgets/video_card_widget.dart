import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeage;
import 'package:youtube_clone/model/video_model.dart';
import 'package:youtube_clone/provider/miniplayer_provider.dart';
import 'package:youtube_clone/provider/video_selected_provider.dart';

import 'more_widget.dart';

class VideoCardWidget extends StatefulWidget {
  VideoModel video;
  VideoCardWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  State<VideoCardWidget> createState() => _VideoCardWidgetState();
}

class _VideoCardWidgetState extends State<VideoCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final miniProvider =
            Provider.of<MiniplayerProvider>(context, listen: false)
                .miniplayerController;
        Provider.of<VideoSelectedProvider>(context, listen: false)
            .selectVideo(widget.video);
        if (miniProvider != null) {
          miniProvider.animateToHeight(state: PanelState.MAX);
        } else {
          print("sa");
        }
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                  height: 220,
                  width: double.infinity,
                  widget.video.thumbnailUrl),
              Positioned(
                  bottom: 8,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    color: Colors.black,
                    child: Text(
                      widget.video.duration,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    print("profile");
                  },
                  child: CircleAvatar(
                    foregroundImage:
                        NetworkImage(widget.video.author.profileImagePath),
                  ),
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
                        widget.video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 15),
                      )),
                      Flexible(
                        child: Text(
                          '${widget.video.author.username} ● ${widget.video.viewCount} ● ${timeage.format(widget.video.timestamp)}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () => showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => MoreWidget(),
                        ),
                    icon: Icon(
                      Icons.more_vert,
                      size: 20,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
