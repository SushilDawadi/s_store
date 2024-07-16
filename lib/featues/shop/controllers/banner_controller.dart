import 'package:get/get.dart';
import 'package:s_store/data/repositories/banner/banner_repository.dart';
import 'package:s_store/featues/shop/models/banner_model.dart';
import 'package:s_store/utils/theme/loaders.dart';

class BannerController extends GetxController {
  static BannerController instance = Get.find();

  var currentIndex = 0.obs;

  @override
  void onInit() {
    fetchBanners();
  }

  void updateIndicator(int index) {
    currentIndex.value = index;
  }

  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxBool isLoading = false.obs;

  //
  fetchBanners() async {
    try {
      isLoading.value = true;
      //fetch
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.getBanners();
      this.banners.assignAll(banners);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
