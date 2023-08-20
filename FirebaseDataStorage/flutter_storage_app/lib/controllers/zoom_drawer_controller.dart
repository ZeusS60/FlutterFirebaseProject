import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_storage_app/controllers/auth_controller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController{
  final  zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  @override
  void onReady(){
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }


  void toogleDrawer(){
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut(){
    Get.find<AuthController>().signOut();
  }

  void signIn(){

  }

  void website(){
    launch("https://www.youtube.com/channel/UCxun6k4SyIyWMpVIHKTK5BQ");
  }

   void facebook(){
    launch("https://www.facebook.com/huseyin.pala.3781995/");
  }

  void email(){
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'tb-pala@hotmail.com'
    );
    _launch(emailLaunchUri.toString());
  }
  Future<void> _launch(String url)async{
      if(!await launch(url)){
        throw 'could not launch $url';
      }
    }
}