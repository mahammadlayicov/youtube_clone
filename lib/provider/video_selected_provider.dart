import 'package:youtube_clone/model/video_model.dart';
import 'package:flutter/material.dart';

class VideoSelectedProvider extends ChangeNotifier {
  VideoModel? _video;
  VideoModel? get video => _video;
  void selectVideo(VideoModel? video) {
    _video = video;
    notifyListeners();
  }
}
