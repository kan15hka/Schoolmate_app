import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const String ip = '18.134.130.199';
const String baseUrl = 'http://$ip:3000/student/';

Map<String, dynamic> studentId = {"student_id": "1"};

class ApiServices {
  List<Map<String, dynamic>> studentData = [
    {
      "s_name": "Tyler Durden",
      "s_id": "1",
      "admin_id": "1",
      "section_id": "1",
      "blood_group": "A+",
      "address": "123 Main Street",
      "father_name": "John Doe Sr.",
      "emis_no": "1",
      "fees": 1000,
      "due": 0,
      "phone_no_1": "8072828935",
      "phone_no_2": "9876543210",
      "gender": "Male",
      "img": "image.jpg",
      "createdAt": "2023-07-02T15:44:33.000Z",
      "updatedAt": "2023-07-02T15:44:33.000Z"
    },
    {
      "s_name": "Arul",
      "s_id": "ea45a477-6ca9-4201-9d5b-d5c664eb3efa",
      "admin_id": "1",
      "section_id": "1",
      "blood_group": "B+",
      "address": "Chennai",
      "father_name": "Adnan",
      "emis_no": "4655654789",
      "fees": 20000,
      "due": 12000,
      "phone_no_1": "8072828935",
      "phone_no_2": "4567891235",
      "gender": "Male",
      "img": "",
      "createdAt": "2023-07-20T05:09:14.000Z",
      "updatedAt": "2023-07-20T05:09:14.000Z"
    }
  ];
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
