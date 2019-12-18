import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'package:pariwisata/styles/alert.dart';
import 'package:pariwisata/styles/palete.dart';

Future registerApi(
    {BuildContext context,
    String nama,
    String username,
    String telepon,
    String email,
    String password}) async {
  final progress = ProgressHUD.of(context);
  progress.showWithText('Mohon Menunggu...');

  Map data = {
    "name": nama,
    "username": username,
    "password": password,
    "email": email,
    "phone": telepon
  };

  var body = json.encode(data);
  var response;

  try {
    response = await http.post(
      "${P.url}/auth/register",
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
  } catch (e) {
    showErrorAlert(context, "Daftar Akun Gagal",
        "Pendaftaran Akun Gagal Dilakukan\n Mohon Mengisi Data Dengan Benar ");
    print(e);
  }

  try {
    if (response.statusCode == 200) {
      print(response.body);
      progress.dismiss();
      showAlertSukses(
          context: context,
          title: "Daftar Akun Sukses",
          desc:
              "Silahkan Login",
          ok: () {
            Navigator.pushNamedAndRemoveUntil(context, '/Login', (_) => false);
          });

      return response;
    } else {
      print(response.body);
      progress.dismiss();
      showErrorAlert(context, "Daftar Akun Gagal",
          "Pendaftaran Akun Gagal Dilakukan\n Mohon Mengisi Data Dengan Benar ");
      return null;
    }
  } catch (e) {
    progress.dismiss();

    showErrorAlert(context, "Daftar Akun Gagal",
        "Pendaftaran Akun Gagal Dilakukan\n Mohon Mengisi Data Dengan Benar ");
    print(e);
  }
}
