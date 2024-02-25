import 'dart:convert';

class ArticlesModel {
  List<Datum>? data;
  Meta? meta;

  ArticlesModel({
    this.data,
    this.meta,
  });

  factory ArticlesModel.fromRawJson(String str) =>
      ArticlesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class Datum {
  int? id;
  DatumAttributes? attributes;

  Datum({
    this.id,
    this.attributes,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : DatumAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class DatumAttributes {
  String? articleTitle;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? author;
  DateTime? date;
  List<MainArticle>? mainArticle;
  String? category;
  String? landscapeImageLink;
  String? portraitImageLink;
  ArticleMainImage? articleMainImage;
  ArticleMainImage? articleMainImagePortrait;

  DatumAttributes({
    this.articleTitle,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.author,
    this.date,
    this.mainArticle,
    this.category,
    this.landscapeImageLink,
    this.portraitImageLink,
    this.articleMainImage,
    this.articleMainImagePortrait,
  });

  factory DatumAttributes.fromRawJson(String str) =>
      DatumAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        articleTitle: json["articleTitle"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        author: json["author"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        mainArticle: json["mainArticle"] == null
            ? []
            : List<MainArticle>.from(
                json["mainArticle"]!.map((x) => MainArticle.fromJson(x))),
        category: json["category"],
        landscapeImageLink: json["landscapeImageLink"],
        portraitImageLink: json["portraitImageLink"],
        articleMainImage: json["articleMainImage"] == null
            ? null
            : ArticleMainImage.fromJson(json["articleMainImage"]),
        articleMainImagePortrait: json["articleMainImagePortrait"] == null
            ? null
            : ArticleMainImage.fromJson(json["articleMainImagePortrait"]),
      );

  Map<String, dynamic> toJson() => {
        "articleTitle": articleTitle,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "author": author,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "mainArticle": mainArticle == null
            ? []
            : List<dynamic>.from(mainArticle!.map((x) => x.toJson())),
        "category": category,
        "landscapeImageLink": landscapeImageLink,
        "portraitImageLink": portraitImageLink,
        "articleMainImage": articleMainImage?.toJson(),
        "articleMainImagePortrait": articleMainImagePortrait?.toJson(),
      };
}

class ArticleMainImage {
  Data? data;

  ArticleMainImage({
    this.data,
  });

  factory ArticleMainImage.fromRawJson(String str) =>
      ArticleMainImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticleMainImage.fromJson(Map<String, dynamic> json) =>
      ArticleMainImage(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  DataAttributes? attributes;

  Data({
    this.id,
    this.attributes,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : DataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class DataAttributes {
  String? name;
  dynamic alternativeText;
  dynamic caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  Ext? ext;
  Mime? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  dynamic providerMetadata;
  DateTime? createdAt;
  DateTime? updatedAt;

  DataAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  factory DataAttributes.fromRawJson(String str) =>
      DataAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats:
            json["formats"] == null ? null : Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: extValues.map[json["ext"]]!,
        mime: mimeValues.map[json["mime"]]!,
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats?.toJson(),
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

enum Ext { WEBP }

final extValues = EnumValues({".webp": Ext.WEBP});

class Formats {
  Large? thumbnail;
  Large? small;
  Large? medium;
  Large? large;

  Formats({
    this.thumbnail,
    this.small,
    this.medium,
    this.large,
  });

  factory Formats.fromRawJson(String str) => Formats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: json["thumbnail"] == null
            ? null
            : Large.fromJson(json["thumbnail"]),
        small: json["small"] == null ? null : Large.fromJson(json["small"]),
        medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
        large: json["large"] == null ? null : Large.fromJson(json["large"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail?.toJson(),
        "small": small?.toJson(),
        "medium": medium?.toJson(),
        "large": large?.toJson(),
      };
}

class Large {
  String? name;
  String? hash;
  Ext? ext;
  Mime? mime;
  dynamic path;
  int? width;
  int? height;
  double? size;
  String? url;

  Large({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.path,
    this.width,
    this.height,
    this.size,
    this.url,
  });

  factory Large.fromRawJson(String str) => Large.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        name: json["name"],
        hash: json["hash"],
        ext: extValues.map[json["ext"]]!,
        mime: mimeValues.map[json["mime"]]!,
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
      };
}

enum Mime { IMAGE_WEBP }

final mimeValues = EnumValues({"image/webp": Mime.IMAGE_WEBP});

class MainArticle {
  MainArticleType? type;
  List<Child>? children;
  String? format;

  MainArticle({
    this.type,
    this.children,
    this.format,
  });

  factory MainArticle.fromRawJson(String str) =>
      MainArticle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MainArticle.fromJson(Map<String, dynamic> json) => MainArticle(
        type: mainArticleTypeValues.map[json["type"]]!,
        children: json["children"] == null
            ? []
            : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "type": mainArticleTypeValues.reverse[type],
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "format": format,
      };
}

class Child {
  ChildType? type;
  String? text;
  bool? bold;
  List<Child>? children;

  Child({
    this.type,
    this.text,
    this.bold,
    this.children,
  });

  factory Child.fromRawJson(String str) => Child.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        type: childTypeValues.map[json["type"]]!,
        text: json["text"],
        bold: json["bold"],
        children: json["children"] == null
            ? []
            : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": childTypeValues.reverse[type],
        "text": text,
        "bold": bold,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}

enum ChildType { LIST_ITEM, TEXT }

final childTypeValues =
    EnumValues({"list-item": ChildType.LIST_ITEM, "text": ChildType.TEXT});

enum MainArticleType { LIST, PARAGRAPH }

final mainArticleTypeValues = EnumValues(
    {"list": MainArticleType.LIST, "paragraph": MainArticleType.PARAGRAPH});

class Meta {
  Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
