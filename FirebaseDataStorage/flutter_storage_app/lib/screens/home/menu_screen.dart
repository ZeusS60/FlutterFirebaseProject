import 'package:flutter/material.dart';
import 'package:flutter_storage_app/configs/themes/app_colors.dart';
import 'package:flutter_storage_app/controllers/zoom_drawer_controller.dart';
import 'package:get/get.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style:
                    TextButton.styleFrom(foregroundColor: onSurfaceTextColor))),
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  style: const ButtonStyle(
                    enableFeedback: false,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleDrawer();
                  },
                )),
            Padding(
              padding: EdgeInsets.only(
               
                  left: MediaQuery.of(context).size.width*0.05,
                  right: MediaQuery.of(context).size.width * 0.3),
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  CircleAvatar(backgroundImage: AssetImage('assets/images/yenicv.png',),radius: 40,),
                  SizedBox(height: 20,),
                  Obx(
                    () => controller.user.value == null
                        ? SizedBox()
                        : Text(
                            controller.user.value!.displayName ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: onSurfaceTextColor),
                          ),
                  ),
                  SizedBox(height: 45,),
                  
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _DrawerButton(icon: Icons.web, label: "website",onPressed: () => controller.website(),),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left:1),
                     child: _DrawerButton(icon: Icons.facebook, label: "facebook",onPressed: () => controller.facebook(),),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: _DrawerButton(icon: Icons.email, label: "email",onPressed: () => controller.email(),),
                    ),
                    const Spacer(flex: 4,),
                     _DrawerButton(icon: Icons.logout, label: "logout",onPressed: () => controller.signOut(),)
                     
                ],
              ),
            )
          ],
        )));
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {super.key, required this.icon, required this.label, this.onPressed});
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 15,
        ),
        label: Text(label));
  }
}
