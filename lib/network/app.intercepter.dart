import 'dart:convert';
import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:property2/network/localstorage.dart';

class ApiInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    String token = (await LocalStorage.getToken()).toString();

    data.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
    data.headers[HttpHeaders.acceptHeader] = 'application/json';
    print("data from interceptor");
    print(data);
    print(token);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    /*print(
        "{REQUEST: ${data.url}\n STATUS CODE: ${data.statusCode}\nBODY: ${jsonDecode(data.body)}\n");*/

    if (data.statusCode == 403) {
      Map<String, dynamic> parsedData = jsonDecode(data.body!);
      String message = parsedData['message'];
      return ResponseData(
        data.bodyBytes,
        data.statusCode,
        // isRedirect: data.isRedirect,
        // method: data.method,
        // url: data.url,
        headers: data.headers,
        persistentConnection: data.persistentConnection,
        contentLength: data.contentLength,
        body: jsonEncode(
          {
            'message': message,
            'status': 403,
            'data': [],
            'entity': null,
          },
        ),
      );
    }

    return data;
  }
}