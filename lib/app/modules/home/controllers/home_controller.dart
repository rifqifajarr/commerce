import 'package:commerce/app/data/response/products.dart';
import 'package:commerce/app/data/service/products_service.dart';
import 'package:commerce/app/modules/home/views/home_view.dart';
import 'package:commerce/app/modules/profile/views/profile_view.dart';
import 'package:commerce/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxList<Products> data = <Products>[].obs;

  final pages = [HomeView(), ProfileView()];

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void toDetail(Products data) {
    Get.toNamed(Routes.DETAIL, arguments: data);
  }

  @override
  void onReady() async {
    super.onReady();
    data.value = await ProductsService().fetchData();
  }
}
