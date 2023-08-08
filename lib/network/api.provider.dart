import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

import 'app.intercepter.dart';
import 'localstorage.dart';

class ApiProvider {

 // static const url = "http://10.0.2.2:8080/api/v1" ;
 static const url = "http://192.168.13.37:8080/api/v1" ;

  static http.Client client = InterceptedClient.build(interceptors: [
    ApiInterceptor(),
  ]);

  static var headers = {HttpHeaders.contentTypeHeader: 'application/json'};

 static Future<http.Response> register(data) async {
    return http.post(Uri.parse('$url/auth/register'), headers: headers , body: jsonEncode(data), encoding: Encoding.getByName("utf-8"));
  }
  static Future<http.Response> authenticate(data) async {
   return http.post(Uri.parse('$url/auth/authenticate'), headers: headers , body: jsonEncode(data), encoding: Encoding.getByName("utf-8"));
 }

 static Future<http.Response> addPropertyToOwner(data) async {
  String token = (await LocalStorage.getToken()).toString();
  var tokenHeaders = {
   HttpHeaders.authorizationHeader: 'Bearer $token',
   HttpHeaders.contentTypeHeader: 'application/json'
  };
  print("TOKEN ???????");
  print(Uri.parse('$url/owner/properties'));
  print(token);
  return http.post(Uri.parse('$url/owner/properties'), body: jsonEncode(data), headers: tokenHeaders, encoding: Encoding.getByName("utf-8"));
 }

static Future<http.Response> addOperation(data) async {
  String token = (await LocalStorage.getToken()).toString();
  var tokenHeaders = {
   HttpHeaders.authorizationHeader: 'Bearer $token',
   HttpHeaders.contentTypeHeader: 'application/json'
  };
  return http.post(Uri.parse('$url/operation'), body: jsonEncode(data), headers: tokenHeaders, encoding: Encoding.getByName("utf-8"));
 }

 static Future<http.Response> getOperation(data) async {
  String token = (await LocalStorage.getToken()).toString();
  var tokenHeaders = {
   HttpHeaders.authorizationHeader: 'Bearer $token',
   HttpHeaders.contentTypeHeader: 'application/json'
  };
  return http.get(Uri.parse('$url/operation/get'), headers: tokenHeaders,);
 }

 static Future<http.Response> findAllProperties() async {
  String token = (await LocalStorage.getToken()).toString();
  var tokenHeaders = {
   HttpHeaders.authorizationHeader: 'Bearer $token',
   HttpHeaders.contentTypeHeader: 'application/json'
  };
  return http.get(Uri.parse('$url/property'), headers: tokenHeaders, );
 }

}