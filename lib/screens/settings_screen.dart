import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /*  bool isDarkMode = false;
  int gender = 1;
  String name = "Juan"; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              //adaptative para depender del sistema operativo que se usa
              SwitchListTile.adaptive(
                value: Preferences.isDarkMode,
                title: const Text('DarkMode'),
                onChanged: (bool value) {
                  Preferences.isDarkMode = value;
                  //iniciar instancia
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                },
              ),

              const Divider(),

              //Especificar con que dato trabaja el radiolisttile
              RadioListTile<int>(
                title: const Text("Masculino"),
                value: 1,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                },
              ),
              const Divider(),

              //Especificar con que dato trabaja el radiolisttile
              RadioListTile<int>(
                title: const Text("Femenino"),
                value: 2,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                },
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                      labelText: 'Nombre', helperText: 'Nombre del usuario'),
                ),
              )
            ]),
          ),
        ));
  }
}
