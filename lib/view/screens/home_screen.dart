import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_clone/model/video_model.dart';
import 'package:youtube_clone/view/widgets/custom_appbar_widget.dart';
import 'package:youtube_clone/view/widgets/video_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          CustomAppbarWidget(),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 60),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: VideoModel.videos.length,
                (context, index) {
                  final video = VideoModel.videos[index];
                  return VideoCardWidget(video: video);
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
