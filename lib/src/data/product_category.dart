import 'dart:convert';

ProductCategory productCategoryFromJson(dynamic str) =>
    ProductCategory.fromJson(json.decode(str));

dynamic productCategoryToJson(ProductCategory data) =>
    json.encode(data.toJson());

class ProductCategory {
  List<Datum>? data;
  Meta? meta;

  ProductCategory({
    this.data,
    this.meta,
  });

  factory ProductCategory.fromJson(Map<dynamic, dynamic> json) =>
      ProductCategory(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class Datum {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic image;
  dynamic slug;
  int? level;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic parentCategoryId;
  dynamic path;
  Category? parentCategory;
  List<Category>? childCategories;

  Datum({
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
    this.parentCategory,
    this.childCategories,
  });

  factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        slug: json["slug"],
        level: json["level"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        parentCategoryId: json["parentCategoryId"],
        path: json["path"],
        parentCategory: json["parentCategory"] == null
            ? null
            : Category.fromJson(json["parentCategory"]),
        childCategories: json["childCategories"] == null
            ? []
            : List<Category>.from(
                json["childCategories"].map((x) => Category.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "slug": slug,
        "level": level,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "parentCategoryId": parentCategoryId,
        "path": path,
        "parentCategory": parentCategory?.toJson(),
        "childCategories": childCategories == null
            ? []
            : List<dynamic>.from(childCategories!.map((x) => x.toJson())),
      };
}

class Category {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic image;
  dynamic slug;
  int? level;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic parentCategoryId;
  dynamic path;
  List<Category>? childCategories;

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
    this.childCategories,
  });

  factory Category.fromJson(Map<dynamic, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        slug: json["slug"],
        level: json["level"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        parentCategoryId: json["parentCategoryId"],
        path: json["path"],
        childCategories: json["childCategories"] == null
            ? []
            : List<Category>.from(
                json["childCategories"].map((x) => Category.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "slug": slug,
        "level": level,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "parentCategoryId": parentCategoryId,
        "path": path,
        "childCategories": childCategories == null
            ? []
            : List<dynamic>.from(childCategories!.map((x) => x.toJson())),
      };
}

class Meta {
  int? total;
  int? page;
  int? limit;
  int? lastPage;
  bool? hasNextPage;
  bool? hasPreviousPage;

  Meta({
    this.total,
    this.page,
    this.limit,
    this.lastPage,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory Meta.fromJson(Map<dynamic, dynamic> json) => Meta(
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        lastPage: json["lastPage"],
        hasNextPage: json["hasNextPage"],
        hasPreviousPage: json["hasPreviousPage"],
      );

  Map<dynamic, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
        "lastPage": lastPage,
        "hasNextPage": hasNextPage,
        "hasPreviousPage": hasPreviousPage,
      };
}
