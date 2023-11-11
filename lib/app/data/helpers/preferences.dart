import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instancia = Preferences._internal();

  factory Preferences() {
    return _instancia;
  }

  static SharedPreferences? _prefs;

  Preferences._internal();

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  clearPreferences() async {
    await _prefs!.clear();
  }

  static String? get usuario {
    return _prefs!.getString('usuario');
  }

  static set usuario(String? value) {
    _prefs!.setString('usuario', value!);
  }
}
