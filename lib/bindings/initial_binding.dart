import 'package:get/get.dart';
import 'package:quiz/controllers/common/theme_controller.dart';
import 'package:quiz/services/services.dart';
import '../controllers/auth_controller.dart';
import '../controllers/quiz_paper/papers_data_uploader.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() =>  FireBaseStorageService());
  }
}
