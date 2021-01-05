import 'dart:convert';
import 'dart:io';
import 'package:ig_ui_app/model/district.dart';
import 'package:http/http.dart' as http;

class DistrictAPI {
  Future<List<District>> getDistrictList() async {
    String url = "https://rojgari.lumbini.gov.np/api/rootjob/list/";
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      );
      print(url);
      if (response.statusCode == 200) {
        return District.mapArray(utf8.decode(response.bodyBytes));
      }
      return [];
    } catch (e) {
      print("District LIst => $e");
      return [];
    }
  }
}
