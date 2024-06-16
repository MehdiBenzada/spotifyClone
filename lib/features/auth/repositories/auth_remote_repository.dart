import 'dart:convert';

import 'package:http/http.dart' as http;

class authRemoteRepository {
  Future signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response =
        await http.post(Uri.parse('http://10.0.2.2:8000/auth/signup'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'email': email,
              'password': password,
              'name': name,
            }));
    print(response.body);
    print(response.statusCode); 
    } catch (e) {
      print(e); 
    }
    
  }

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      final response =
        await http.post(Uri.parse('http://10.0.2.2:8000/auth/login'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'email': email,
              'password': password,
            }));
    print(response.body);
    print(response.statusCode); 
    } catch (e) {
      print(e); 
    }
    
  }
}
