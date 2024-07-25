import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shoesly/core/data/firebase/firebase_services.dart';
import 'package:shoesly/core/presentation/routes/app_routes.dart';
import 'package:shoesly/core/presentation/widgets/toast.dart';
import 'package:shoesly/core/utils/constants.dart';
import 'package:shoesly/features/user/data/model/usermodel.dart';

import 'package:shoesly/features/user/data/repository/auth_repository.dart';

class AuthController extends GetxController {
  late AuthRepository _authRepository;
  RxBool isLoggedIn = false.obs;

  RxBool isLoading = false.obs;

  RxBool islogin = true.obs;

  late User _user;

  @override
  void onInit() {
    super.onInit();

    _authRepository = Get.find<AuthRepository>();
    isLoggedIn.value = FirebaseService.isAuthenticated();
  }

  // void authStateChanges() {
  //   FirebaseService.authStateUpdate.listen((user) {
  //     if (user == null) {
  //       isLoggedIn.value = false;
  //     } else {
  //       setauthUser = user;

  //       isLoggedIn.value = true;
  //     }
  //   });
  // }

//logout
  void logout() async {
    isLoading.value = true;
    await _authRepository.logout();
    isLoading.value = false;
    isLoggedIn.value = false;
    Get.toNamed(Routes.homeTabContainer);
  }

  //login

  Future<void> signInWithEmail(Usermodel params) async {
    isLoading.value = true;
    final signInResponse = await _authRepository.siginWithEmailFirebase(params);
    isLoading.value = false;
    if (signInResponse.hasError) {
      showFailureToast(signInResponse.error.toString());
    }
    if (signInResponse.hasData) {
      showToast(Constants.loginsucess);
      authorize();
      Get.back();
      Get.offNamed(Routes.homeTabContainer);
    }
  }

  // Register SignUp

  void signUpWithEmail(Usermodel params) async {
    isLoading.value = true;
    final signUpResponse = await _authRepository.signUPWithFirebase(params);
    isLoading.value = false;
    if (signUpResponse.hasError) {
      if (signUpResponse.error != []) {
        showFailureToast(signUpResponse.error.toString());
      } else {
        showFailureToast(Constants.signUpSucess);
      }
    } //
    else if (signUpResponse.hasData) {
      authorize();
      showToast(Constants.signUpSucess);
      Get.offNamed(Routes.homeTabContainer);
    }
  }

  void handleGoogleSignIn() async {
    isLoading.value = true;
    final response = await _authRepository.siginWithgoogleSigin();
    isLoading.value = false;

    if (response.hasData) {
      final userData = response.data.user;
      if (userData != null) {
        setauthUser = userData;
      }
    }
  }

  authorize() {
    isLoggedIn.value = true;
  }

  set setauthUser(User auhtuser) {
    _user = auhtuser;
  }

  User get userFirebase => _user;

  bool get checklogin => isLoggedIn.value;
}
