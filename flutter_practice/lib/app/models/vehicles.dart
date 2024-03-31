// To parse this JSON data, do
//
//     final vehiclesresponse = vehiclesresponseFromJson(jsonString);

import 'dart:convert';

Vehiclesresponse vehiclesresponseFromJson(String str) =>
    Vehiclesresponse.fromJson(json.decode(str));

String vehiclesresponseToJson(Vehiclesresponse data) =>
    json.encode(data.toJson());

class Vehiclesresponse {
  bool success;
  String message;
  List<Vehicle> vehicles;

  Vehiclesresponse({
    required this.success,
    required this.message,
    required this.vehicles,
  });

  factory Vehiclesresponse.fromJson(Map<String, dynamic> json) =>
      Vehiclesresponse(
        success: json["success"],
        message: json["message"],
        vehicles: List<Vehicle>.from(
            json["vehicles"].map((x) => Vehicle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "vehicles": List<dynamic>.from(vehicles.map((x) => x.toJson())),
      };
}

class Vehicle {
  String fullName;
  String email;
  dynamic address;
  String vehicleId;
  String name;
  String description;
  String imageUrl;
  String rating;
  String categoryId;
  String perDayPrice;
  String userId;
  String isDeleted;
  String seats;
  String fuelType;
  String speed;
  String category;

  Vehicle({
    required this.fullName,
    required this.email,
    required this.address,
    required this.vehicleId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.categoryId,
    required this.perDayPrice,
    required this.userId,
    required this.isDeleted,
    required this.seats,
    required this.fuelType,
    required this.speed,
    required this.category,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        fullName: json["full_name"],
        email: json["email"],
        address: json["address"],
        vehicleId: json["vehicle_id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["image_url"],
        rating: json["rating"],
        categoryId: json["category_id"],
        perDayPrice: json["per_day_price"],
        userId: json["user_id"],
        isDeleted: json["is_deleted"],
        seats: json["seats"],
        fuelType: json["fuelType"],
        speed: json["speed"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "address": address,
        "vehicle_id": vehicleId,
        "name": name,
        "description": description,
        "image_url": imageUrl,
        "rating": rating,
        "category_id": categoryId,
        "per_day_price": perDayPrice,
        "user_id": userId,
        "is_deleted": isDeleted,
        "seats": seats,
        "fuelType": fuelType,
        "speed": speed,
        "category": category,
      };
}
