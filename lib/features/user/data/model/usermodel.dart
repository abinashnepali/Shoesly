import 'dart:io';

class Usermodel {
  Usermodel(
      {this.username,
      this.email,
      this.phonenumber,
      this.photoURL,
      this.confirmPassword,
      this.address});
  String? username;
  String? email;
  String? phonenumber;
  File? photoFile;
  String? password;
  String? confirmPassword;
  String? address;
  String? photoURL;

  Usermodel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    photoURL = json['photoURL'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    data['photoURL'] = photoURL ?? '';

    data['address'] = address ?? '';
    return data;
  }
}
