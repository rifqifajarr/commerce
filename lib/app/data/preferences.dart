import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  final SharedPreferences shared;

  Preferences(this.shared);

  set username(String? value) => shared.setString("username", value!);

  String? get username => shared.getString("username");

  static Future<Preferences> instance() =>
      SharedPreferences.getInstance().then((value) => Preferences(value));
}
