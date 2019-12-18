import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'package:pariwisata/styles/alert.dart';
import 'package:pariwisata/styles/palete.dart';

Future updateData(
  BuildContext context, {
  String title,
  desc,
  city,
  prov,
  photo,
  token,
  id,
}) async {
  Map<String, String> data = {
    "title": title,
    "description": desc,
    "city": city,
    "province": prov,
    "photo": photo,
  };

  final url = P.url + "/product/update/" + id;

  var body = json.encode(data);

  final progress = ProgressHUD.of(context);
  progress.showWithText('Mohon Menunggu...');

  final response = await http.put(url,
      body: body,
      headers: {'Content-Type': 'application/json', 'token': token});
  if (response.statusCode == 200) {
    progress.dismiss();
    showAlertSukses(
        title: "Sukses",
        context: context,
        desc: "Data berhasil diupdate",
        ok: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/Home', (Route<dynamic> route) => false);
        });
    return response;
  } else {
    print(response.body);
    progress.dismiss();
    showErrorAlert(context, "Gagal Edit Data", "\nMohon Isi Data dengan benar");
    return null;
  }
}
