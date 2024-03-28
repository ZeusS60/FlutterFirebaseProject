
import 'package:get/get.dart';
import 'package:select_coffe/controllers/brew_controller.dart';

import '../controllers/auth_controller.dart';


class InitialBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(AuthController(),permanent: true);


  }

}