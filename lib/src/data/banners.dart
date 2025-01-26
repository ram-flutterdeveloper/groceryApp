// To parse this JSON data, do
//
//     final banner = bannerFromJson(jsonString);

import 'dart:convert';

BannerModel bannerFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
    List<BannerData>? data;
    Meta? meta;

    BannerModel({
        this.data,
        this.meta,
    });

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        data: List<BannerData>.from(json["data"].map((x) => BannerData.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
    };
}

class BannerData {
    dynamic? id;
    dynamic? imageUrl;
    dynamic? redirectUrl;
    dynamic altText;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;

    BannerData({
        this.id,
        this.imageUrl,
        this.redirectUrl,
        this.altText,
        this.isActive,
        this.createdAt,
        this.updatedAt,
    });

    factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        id: json["id"],
        imageUrl: json["imageUrl"],
        redirectUrl: json["redirectUrl"],
        altText: json["altText"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "redirectUrl": redirectUrl,
        "altText": altText,
        "isActive": isActive,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}

class Meta {
    int? total;
    int? page;
    int? lastPage;

    Meta({
        this.total,
        this.page,
        this.lastPage,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        page: json["page"],
        lastPage: json["lastPage"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "lastPage": lastPage,
    };
}
