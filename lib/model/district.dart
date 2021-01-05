import 'dart:convert';

class District {
  final String job_heading;
  final int id;

  District({
    this.job_heading,
    this.id,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      job_heading: json['job_heading'] ?? "",
      id: json['id'] ?? -1,
    );
  }

  static List<District> mapArray(String responseBody) {
    final mapped = json.decode(responseBody).cast<Map<String, dynamic>>();
    return mapped.map<District>((json) => District.fromJson(json)).toList();
  }
}
