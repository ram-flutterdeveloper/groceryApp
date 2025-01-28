// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsondynamic);

import 'dart:convert';

WishListModel wishListModelFromJson(dynamic str) => WishListModel.fromJson(json.decode(str));

dynamic wishListModelToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
    dynamic id;
    dynamic userId;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<WishListItem>? items;
    dynamic? totalItems;

    WishListModel({
        this.id,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.items,
        this.totalItems,
    });

    factory WishListModel.fromJson(Map<dynamic, dynamic> json) => WishListModel(
        id: json["id"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        items: List<WishListItem>.from(json["items"].map((x) => WishListItem.fromJson(x))),
        totalItems: json["totalItems"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalItems": totalItems,
    };
}

class WishListItem {
    dynamic id;
    dynamic wishlistId;
    dynamic productId;
    dynamic storeId;
    DateTime? createdAt;
    DateTime? updatedAt;
    ProductDatum? product;
    Store? store;

    WishListItem({
        this.id,
        this.wishlistId,
        this.productId,
        this.storeId,
        this.createdAt,
        this.updatedAt,
        this.product,
        this.store,
    });

    factory WishListItem.fromJson(Map<dynamic, dynamic> json) => WishListItem(
        id: json["id"],
        wishlistId: json["wishlistId"],
        productId: json["productId"],
        storeId: json["storeId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        product: ProductDatum.fromJson(json["product"]),
        store: Store.fromJson(json["store"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "wishlistId": wishlistId,
        "productId": productId,
        "storeId": storeId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "product": product!.toJson(),
        "store": store!.toJson(),
    };
}

class ProductDatum {
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
    bool? isInWishlist;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic storeId;
    dynamic categoryId;
    dynamic productTypeId;
    dynamic timeSlotId;

    ProductDatum({
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
        this.isInWishlist,
        this.createdAt,
        this.updatedAt,
        this.storeId,
        this.categoryId,
        this.productTypeId,
        this.timeSlotId,
    });

    factory ProductDatum.fromJson(Map<dynamic, dynamic> json) => ProductDatum(
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
        isInWishlist: json["isInWishlist"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        storeId: json["storeId"],
        categoryId: json["categoryId"],
        productTypeId: json["productTypeId"],
        timeSlotId: json["timeSlotId"],
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
        "isInWishlist": isInWishlist,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "storeId": storeId,
        "categoryId": categoryId,
        "productTypeId": productTypeId,
        "timeSlotId": timeSlotId,
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
    dynamic couponId;

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
        this.couponId,
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
        couponId: json["couponId"],
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
        "couponId": couponId,
    };
}
