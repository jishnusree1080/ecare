import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {

  static const String getPusername = 'Pusername';
  static const String getEmail = 'Email';
  static const String getPhno = 'Phno';
  static const String getPassword = 'Password';


  static Future<void> setPusername(String Pusername, String Email, String Phno, String Password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(getPusername,Pusername);
    await prefs.setString(getEmail, Email);
    await prefs.setString(getPhno, Phno);
    await prefs.setString(getPassword, Password);
    print("$Pusername.......,.......$Email........,$Phno........,$Password");

  }



}