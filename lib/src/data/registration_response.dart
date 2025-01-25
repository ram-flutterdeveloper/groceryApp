// To parse this JSON data, do
//
//     final registrationResponse = registrationResponseFromJson(jsonString?);

import 'dart:convert';

RegistrationResponse registrationResponseFromJson(String str) =>
    RegistrationResponse.fromJson(json.decode(str));

String? registrationResponseToJson(RegistrationResponse data) =>
    json.encode(data.toJson());

class RegistrationResponse {
  Customer? customer;
  String? accessToken;
  String? refreshToken;

  RegistrationResponse({
    this.customer,
    this.accessToken,
    this.refreshToken,
  });

  factory RegistrationResponse.fromJson(Map<String?, dynamic> json) =>
      RegistrationResponse(
        customer: Customer.fromJson(json["customer"]),
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String?, dynamic> toJson() => {
        "customer": customer!.toJson(),
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}

class Customer {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  dynamic name;
  dynamic img;
  String? authType;
  String? role;
  String? phone;
  dynamic password;
  bool? isPhoneVerified;
  dynamic vendorType;
  dynamic businessId;
  bool? isVendorAccountCreated;
  bool? isVendorAccountActive;
  bool? vendorTermsAccepted;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic resetToken;
  dynamic resetTokenExpiresAt;

  Customer({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.name,
    this.img,
    this.authType,
    this.role,
    this.phone,
    this.password,
    this.isPhoneVerified,
    this.vendorType,
    this.businessId,
    this.isVendorAccountCreated,
    this.isVendorAccountActive,
    this.vendorTermsAccepted,
    this.createdAt,
    this.updatedAt,
    this.resetToken,
    this.resetTokenExpiresAt,
  });

  factory Customer.fromJson(Map<String?, dynamic> json) => Customer(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        name: json["name"],
        img: json["img"],
        authType: json["authType"],
        role: json["role"],
        phone: json["phone"],
        password: json["password"],
        isPhoneVerified: json["isPhoneVerified"],
        vendorType: json["vendorType"],
        businessId: json["businessId"],
        isVendorAccountCreated: json["isVendorAccountCreated"],
        isVendorAccountActive: json["isVendorAccountActive"],
        vendorTermsAccepted: json["vendorTermsAccepted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        resetToken: json["resetToken"],
        resetTokenExpiresAt: json["resetTokenExpiresAt"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "name": name,
        "img": img,
        "authType": authType,
        "role": role,
        "phone": phone,
        "password": password,
        "isPhoneVerified": isPhoneVerified,
        "vendorType": vendorType,
        "businessId": businessId,
        "isVendorAccountCreated": isVendorAccountCreated,
        "isVendorAccountActive": isVendorAccountActive,
        "vendorTermsAccepted": vendorTermsAccepted,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "resetToken": resetToken,
        "resetTokenExpiresAt": resetTokenExpiresAt,
      };
}
