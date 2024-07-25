import 'dart:io';
import 'dart:typed_data';

import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/features/user/data/model/usermodel.dart';

abstract class ProfileRepository {
  Future<ApiResponse> getUserDetails(String uID);
  Future<ApiResponse> updateProfile(Usermodel userinfo, {Uint8List? imageFile});
  Future<String?> uploadImage(File Image);
}
