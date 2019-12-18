import 'package:flutter/material.dart';
import 'package:pariwisata/styles/layout.dart';
import 'package:pariwisata/styles/palete.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


void showErrorAlert(BuildContext context, String title, String message) {
  try {
     Alert(
    context: context,
    type: AlertType.error,
    title: title,
    desc: message,
    style: AlertStyle(
      overlayColor: Colors.grey.shade700.withOpacity(0.5),
      isCloseButton: false,
      animationType: AnimationType.grow,
     
     
    ),
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(
              color: Colors.black,),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        color: P.white,
      ),
    ],
  ).show();
  } catch (e) {
    print(e);
  }
}

showAlertExit(BuildContext context, {Function ok}) {
  Alert(
    context: context,
    type: AlertType.none,
    title: "LOGOUT",
    desc: "Apakah Anda Yakin\nIngin Logout ?",
    style: AlertStyle(
      overlayColor: Colors.grey.shade700.withOpacity(0.5),
      isCloseButton: false,
      animationType: AnimationType.grow,            
    ),
    buttons: [
      DialogButton(
        child: Text(
          "Ok",
          style: TextStyle(
              color: Colors.black,),
        ),
        onPressed: () {
          ok();
        },
        color: P.white,
      ),
      DialogButton(
        child: Text(
          "Cancel",
          style: TextStyle(
              color: Colors.black, ),
        ),
        onPressed: () => Navigator.pop(context),
        color: P.white,
      )
    ],
  ).show();
}

showAlertSukses({BuildContext context, Function ok, title, desc}) {
  Alert(
    context: context,
    type: AlertType.success,
    title: title,
    desc: desc,
    style: AlertStyle(
      overlayColor: Colors.grey.shade700.withOpacity(0.5),
      isCloseButton: false,
      animationType: AnimationType.grow,
      descStyle: TextStyle(
      ),
      titleStyle: TextStyle(
      ),
    ),
    buttons: [
      DialogButton(
        child: Text(
          "Ok",
          style: TextStyle(
              color: Colors.black, ),
        ),
        onPressed: () {
          ok();
        },
        color: P.white,
      ),      
    ],
  ).show();
}
