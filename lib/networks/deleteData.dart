
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'package:pariwisata/styles/alert.dart';
import 'package:pariwisata/styles/palete.dart';

Future deleteData(
  BuildContext context, token, id) async {


  final url = P.url + "/product/delete/" + id;
 print(url);

  final progress = ProgressHUD.of(context);
  progress.show();

  final response = await http.post(
    url,    
      headers: {'Content-Type': 'application/json', 'token': token});


  if (response.statusCode == 200) {
    progress.dismiss();
    showAlertSukses(
        title: "Sukses",
        context: context,
        desc: "Data berhasil Dihapus",
        ok: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/Home', (Route<dynamic> route) => false);
        });
    return response;
  } else {
    print(response.body);
    progress.dismiss();
    showErrorAlert(context, "Gagal Hapus Data", "\nMohon Ulangi kembali");
    return null;
  }
}
