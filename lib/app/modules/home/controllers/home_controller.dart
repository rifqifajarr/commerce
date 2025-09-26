import 'package:commerce/app/data/response/products.dart';
import 'package:commerce/app/data/service/products_service.dart';
import 'package:commerce/app/modules/home/views/home_view.dart';
import 'package:commerce/app/modules/profile/views/profile_view.dart';
import 'package:commerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxList<Products> data = <Products>[].obs;
  RxList<Products> filteredData = <Products>[].obs;
  RxBool isLoading = false.obs;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  final pages = [HomeView(), ProfileView()];

  void changeTab(int index) {
    searchFocusNode.unfocus();
    currentIndex.value = index;
  }

  void toDetail(Products data) {
    searchFocusNode.unfocus();
    Get.toNamed(Routes.DETAIL, arguments: data);
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      data.value = await ProductsService().fetchData();
      filteredData.value = data;
    } catch (e) {
      debugPrint('Error fetching data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void searchProducts() {
    if (searchController.text.isEmpty) {
      filteredData.value = data;
    } else {
      filteredData.value = data
          .where(
            (product) => product.title.toLowerCase().contains(
              searchController.text.toLowerCase(),
            ),
          )
          .toList();
    }
  }

  void clearSearch() {
    searchController.clear();
    searchFocusNode.unfocus();
    filteredData.value = data;
  }

  @override
  void onReady() async {
    super.onReady();
    await fetchData();
  }

  @override
  void onClose() {
    searchFocusNode.dispose();
    searchController.dispose();
    super.onClose();
  }
}
