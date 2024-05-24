import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_clone/model/video_model.dart';
import 'package:timeago/timeago.dart' as timeage;
import 'package:youtube_clone/view/screens/search_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        body: ListView.builder(
          itemCount: VideoModel.videos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // ListTile'a tıklandığında yapılacak işlem
              },
              child: Padding(
                padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      foregroundImage: NetworkImage(
                        VideoModel.videos[index].author.profileImagePath,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            VideoModel.videos[index].title,
                          ),
                          Text(
                            timeage.format(VideoModel.videos[index].timestamp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 18),
                    Flexible(
                      child: Image.network(
                        VideoModel.videos[index].thumbnailUrl,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        // Videoyu oynat
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
