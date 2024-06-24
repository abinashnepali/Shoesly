import 'package:get/get.dart';
import 'package:shoesly/core/data/firebase/network_info.dart';
import 'package:shoesly/features/discover/data/repository/discovery_repository.dart';
import 'package:shoesly/features/discover/data/repository/discovery_repositoryimpl.dart';
import 'package:shoesly/features/discover/presentation/controller/discover_controller.dart';

class DiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<DiscoveryRepository>(
          DiscoveryRepositoryimpl(networkInfo: Get.find<NetworkInfo>()))
      ..put<DiscoverController>(DiscoverController());
  }
}
