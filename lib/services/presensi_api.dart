import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:presensi_himaster/models/user_model.dart';

class PresensiApi {
  static var client = http.Client();

  static Future<Data?> loginAccount(String email, String password) async {
    const String apiUrl = "https://presensi.himaster.id/api/login";
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'email': email,
        'password': password,
      }
    );
    http.Response response = await client.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      UserModel respData = userModelFromJson(response.body);
      respData.data?.accessToken = 'Bearer ' + respData.data!.accessToken!;
      return respData.data;
    }else{
      return null;
    }
  }

  static Future logoutAccount(String token) async {
    const String apiUrl = "https://presensi.himaster.id/api/logout";
    var headers = {'Content-Type': 'application/json', 'Authorization': token,};
    var response = await client.post(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}