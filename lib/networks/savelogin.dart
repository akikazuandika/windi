
import 'package:pariwisata/models/loginmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future saveCurrentLogin(Map responseJson) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = (responseJson !=null && responseJson.isNotEmpty) ? LoginModel.fromJson(responseJson).token : "";
  var name = (responseJson !=null && responseJson.isNotEmpty) ? LoginModel.fromJson(responseJson).data.name : "";
  var email = (responseJson !=null && responseJson.isNotEmpty) ? LoginModel.fromJson(responseJson).data.email : "";
  var phone = (responseJson !=null && responseJson.isNotEmpty) ? LoginModel.fromJson(responseJson).data.phone : "";
  var username = (responseJson !=null && responseJson.isNotEmpty) ? LoginModel.fromJson(responseJson).data.username : "";

  await pref.setString('LastToken', (token != null && token.length > 0) ? token : "");
  await pref.setString('LastName', (name != null && name.length > 0) ? name : "");
  await pref.setString('LastEmail', (email != null && email.length > 0) ? email : "");
  await pref.setString('LastPhone', (phone != null && phone.length > 0) ? phone : "");
  await pref.setString('LastUsername', (username != null && username.length > 0) ? username : "");  
}
