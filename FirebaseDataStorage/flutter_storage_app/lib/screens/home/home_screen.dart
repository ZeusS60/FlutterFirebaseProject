import 'package:flutter/material.dart';
import 'package:flutter_storage_app/configs/themes/app_colors.dart';
import 'package:flutter_storage_app/configs/themes/app_icons.dart';
import 'package:flutter_storage_app/configs/themes/custom_text_styles.dart';
import 'package:flutter_storage_app/configs/themes/ui_parameters.dart';
import 'package:flutter_storage_app/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_storage_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_storage_app/screens/home/menu_screen.dart';
import 'package:flutter_storage_app/screens/home/question_card.dart';
import 'package:flutter_storage_app/widgets/app_circle_button.dart';
import 'package:flutter_storage_app/widgets/content_area.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';


class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

   static const String routeName ="/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
      
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: mainGradient()
        ),
        child: GetBuilder<MyZoomDrawerController>(builder: (_) {
            return ZoomDrawer(
              borderRadius: 50.0,
              controller: _.zoomDrawerController,
              showShadow: true,
              angle: 0.0,
              style: DrawerStyle.defaultStyle,
              slideWidth: MediaQuery.of(context).size.width*0.8,
              menuScreen:  const MyMenuScreen(),
              mainScreen: MainScreen(controller: controller, questionPaperController: questionPaperController),);
            
          },),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.controller,
    required this.questionPaperController,
  });

  final MyZoomDrawerController controller;
  final QuestionPaperController questionPaperController;

  @override
  Widget build(BuildContext context) {
    return  Container(
            decoration: BoxDecoration(gradient: mainGradient()),                    
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          onTap: controller.toogleDrawer,
                          child: const  Icon(AppIcons.menuLeft,)),
                        const  SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(children: [
                              const Icon(AppIcons.peace,),
                              Text("Hello friend",
                              style: detailText.copyWith(
                                color: onSurfaceTextColor
                              ),)
                          ],),
                        ),
                        Text("What do you want to learn\ntoday?",style: headerText.copyWith(color: onSurfaceTextColor),)
                      ],
                    ),
                  ),
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8),
                       child: ContentArea(
                         addPadding: false,      
                         child: Obx(() => ListView.separated(
                           shrinkWrap: true,
                           padding: UIParameters.mobileScreenPadding,
                           physics: const BouncingScrollPhysics(),
                         itemBuilder: (context, index) {
                         return  QuestionCard(model:questionPaperController.allPapers[index],);
                             },
                             separatorBuilder: (context, index) {
                         return const SizedBox(height: 20,);
                             },
                             itemCount: questionPaperController.allPapers.length,
                             ),),
                       ),
                     ),
                   )
                ],
              ),
            )
          );
  }
}