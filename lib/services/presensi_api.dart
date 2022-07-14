import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:presensi_himaster/models/list_absen.dart' as la;
import 'package:presensi_himaster/models/user_model.dart' as um;

class PresensiApi {
  static var client = http.Client();

  static Future<um.Data?> loginAccount(String email, String password) async {
    const String apiUrl = "https://presensi.himaster.id/api/login";
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    http.Response response =
        await client.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      um.UserModel respData = um.userModelFromJson(response.body);
      respData.data?.accessToken = 'Bearer ' + respData.data!.accessToken!;
      return respData.data;
    } else {
      return null;
    }
  }

  static Future logoutAccount(String token) async {
    const String apiUrl = "https://presensi.himaster.id/api/logout";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    http.Response response =
        await client.post(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<la.Data?> fetchAbsen(String token) async {
    const String apiUrl = "https://presensi.himaster.id/api/index";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    http.Response responses =
        await client.get(Uri.parse(apiUrl), headers: headers);
    if (responses.statusCode == 200) {
      var respData = json.decode(responses.body)['data'];
      la.Data data = la.Data.fromJson(respData);
      return data;
    } else {
      return null;
    }
  }

  static Future<bool> postAbsen(String code, String validateCode, int id,
      String desc, String title, String token) async {
    const String apiUrl = "https://presensi.himaster.id/api/post";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'code': code,
      'validate': validateCode,
      'id': id,
      'description': desc,
      'title': title
    });
    http.Response responses =
        await client.post(Uri.parse(apiUrl), headers: headers, body: body);
    
    if (responses.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
  }
  static Future<bool> postKegiatan(String code, String token) async {
    const String apiUrl = "https://presensi.himaster.id/api/addEvent";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'code': code,
    });
    http.Response responses =
        await client.post(Uri.parse(apiUrl), headers: headers, body: body);
    
    if (responses.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
  }
}
