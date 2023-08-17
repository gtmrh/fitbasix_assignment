// ignore_for_file: prefer_final_fields


import 'package:get/get.dart';

import '../core/api/api.dart';
import '../core/controller/app_controller.dart';

MyApplication app = MyApplication();

class MyApplication {
  static final MyApplication _myApplication = MyApplication._i();
  AppController _appController = Get.find(tag: Api.app);

  factory MyApplication() {
    return _myApplication;
  }

  MyApplication._i() {}

  AppController get appController {
    return _appController;
  }
}
