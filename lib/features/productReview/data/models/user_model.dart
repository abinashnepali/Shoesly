class UserModel {
  UserModel({required this.userName, required this.imagePath});
  String? userName;
  String? imagePath;

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    imagePath = json['imagePath'];
  }
}
