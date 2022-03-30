import 'package:shared_preferences/shared_preferences.dart';

//No es objetivo del sharedpreferences hacer cambios grandes en el arbol de widgets
class Preferences {
  // static para no crear instancias y que sea la misma
  static late SharedPreferences _prefs;

  static String _name = '';
  static bool _isDarkMode = false;
  static int _gender = 1;

  //se expondra mediante getters y setters
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //se utiliza para no usarlo con instancias static
  //se manda al llamar el setter y luego con el getter obtengo
  static String get name {
    //validar un valor nulo si no existe, retorna el nombre
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isDarkMode {
    //validar un valor nulo si no existe, retorna el nombre
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static int get gender {
    //validar un valor nulo si no existe, retorna el nombre
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', value);
  }
}
