// To parse this JSON data, do
//
//     final bestDealProduct = bestDealProductFromJson(jsondynamic);

import 'dart:convert';

BestDealProduct bestDealProductFromJson(dynamic str) => BestDealProduct.fromJson(json.decode(str));

dynamic bestDealProductToJson(BestDealProduct data) => json.encode(data.toJson());

class BestDealProduct {
    List<BestDeal>? data;
    Meta? meta;

    BestDealProduct({
        this.data,
        this.meta,
    });

    factory BestDealProduct.fromJson(Map<dynamic, dynamic> json) => BestDealProduct(
        data: List<BestDeal>.from(json["data"].map((x) => BestDeal.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
    };
}

class BestDeal {
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
    List<ProductImage>? productImages;
    List<dynamic>? productReview;
    dynamic averageRating;
    dynamic discountPercentage;
    double? bestDealScore;

    BestDeal({
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
        this.productImages,
        this.productReview,
        this.averageRating,
        this.discountPercentage,
        this.bestDealScore,
    });

    factory BestDeal.fromJson(Map<dynamic, dynamic> json) => BestDeal(
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
        productImages: List<ProductImage>.from(json["productImages"].map((x) => ProductImage.fromJson(x))),
        productReview: List<dynamic>.from(json["ProductReview"].map((x) => x)),
        averageRating: json["averageRating"],
        discountPercentage: json["discountPercentage"],
        bestDealScore: json["bestDealScore"].toDouble(),
    );

    Map<dynamic, dynamic> toJson() => {
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
        "productImages": List<dynamic>.from(productImages!.map((x) => x.toJson())),
        "ProductReview": List<dynamic>.from(productReview!.map((x) => x)),
        "averageRating": averageRating,
        "discountPercentage": discountPercentage,
        "bestDealScore": bestDealScore,
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

    factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
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

    Map<dynamic, dynamic> toJson() => {
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

    factory ProductImage.fromJson(Map<dynamic, dynamic> json) => ProductImage(
        id: json["id"],
        url: json["url"],
        isDefault: json["isDefault"],
        productId: json["productId"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "url": url,
        "isDefault": isDefault,
        "productId": productId,
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

    factory Store.fromJson(Map<dynamic, dynamic> json) => Store(
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

    Map<dynamic, dynamic> toJson() => {
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

    factory Meta.fromJson(Map<dynamic, dynamic> json) => Meta(
        total: json["total"],
        page: json["page"],
        lastPage: json["lastPage"],
    );

    Map<dynamic, dynamic> toJson() => {
        "total": total,
        "page": page,
        "lastPage": lastPage,
    };
}
