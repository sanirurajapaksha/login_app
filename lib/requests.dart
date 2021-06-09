import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:new_app/globals.dart' as globals;
import 'dart:async';
import 'dart:convert';

Future<http.Response> createUser() async {
  Map<String, String> headers = {
    HttpHeaders.authorizationHeader:
        'Token e5d0643308d9427d3d882ae3c7af0d3c73c544e9',
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Map<String, dynamic> userDetails = {
    'username': globals.username,
    'email': globals.email,
    'country': globals.country,
    'phone': globals.phone,
  };

  return http.post(
    Uri.parse('http://10.0.2.2:8000/api/profile/add/'),
    headers: headers,
    body: json.encode(userDetails),
  );
}
