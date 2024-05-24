import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/provider/miniplayer_provider.dart';
import 'package:youtube_clone/provider/video_selected_provider.dart';
import 'package:youtube_clone/view/screens/home_screen.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/view/screens/video_screen.dart';
import 'package:youtube_clone/view/widgets/video_info_widget.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({Key? key}) : super(key: key);

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  static const _playerMinHeight = 60.0;
  int selectedIndex = 0;

  final screens = [
    HomeScreen(),
    Scaffold(
      body: Center(
        child: Text("Explore"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("Add"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("Subscription"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("Library"),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<VideoSelectedProvider>(builder: (context, value, child) {
        final selectedVideo = value.video;
        return Stack(
          children: screens
              .asMap()
              .map((i, screen) => MapEntry(
                    i,
                    Offstage(
                      offstage: selectedIndex != i,
                      child: screen,
                    ),
                  ))
              .values
              .toList()
            ..add(Offstage(
              offstage: selectedVideo == null,
              child: Consumer<MiniplayerProvider>(
                builder: (context, value, child) {
                  MiniplayerController? miniplayerController =
                      value.miniplayerController;

                  if (miniplayerController == null) {
                    miniplayerController = MiniplayerController();
                    value.setMiniplayerController(miniplayerController);
                  }
                  return Miniplayer(
                    controller: miniplayerController,
                    minHeight: _playerMinHeight,
                    maxHeight: MediaQuery.of(context).size.height,
                    builder: (height, percentage) {
                      if (selectedVideo == null) {
                        return const SizedBox.shrink();
                      }
                      if (height <= _playerMinHeight + 50) {
                        return Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    width: 120,
                                    height: _playerMinHeight - 4,
                                    fit: BoxFit.cover,
                                    selectedVideo.thumbnailUrl,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 180,
                                            child: Text(
                                              selectedVideo.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              '${selectedVideo.author.username}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Provider.of<VideoSelectedProvider>(
                                        context,
                                        listen: false,
                                      ).selectVideo(null);
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ],
                              ),
                              const LinearProgressIndicator(
                                value: 0.4,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.red),
                              ),
                            ],
                          ),
                        );
                      }
                      return VideoScreen();
                    },
                  );
                },
              ),
            )),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: "Subscription",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
            label: "Library",
          ),
        ],
      ),
    );
  }
}
