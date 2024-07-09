import 'package:get/get.dart';
import 'package:s_store/utils/device/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CNetworkManager());
  }
}
