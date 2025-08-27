import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observable variables
  final currentIndex = 0.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize home screen
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
