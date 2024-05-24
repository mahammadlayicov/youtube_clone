import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';

class MiniplayerProvider extends ChangeNotifier {
  MiniplayerController? _miniplayerController;

  MiniplayerController? get miniplayerController => _miniplayerController;

  void setMiniplayerController(MiniplayerController? miniplayerController) {
    _miniplayerController = miniplayerController;
  }
}
