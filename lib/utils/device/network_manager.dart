import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:s_store/utils/theme/loaders.dart';

class CNetworkManager extends GetxController {
  static CNetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      Loaders.errorSnackBar(
          title: 'No Internet Connection',
          message: 'Please check your internet connection');
    }
  }

  Future<bool> isInternetConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
