import 'package:get/get.dart';

import '../../../app/constants/img_res.dart';

class BannerController extends GetxController {
  // variables
  final isLoading = false.obs;
  final cursousalCurrentIndex = 0.obs;
  final List<String> banners = [IMGRes.banner1, IMGRes.banner2, IMGRes.banner3];

  void updatePageIndecator(index) {
    cursousalCurrentIndex.value = index;
  }
}
