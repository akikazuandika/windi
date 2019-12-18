import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pariwisata/models/datamodel.dart';
import 'package:pariwisata/styles/palete.dart';

Future<DataModel> getPost({String token}) async {
  final response = await http.get("${P.url}/product",
      headers: {'Content-Type': 'application/json', 'token': token});

  if (response.statusCode == 200) {
    return dataModelFromJson(response.body);
  } else if (response.statusCode == 201) {
    print("success kirim data");
  } else {
    throw Exception('Failed to load post');
  }
}
