import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:food_icons/food_icons.dart';
import 'package:monthly_expense_manage/widgets/custom_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon? _icon;


  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        customIconPack: myCustomIcons,
        iconPackModes: [IconPack.custom]);

    _icon = Icon(icon);
    setState(() {});

    debugPrint('Picked Icon:  $icon');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickIcon,
              child: const Text('Open IconPicker'),
            ),
            const SizedBox(height: 10),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _icon ?? Container(),
            ),
          ],
        ),
      ),
    );
  }
}