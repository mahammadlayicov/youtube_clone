import 'package:youtube_clone/model/user_model.dart';

class VideoModel {
  final String id;
  final UserModel author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;
  VideoModel({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
  static final List<VideoModel> videos = [
    VideoModel(
        id: "123456",
        author: UserModel.currentUser,
        title: "I Built 7 SECRET Rooms You'd Never Find!",
        thumbnailUrl:
            "https://i.ytimg.com/vi/71T_y3bnKCg/maxresdefault_custom_1.jpg",
        duration: "32:11",
        timestamp: DateTime(2024, 02, 16),
        viewCount: "589K",
        likes: "12.300",
        dislikes: "8"),
    VideoModel(
        id: "123456",
        author: UserModel.currentUser,
        title: "I Built a SECRET 7-11 in My Room!",
        thumbnailUrl: "https://i.ytimg.com/vi/eXosE1wewXg/maxresdefault.jpg",
        duration: "20:25",
        timestamp: DateTime(2022, 01, 30),
        viewCount: "951K",
        likes: "12.300",
        dislikes: "8"),
    VideoModel(
        id: "123456",
        author: UserModel.currentUser,
        title: "Eating 100 Years of McDonalds!",
        thumbnailUrl: "https://i.ytimg.com/vi/xuvci7Tyg9U/maxresdefault.jpg",
        duration: "17:12",
        timestamp: DateTime(2024, 02, 01),
        viewCount: "472K",
        likes: "12.300",
        dislikes: "8"),
    VideoModel(
        id: "123456",
        author: UserModel.currentUser,
        title: "I Built 5 SECRET Rooms You’d Never Find!",
        thumbnailUrl: "https://i.ytimg.com/vi/-5bcG6tZKx8/maxresdefault.jpg",
        duration: "26:25",
        timestamp: DateTime(2024, 01, 30),
        viewCount: "123K",
        likes: "12.300",
        dislikes: "8"),
 VideoModel(
        id: "123456",
        author: UserModel.currentUser,
        title: "Which Country has the Best School Lunch?",
        thumbnailUrl: "https://i.ytimg.com/vi/bKrOknHPdtc/maxresdefault.jpg",
        duration: "17:52",
        timestamp: DateTime(2024, 04, 21),
        viewCount: "2mln",
        likes: "12.300",
        dislikes: "8")
  ];
}
