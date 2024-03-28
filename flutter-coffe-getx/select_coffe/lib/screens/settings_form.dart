import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:select_coffe/screens/textInputDecoration.dart';

import '../controllers/brew_controller.dart';

class SettingsForm extends StatefulWidget {
  SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final DatabaseController controller = Get.find<DatabaseController>();

  final TextEditingController nameC = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final List<String> sugars = ['0', '1', '2', '3', '4'];

  final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  String? _currentName = 'Hüseyin';

  String? _currentSugars = '0';

  int? _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Kahve ayarlarınızı güncelleyin.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(

              initialValue: _currentName ?? 'Hüseyin',
              decoration: textInputDecoration,
              validator: (val) => val!.isEmpty ? 'Lütfen bir isim girin' : null,
              onChanged: (val) => setState(
                    () => _currentName = val,
                  )),
          SizedBox(
            height: 10.0,
          ),
          DropdownButtonFormField(
              value: _currentSugars ?? 'default sugar',
              decoration: textInputDecoration,
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                    value: sugar, child: Text('$sugar sugars'));
              }).toList(),
              onChanged: (val) => setState(() => _currentSugars = val)),
          SizedBox(
            height: 10,
          ),
          Slider(
              value: (_currentStrength ?? 100).toDouble(),
              onChanged: (val) => _currentStrength = val.round(),
              activeColor: Colors.brown[_currentStrength ?? 100],
              inactiveColor: Colors.brown[_currentStrength ?? 100],
              min: 100.0,
              max: 900.0,
              divisions: 8,
              onChangeEnd: (val) => setState(
                    () => _currentStrength = val.round(),
                  )),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.pink[400]),
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await controller.updateUserData(_currentSugars ?? 'defautSugar',
                    _currentName ?? 'defaultName', _currentStrength ?? 100);
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}
