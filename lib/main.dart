import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/home_screen.dart';
import 'package:preferences_app/screens/settings_screen.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

//El main si puede ser asyncrono y se usa con el sharedpreferences en vez
//de crear un futurebuilder
void main() async {
  //HACER LOS ENLACES O CREAR LOS WIDGETS ANTES DE HACER LA INSTRUCCION DEL PREFERENCES
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(
    //El multiprovider tambien se puede inicializar en el runApp
    //Ademas que primero se ejecuta MyApp despues de las preferencias asi que por eso se puede usar el preferences inicializado
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
