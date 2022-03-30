import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        //drawer
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("isDarkmode: ${Preferences.isDarkMode}"),
            const Divider(),
            Text('Género: ${Preferences.gender}'),
            const Divider(),
            Text("Nombre de usuario: ${Preferences.name} "),
            const Divider(),
          ],
        ));
  }
}
