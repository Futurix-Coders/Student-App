import 'package:get/get.dart';
import '../../models/mar_models.dart';

class MarController extends GetxController {
  var certificates = <MarCertificate>[].obs;

  @override
  void onInit() {
    super.onInit();
    certificates.value = [
      MarCertificate(
        title: 'MAR Certificate 2023',
        description: 'Certificate for the year 2023',
        downloadUrl: 'https://example.com/mar2023.pdf',
      ),
      MarCertificate(
        title: 'MAR Certificate 2022',
        description: 'Certificate for the year 2022',
        downloadUrl: 'https://example.com/mar2022.pdf',
      ),
    ];
  }
}