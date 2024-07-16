import 'package:get/get.dart';
import 'package:s_store/common/widgets/custom_loader.dart';
import 'package:s_store/data/repositories/category/category_repository.dart';
import 'package:s_store/featues/shop/models/category_model.dart';
import 'package:s_store/utils/theme/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  //load category data
  Future<void> fetchCategory() async {
    try {
      //loader
      isLoading.value = true;
      //Fetch category data
      final categories = await _categoryRepository.getCategories();
      //update category data
      allCategories.assignAll(categories);
      //filter
      featuredCategories.assignAll(
        allCategories
            .where(
                (category) => category.isFeatured && category.parentId.isEmpty)
            .take(8)
            .toList(),
      );
    } catch (e) {
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
