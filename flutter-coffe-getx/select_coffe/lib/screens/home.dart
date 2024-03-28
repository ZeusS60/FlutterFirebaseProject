import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:select_coffe/controllers/auth_controller.dart';
import 'package:select_coffe/controllers/brew_controller.dart';

import 'settings_form.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final DatabaseController controller = Get.find<DatabaseController>();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context) {
        return Container(padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
        child: SettingsForm() 
        );

      },);
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.brown.shade500,
          title: Text("Brw Crew"),
          actions: [
            TextButton.icon(
                onPressed: () => AuthController.instance.signOut(),
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: Text(
                  "çıkış",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
            TextButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                label: Text(
                  "ayarlar",
                  style: TextStyle(color: Colors.black),
                ),
                )
          ]),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover)),
        child: Obx(() {
          if (controller.brews.isEmpty) {
            return Center(
              child: Text('No brews found.'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.brews.length,
              itemBuilder: (context, index) {
                final brew = controller.brews[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Card(
                    margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Colors.brown[brew.strength],
                        backgroundImage:
                            AssetImage('assets/images/icon.png'),
                      ),
                      title: Text(brew.name),
                      subtitle: Text('Takes ${brew.sugars} sugars'),
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
