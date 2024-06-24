import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/core/utils/date_time_utils.dart';

class ReviewModel {
  ReviewModel({
    this.userID,
    required this.userName,
    required this.imagePath,
    required this.message,
    required this.time,
    this.rating,
  });
  String? userID;
  String? userName;
  String? imagePath;
  String? message;
  double? rating;
  String? time;

  ReviewModel.fromJson(Map<String, dynamic> json) {
    DateTime date = json['time'].toDate();
    //  DateTime.fromMillisecondsSinceEpoch(int.parse(json['time'].toString()));
    String formattedDate = date.customFormat();
    message = json['message'];
    rating = double.parse((json['rating']).toString());
    time = formattedDate;
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    data['rating'] = this.rating;
    data['time'] = this.time;
    data['userID'] = this.userID;
    return data;
  }
}

const String userMsg =
    'Perfect for keeping your feet dry and warm in damp conditions';

List<ReviewModel> reviewListinfo = [
  ReviewModel(
      userName: 'Nolan Carder',
      imagePath: '${Constants.imgUser}/user1.png',
      message: userMsg,
      rating: 5.00,
      time: 'Today'),
  ReviewModel(
      userName: 'Maria Saris',
      imagePath: '${Constants.imgUser}/user2.png',
      message: userMsg,
      rating: 4.00,
      time: 'Today'),
  ReviewModel(
    userName: 'Gretchen Septimus',
    imagePath: '${Constants.imgUser}/user3.png',
    message: userMsg,
    time: 'Today',
    rating: 5.00,
  ),
  ReviewModel(
      userName: 'Roger Stanton',
      imagePath: '${Constants.imgUser}/user4.png',
      message: userMsg,
      rating: 4.00,
      time: 'Today'),
  ReviewModel(
    userName: 'Hanna Levin',
    imagePath: '${Constants.imgUser}/user5.png',
    message: userMsg,
    time: 'Today',
    rating: 5.00,
  ),
];
