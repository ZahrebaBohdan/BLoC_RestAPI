import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserProvider {
  // https://jsonplaceholder.typicode.com/users
  Future<List<User>> getUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List userJson = jsonDecode(response.body);
      print(userJson);
      print(userJson.runtimeType);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
