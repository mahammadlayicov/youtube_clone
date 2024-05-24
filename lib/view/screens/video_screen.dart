import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/model/video_model.dart';
import 'package:youtube_clone/provider/miniplayer_provider.dart';
import 'package:youtube_clone/provider/video_selected_provider.dart';
import 'package:youtube_clone/view/widgets/video_card_widget.dart';
import 'package:youtube_clone/view/widgets/video_info_widget.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Consumer<VideoSelectedProvider>(
                builder: (context, value, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.network(value.video!.thumbnailUrl),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            onPressed: () {
                              final miniProvider =
                                  Provider.of<MiniplayerProvider>(context,
                                          listen: false)
                                      .miniplayerController;
                              if (miniProvider != null) {
                                miniProvider.animateToHeight(
                                    state: PanelState.MIN);
                              } else {
                                print("sa");
                              }
                            },
                          ),
                        ],
                      ),
                      const LinearProgressIndicator(
                        value: 0.4,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                      VideoInfoWidget(video: value.video!)
                    ],
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: VideoModel.videos.length,
                (context, index) {
                  final video = VideoModel.videos[index];
                  return VideoCardWidget(video: video);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
