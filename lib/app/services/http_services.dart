import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../exceptions/app_exceptions.dart';

class HttpHelper {
  Future<dynamic> get({required String url, bool auth = false}) async {
    Map<String, String> header = await gedHeaders(auth);
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: header);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Available', 500);
    }
    return responseJson;
  }

  Future<dynamic> post(
      {required String url, dynamic body, bool auth = false}) async {
    Map<String, String> hd = await gedHeaders(auth);

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: body, headers: hd);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', 500);
    }
    return responseJson;
  }

  gedHeaders(auth) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: "application/json"
    };

    if (auth == true) {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      var token = preferences.getString("token");
      if (token != null && token.isNotEmpty) {
        headers.addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
      }
    }
    return headers;
  }

  returnResponse(http.Response response) async {
    var responseBody = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var responseJson = response.body;
        return responseJson;
      case 404:
        var message = responseBody['error'] != null &&
                responseBody['error']['message'] != null
            ? responseBody['error']['message']
            : responseBody['message'];
        throw BadRequestException(message.toString(), response.statusCode);
      //var responseJson = response.body;
      //return responseJson;
      case 401:
      case 403:
        //Utility.log('object');
        var message = responseBody['error'] != null &&
                responseBody['error']['message'] != null
            ? responseBody['error']['message']
            : responseBody['message'].toString();

        throw UnauthorisedException(responseBody, message, response.statusCode,
            next: responseBody['next'].toString());

        break;
      case 422:
        var responseJson = response.body.toString();
        return responseJson;
      case 500:
      default:
        throw FetchDataException(
            '${json.decode(response.body)['message']}', 500);
    }
  }
}
