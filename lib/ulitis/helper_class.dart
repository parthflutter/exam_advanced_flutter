import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/modelclass.dart';
class Apihelper {
  static final helper = Apihelper._();

  Apihelper._();

  Future<List<dynamic>> getapidata() async {
    String link = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/";
    Uri uri = Uri.parse(link);
    var response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'dfbf47b288mshfaffb05357f706ep1a4b83jsn90ed62e79227',
      'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com',
    });
    var json = jsonDecode(response.body);
    return json.map((e) => HomeModal.fromJson(e)).toList();
  }
}
