import 'package:shoesly/core/data/firebase/api_response.dart';
import 'package:shoesly/features/user/data/model/usermodel.dart';

abstract class AuthRepository {
  Future<bool> isAuthenticated();

  Future<void> logout();

  Future<ApiResponse> siginWithEmailFirebase(Usermodel params);

  Future<ApiResponse> signUPWithFirebase(Usermodel params);

  Future<ApiResponse> siginWithgoogleSigin();
}
