import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/provider/miniplayer_provider.dart';
import 'package:youtube_clone/provider/video_selected_provider.dart';
import 'package:youtube_clone/view/navbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MiniplayerProvider(),),
        ChangeNotifierProvider(create: (context) => VideoSelectedProvider()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
        title: "Youtube clone",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            bottomNavigationBarTheme:
                BottomNavigationBarThemeData(selectedItemColor: Colors.white)),
        home: NavbarScreen());
  }
}
