import 'package:get/get.dart';

import 'package:shoesly/core/data/firebase/network_info.dart';
import 'package:shoesly/core/utils/pref_utils.dart';
import 'package:shoesly/features/user/data/repository/auth_repository.dart';
import 'package:shoesly/features/user/data/repository/auth_repository_impl.dart';
import 'package:shoesly/features/user/data/repository/profile_repository.dart';
import 'package:shoesly/features/user/data/repository/profile_repository_impl.dart';
import 'package:shoesly/features/user/presentation/controller.dart/auth_controller.dart';
import 'package:shoesly/features/user/presentation/controller.dart/profile_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<AuthRepository>(AuthRepositoryImpl(
          prefUtils: Get.find<PrefUtils>(),
          networkInfo: Get.find<NetworkInfo>()))
      ..put<AuthController>(AuthController(), permanent: true)
      ..put<ProfileRepository>(
          ProfileRepositoryImpl(networkInfo: Get.find<NetworkInfo>()))
      ..put<PorfileController>(
        PorfileController(),
      );
  }
}
