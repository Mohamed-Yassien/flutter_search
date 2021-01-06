import 'dart:convert';
import 'package:flutter_search_1/user_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<UserModel>> fetchUsers() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      final parsedData =
      json.decode(response.body).cast<Map<String, dynamic>>();
      return parsedData.map<UserModel>((post) => UserModel.fromJson(post)).toList();
    }
    else{
      return throw Exception('error');
    }
  }
}
