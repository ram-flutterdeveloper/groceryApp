// To parse this JSON data, do
//
//     final allProductModel = allProductModelFromJson(jsonString);

import 'dart:convert';

AllProductModel allProductModelFromJson(String str) =>
    AllProductModel.fromJson(json.decode(str));

String allProductModelToJson(AllProductModel data) =>
    json.encode(data.toJson());

class AllProductModel 
{
  List<Product>? data;
  Meta? meta;

  AllProductModel({
    this.data,
    this.meta,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      AllProductModel(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class Product {
 dynamic id;
 dynamic name;
 dynamic description;
 dynamic additionalInfo;
  dynamic brand;
 dynamic basePrice;
 dynamic discountPrice;
  dynamic stock;
  dynamic quantity;
 dynamic unit;
 dynamic slug;
  dynamic rating;
  bool? isInStock;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
 dynamic storeId;
 dynamic categoryId;
  dynamic productTypeId;
  dynamic timeSlotId;
  Store? store;
  Category? category;
  dynamic productType;
  dynamic timeSlot;
  List<ProductImage>? productImages;
  List<dynamic>? productTags;
  List<dynamic>? zones;
  List<ProductReview>? productReview;

  Product({
    this.id,
    this.name,
    this.description,
    this.additionalInfo,
    this.brand,
    this.basePrice,
    this.discountPrice,
    this.stock,
    this.quantity,
    this.unit,
    this.slug,
    this.rating,
    this.isInStock,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.storeId,
    this.categoryId,
    this.productTypeId,
    this.timeSlotId,
    this.store,
    this.category,
    this.productType,
    this.timeSlot,
    this.productImages,
    this.productTags,
    this.zones,
    this.productReview,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        additionalInfo: json["additionalInfo"],
        brand: json["brand"],
        basePrice: json["basePrice"],
        discountPrice: json["discountPrice"],
        stock: json["stock"],
        quantity: json["quantity"],
        unit: json["unit"],
        slug: json["slug"],
        rating: json["rating"],
        isInStock: json["isInStock"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        storeId: json["storeId"],
        categoryId: json["categoryId"],
        productTypeId: json["productTypeId"],
        timeSlotId: json["timeSlotId"],
        store: Store.fromJson(json["store"]),
        category: Category.fromJson(json["category"]),
        productType: json["productType"],
        timeSlot: json["timeSlot"],
        productImages: List<ProductImage>.from(
            json["productImages"].map((x) => ProductImage.fromJson(x))),
        productTags: List<dynamic>.from(json["productTags"].map((x) => x)),
        zones: List<dynamic>.from(json["zones"].map((x) => x)),
        productReview: List<ProductReview>.from(
            json["ProductReview"].map((x) => ProductReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "additionalInfo": additionalInfo,
        "brand": brand,
        "basePrice": basePrice,
        "discountPrice": discountPrice,
        "stock": stock,
        "quantity": quantity,
        "unit": unit,
        "slug": slug,
        "rating": rating,
        "isInStock": isInStock,
        "isActive": isActive,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "storeId": storeId,
        "categoryId": categoryId,
        "productTypeId": productTypeId,
        "timeSlotId": timeSlotId,
        "store": store!.toJson(),
        "category": category!.toJson(),
        "productType": productType,
        "timeSlot": timeSlot,
        "productImages":
            List<dynamic>.from(productImages!.map((x) => x.toJson())),
        "productTags": List<dynamic>.from(productTags!.map((x) => x)),
        "zones": List<dynamic>.from(zones!.map((x) => x)),
        "ProductReview":
            List<dynamic>.from(productReview!.map((x) => x.toJson())),
      };
}

class Category {
 dynamic id;
 dynamic name;
 dynamic description;
 dynamic image;
 dynamic slug;
  dynamic level;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic parentCategoryId;
 dynamic path;

  Category({
    this.id,
    this.name,
    this.description,
    this.image,
    this.slug,
    this.level,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.parentCategoryId,
    this.path,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        slug: json["slug"],
        level: json["level"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        parentCategoryId: json["parentCategoryId"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "slug": slug,
        "level": level,
        "isActive": isActive,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "parentCategoryId": parentCategoryId,
        "path": path,
      };
}

class ProductImage {
 dynamic id;
 dynamic url;
  bool? isDefault;
 dynamic productId;

  ProductImage({
    this.id,
    this.url,
    this.isDefault,
    this.productId,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        url: json["url"],
        isDefault: json["isDefault"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "isDefault": isDefault,
        "productId": productId,
      };
}

class ProductReview {
 dynamic id;
 dynamic userId;
 dynamic productId;
 dynamic rating;
 dynamic title;
 dynamic description;
  dynamic likes;
  dynamic dislikes;
  dynamic helpfulCount;
  bool? isVerified;
  bool? verifiedPurchase;
 dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductReview({
    this.id,
    this.userId,
    this.productId,
    this.rating,
    this.title,
    this.description,
    this.likes,
    this.dislikes,
    this.helpfulCount,
    this.isVerified,
    this.verifiedPurchase,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) => ProductReview(
        id: json["id"],
        userId: json["userId"],
        productId: json["productId"],
        rating: json["rating"],
        title: json["title"],
        description: json["description"],
        likes: json["likes"],
        dislikes: json["dislikes"],
        helpfulCount: json["helpfulCount"],
        isVerified: json["isVerified"],
        verifiedPurchase: json["verifiedPurchase"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "productId": productId,
        "rating": rating,
        "title": title,
        "description": description,
        "likes": likes,
        "dislikes": dislikes,
        "helpfulCount": helpfulCount,
        "isVerified": isVerified,
        "verifiedPurchase": verifiedPurchase,
        "status": status,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class Store {
 dynamic id;
 dynamic storeName;
 dynamic storeDescription;
 dynamic officialPhoneNumber;
 dynamic storeAddress;
 dynamic gstNumber;
 dynamic gumastaNumber;
 dynamic storePicture;
  DateTime? createdAt;
  DateTime? updatedAt;
 dynamic vendorId;
  bool? isActive;

  Store({
    this.id,
    this.storeName,
    this.storeDescription,
    this.officialPhoneNumber,
    this.storeAddress,
    this.gstNumber,
    this.gumastaNumber,
    this.storePicture,
    this.createdAt,
    this.updatedAt,
    this.vendorId,
    this.isActive,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        storeName: json["storeName"],
        storeDescription: json["storeDescription"],
        officialPhoneNumber: json["officialPhoneNumber"],
        storeAddress: json["storeAddress"],
        gstNumber: json["gstNumber"],
        gumastaNumber: json["gumastaNumber"],
        storePicture: json["storePicture"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        vendorId: json["vendorId"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "storeName": storeName,
        "storeDescription": storeDescription,
        "officialPhoneNumber": officialPhoneNumber,
        "storeAddress": storeAddress,
        "gstNumber": gstNumber,
        "gumastaNumber": gumastaNumber,
        "storePicture": storePicture,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "vendorId": vendorId,
        "isActive": isActive,
      };
}

class Meta {
  dynamic total;
  dynamic page;
  dynamic lastPage;

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
