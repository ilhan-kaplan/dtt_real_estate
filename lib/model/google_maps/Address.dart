// ignore_for_file: file_names

class Address {
  String placeName;
  double latitude;
  double longitude;
  String placeId;
  String placeFormattedAddress;

  Address(
    this.placeName,
    this.latitude,
    this.longitude,
    this.placeId,
    this.placeFormattedAddress,
  );

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      json["placeName"] as String,
      json["latitude"] as double,
      json["longitude"] as double,
      json["placeId"] as String,
      json["placeFormattedAddress"] as String,
    );
  }
}
