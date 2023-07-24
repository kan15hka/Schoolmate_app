import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const String ip = '18.134.130.199';
const String baseUrl = 'http://${ip}:3000/student/';

Map<String, dynamic> studentId = {"student_id": "1"};

class ApiServices {
  Future<dynamic> post(String api, dynamic body) async {
    var response = await http.post(
      Uri.parse(baseUrl + api),
      body: jsonEncode(body),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    return response.body;
    // if (response.statusCode == 201) {
    //   return response.body;
    // } else {
    //   //throw exception and catch it in UI
    // }
  }
}
