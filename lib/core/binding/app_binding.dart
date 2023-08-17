import 'package:fitbasix_exercise/core/api/api.dart';
import 'package:get/get.dart';

import '../controller/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController(), tag: Api.app, fenix: true);
  }
}
