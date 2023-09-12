import 'dart:convert';

import 'package:http/http.dart';

import '../model/post_model.dart';
import 'log_service.dart';

class Network {
  static String BASE = "64fd70e3596493f7af7e3b46.mockapi.io";
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  };
  //APIS
  static String API_POST = '/users';
  static String API_CREATE = '/users';
  static String API_UPDATE = '/users/'; //ID
  static String API_DELETE = '/users/'; //ID

  //REQUESTS
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    LogService.i('Api $BASE$api');
    LogService.d('Params $params');
    LogService.w('Response ${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    LogService.i('Api $BASE$api');
    LogService.d('Params $params');
    LogService.w('Response ${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    LogService.i('Api $BASE$api');
    LogService.d('Params $params');
    LogService.w('Response ${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    LogService.i('Api $BASE$api');
    LogService.d('Params $params');
    LogService.w('Response ${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  //PARAMS
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, dynamic> paramsCreate(Post post) {
    Map<String, dynamic> params = {};
    params.addAll({
      'title': post.title.toString(),
      'body': post.body.toString(),
      'userId': post.userId,
    });
    return params;
  }

  static Map<String, dynamic> paramsUpdate(Post post) {
    Map<String, dynamic> params = {};
    params.addAll({
      'id': post.id.toString(),
      'title': post.title.toString(),
      'body': post.body.toString(),
      'userId': post.userId,
    });
    return params;
  }

  //Http parsing
  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
}
