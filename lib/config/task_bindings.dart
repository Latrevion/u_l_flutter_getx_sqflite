import 'package:get/get.dart';
import 'package:u_l_flutter_getx_sqflite/controller/controller.dart';

class TaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SQLController());
  }
}
