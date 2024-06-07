import 'package:shoesly/crore/utils/constants.dart';

class ReviewModel {
  ReviewModel({
    this.userID,
    required this.userName,
    required this.imagePath,
    required this.reviewMessage,
    required this.time,
    this.rating,
  });
  int? userID;
  String? userName;
  String? imagePath;
  String? reviewMessage;
  double? rating;
  String? time;
}

const String userMsg =
    'Perfect for keeping your feet dry and warm in damp conditions';

List<ReviewModel> reviewListinfo = [
  ReviewModel(
      userID: 1,
      userName: 'Nolan Carder',
      imagePath: '${Constants.imgUser}/user1.png',
      reviewMessage: userMsg,
      rating: 5.00,
      time: 'Today'),
  ReviewModel(
      userID: 2,
      userName: 'Maria Saris',
      imagePath: '${Constants.imgUser}/user2.png',
      reviewMessage: userMsg,
      rating: 4.00,
      time: 'Today'),
  ReviewModel(
    userID: 3,
    userName: 'Gretchen Septimus',
    imagePath: '${Constants.imgUser}/user3.png',
    reviewMessage: userMsg,
    time: 'Today',
    rating: 5.00,
  ),
  ReviewModel(
      userID: 4,
      userName: 'Roger Stanton',
      imagePath: '${Constants.imgUser}/user4.png',
      reviewMessage: userMsg,
      rating: 4.00,
      time: 'Today'),
  ReviewModel(
    userID: 5,
    userName: 'Hanna Levin',
    imagePath: '${Constants.imgUser}/user5.png',
    reviewMessage: userMsg,
    time: 'Today',
    rating: 5.00,
  ),
];
