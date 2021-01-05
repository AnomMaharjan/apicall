import 'dart:convert';

class Profile {
  List<dynamic> category;
  final int id;
  double longitude, latitude;
  final String name, email, contactNumber, businessType, address;

  Profile({
    this.id,
    this.longitude,
    this.latitude,
    this.name,
    this.email,
    this.contactNumber,
    this.businessType,
    this.category,
    this.address
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] ?? -1,
      longitude: json['longitude'] ?? -1,
      latitude: json['latitude'] ?? -1,
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      contactNumber: json['contact_number'] ?? "",
      businessType: json['business_type'] ?? "",
      category: json['category'],
      address: json['address'] ?? "",
    );
  }

  static Profile mapJson(String responseBody) {
    final mapped = json.decode(responseBody);
    return Profile.fromJson(mapped);
  }
}
