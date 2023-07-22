import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

import 'app.intercepter.dart';
import 'localstorage.dart';

class ApiProvider {

 static const url = "http://10.0.2.2:8080" ;

  static http.Client client = InterceptedClient.build(interceptors: [
    ApiInterceptor(),
  ]);

  static var headers = {HttpHeaders.contentTypeHeader: 'application/json'};

 static Future<http.Response> register(data) async {
    return http.post(Uri.parse('$url/api/v1/auth/register'), headers: headers , body: jsonEncode(data), encoding: Encoding.getByName("utf-8"));
  }
  static Future<http.Response> authenticate(data) async {
   return http.post(Uri.parse('$url/api/v1/auth/authenticate'), headers: headers , body: data, encoding: Encoding.getByName("utf-8"));
 }

 static Future<http.Response> addPropertyToOwner(data) async {
  String token = (await LocalStorage.getToken()).toString();
  var tokenHeaders = {
   HttpHeaders.authorizationHeader: 'Bearer $token',
   HttpHeaders.contentTypeHeader: 'application/json'
  };
  return client.post(Uri.parse('$url/owner/properties'), body: jsonEncode(data), headers: tokenHeaders, encoding: Encoding.getByName("utf-8"));
 }

}