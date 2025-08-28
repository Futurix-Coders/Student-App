import 'package:get/get.dart';
import '../../models/classroom_models.dart';

class ClassroomController extends GetxController {
  var classrooms = <Classroom>[].obs;

  @override
  void onInit() {
    super.onInit();
    classrooms.value = [
      Classroom(
        name: 'BCA Sem 1',
        description: 'Introduction to Computer Applications',
        profilePic: 'assets/images/splash.png',
      ),
      Classroom(
        name: 'BCA Sem 2',
        description: 'Advanced Programming Concepts',
        profilePic: 'assets/images/splash.png'
      ),
      Classroom(
        name: 'BCA Sem 3',
        description: 'Database Management Systems',
        profilePic: 'assets/images/splash.png',
      ),
    ];
  }

  void joinClassroom(Classroom classroom) {
    classroom.isJoined = true;
    classrooms.refresh();
    Get.snackbar('Joined', 'You have joined ${classroom.name}');
  }

  void changeIndex(int index) {
    switch (index) {
      case 0:
        Get.offAllNamed('/home');
        break;
      case 1:
        Get.offAllNamed('/classroom');
        break;
      case 2:
        Get.offAllNamed('/routine');
        break;
      case 3:
        Get.offAllNamed('/account');
        break;
    }
  }
}