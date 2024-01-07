import 'dart:convert';

class FundraisesListModel {
  List<FundraisesListModelDatum>? data;
  Meta? meta;

  FundraisesListModel({
    this.data,
    this.meta,
  });

  factory FundraisesListModel.fromRawJson(String str) =>
      FundraisesListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FundraisesListModel.fromJson(Map<String, dynamic> json) =>
      FundraisesListModel(
        data: json["data"] == null
            ? []
            : List<FundraisesListModelDatum>.from(
                json["data"]!.map((x) => FundraisesListModelDatum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class FundraisesListModelDatum {
  int? id;
  PurpleAttributes? attributes;

  FundraisesListModelDatum({
    this.id,
    this.attributes,
  });

  factory FundraisesListModelDatum.fromRawJson(String str) =>
      FundraisesListModelDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FundraisesListModelDatum.fromJson(Map<String, dynamic> json) =>
      FundraisesListModelDatum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : PurpleAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class PurpleAttributes {
  String? title;
  String? targetDonation;
  DateTime? dateStart;
  DateTime? dateEnd;
  List<Description>? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? imageLink;
  MainImage? mainImage;
  Donations? donations;
  FundraiseReports? fundraiseReports;
  Fundraiser? fundraiser;

  PurpleAttributes({
    this.title,
    this.targetDonation,
    this.dateStart,
    this.dateEnd,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.imageLink,
    this.mainImage,
    this.donations,
    this.fundraiseReports,
    this.fundraiser,
  });

  factory PurpleAttributes.fromRawJson(String str) =>
      PurpleAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) =>
      PurpleAttributes(
        title: json["title"],
        targetDonation: json["targetDonation"],
        dateStart: json["dateStart"] == null
            ? null
            : DateTime.parse(json["dateStart"]),
        dateEnd:
            json["dateEnd"] == null ? null : DateTime.parse(json["dateEnd"]),
        description: json["description"] == null
            ? []
            : List<Description>.from(
                json["description"]!.map((x) => Description.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        imageLink: json["imageLink"],
        mainImage: json["mainImage"] == null
            ? null
            : MainImage.fromJson(json["mainImage"]),
        donations: json["donations"] == null
            ? null
            : Donations.fromJson(json["donations"]),
        fundraiseReports: json["fundraise_reports"] == null
            ? null
            : FundraiseReports.fromJson(json["fundraise_reports"]),
        fundraiser: json["fundraiser"] == null
            ? null
            : Fundraiser.fromJson(json["fundraiser"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "targetDonation": targetDonation,
        "dateStart":
            "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
        "dateEnd":
            "${dateEnd!.year.toString().padLeft(4, '0')}-${dateEnd!.month.toString().padLeft(2, '0')}-${dateEnd!.day.toString().padLeft(2, '0')}",
        "description": description == null
            ? []
            : List<dynamic>.from(description!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "imageLink": imageLink,
        "mainImage": mainImage?.toJson(),
        "donations": donations?.toJson(),
        "fundraise_reports": fundraiseReports?.toJson(),
        "fundraiser": fundraiser?.toJson(),
      };
}

class Description {
  DescriptionType? type;
  List<Child>? children;
  String? format;

  Description({
    this.type,
    this.children,
    this.format,
  });

  factory Description.fromRawJson(String str) =>
      Description.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        type: descriptionTypeValues.map[json["type"]]!,
        children: json["children"] == null
            ? []
            : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "type": descriptionTypeValues.reverse[type],
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "format": format,
      };
}

class Child {
  ChildType? type;
  String? text;
  List<Child>? children;
  bool? bold;

  Child({
    this.type,
    this.text,
    this.children,
    this.bold,
  });

  factory Child.fromRawJson(String str) => Child.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        type: childTypeValues.map[json["type"]]!,
        text: json["text"],
        children: json["children"] == null
            ? []
            : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
        bold: json["bold"],
      );

  Map<String, dynamic> toJson() => {
        "type": childTypeValues.reverse[type],
        "text": text,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "bold": bold,
      };
}

enum ChildType { LIST_ITEM, TEXT }

final childTypeValues =
    EnumValues({"list-item": ChildType.LIST_ITEM, "text": ChildType.TEXT});

enum DescriptionType { LIST, PARAGRAPH }

final descriptionTypeValues = EnumValues(
    {"list": DescriptionType.LIST, "paragraph": DescriptionType.PARAGRAPH});

class Donations {
  List<DonationsDatum>? data;

  Donations({
    this.data,
  });

  factory Donations.fromRawJson(String str) =>
      Donations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Donations.fromJson(Map<String, dynamic> json) => Donations(
        data: json["data"] == null
            ? []
            : List<DonationsDatum>.from(
                json["data"]!.map((x) => DonationsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DonationsDatum {
  int? id;
  FluffyAttributes? attributes;

  DonationsDatum({
    this.id,
    this.attributes,
  });

  factory DonationsDatum.fromRawJson(String str) =>
      DonationsDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DonationsDatum.fromJson(Map<String, dynamic> json) => DonationsDatum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : FluffyAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class FluffyAttributes {
  String? nama;
  String? nominal;
  String? kontak;
  String? pesan;
  DonationStatus? donationStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  FluffyAttributes({
    this.nama,
    this.nominal,
    this.kontak,
    this.pesan,
    this.donationStatus,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory FluffyAttributes.fromRawJson(String str) =>
      FluffyAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) =>
      FluffyAttributes(
        nama: json["nama"],
        nominal: json["nominal"],
        kontak: json["kontak"],
        pesan: json["pesan"],
        donationStatus: donationStatusValues.map[json["donationStatus"]]!,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "nominal": nominal,
        "kontak": kontak,
        "pesan": pesan,
        "donationStatus": donationStatusValues.reverse[donationStatus],
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

enum DonationStatus { DITERIMA }

final donationStatusValues = EnumValues({"Diterima": DonationStatus.DITERIMA});

class FundraiseReports {
  List<FundraiseReportsDatum>? data;

  FundraiseReports({
    this.data,
  });

  factory FundraiseReports.fromRawJson(String str) =>
      FundraiseReports.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FundraiseReports.fromJson(Map<String, dynamic> json) =>
      FundraiseReports(
        data: json["data"] == null
            ? []
            : List<FundraiseReportsDatum>.from(
                json["data"]!.map((x) => FundraiseReportsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FundraiseReportsDatum {
  int? id;
  TentacledAttributes? attributes;

  FundraiseReportsDatum({
    this.id,
    this.attributes,
  });

  factory FundraiseReportsDatum.fromRawJson(String str) =>
      FundraiseReportsDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FundraiseReportsDatum.fromJson(Map<String, dynamic> json) =>
      FundraiseReportsDatum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : TentacledAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class TentacledAttributes {
  Title? title;
  Action? action;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  TentacledAttributes({
    this.title,
    this.action,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory TentacledAttributes.fromRawJson(String str) =>
      TentacledAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TentacledAttributes.fromJson(Map<String, dynamic> json) =>
      TentacledAttributes(
        title: titleValues.map[json["title"]]!,
        action: actionValues.map[json["action"]]!,
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "title": titleValues.reverse[title],
        "action": actionValues.reverse[action],
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

enum Action { POST_AKTIF }

final actionValues = EnumValues({"Post Aktif": Action.POST_AKTIF});

enum Title { FUNDRAISE_DIBUAT, POST_FUNDRAISE_DIBUAT, TITLE_FUNDRAISE_DIBUAT }

final titleValues = EnumValues({
  "Fundraise dibuat": Title.FUNDRAISE_DIBUAT,
  "Post Fundraise Dibuat": Title.POST_FUNDRAISE_DIBUAT,
  "Fundraise Dibuat": Title.TITLE_FUNDRAISE_DIBUAT
});

class Fundraiser {
  FundraiserData? data;

  Fundraiser({
    this.data,
  });

  factory Fundraiser.fromRawJson(String str) =>
      Fundraiser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fundraiser.fromJson(Map<String, dynamic> json) => Fundraiser(
        data:
            json["data"] == null ? null : FundraiserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class FundraiserData {
  int? id;
  StickyAttributes? attributes;

  FundraiserData({
    this.id,
    this.attributes,
  });

  factory FundraiserData.fromRawJson(String str) =>
      FundraiserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FundraiserData.fromJson(Map<String, dynamic> json) => FundraiserData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : StickyAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class StickyAttributes {
  Name? name;
  String? description;
  Address? address;
  Phone? phone;
  Email? email;
  String? website;
  bool? verfied;
  String? imageLink;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  StickyAttributes({
    this.name,
    this.description,
    this.address,
    this.phone,
    this.email,
    this.website,
    this.verfied,
    this.imageLink,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory StickyAttributes.fromRawJson(String str) =>
      StickyAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StickyAttributes.fromJson(Map<String, dynamic> json) =>
      StickyAttributes(
        name: nameValues.map[json["name"]]!,
        description: json["description"],
        address: addressValues.map[json["address"]]!,
        phone: phoneValues.map[json["phone"]]!,
        email: emailValues.map[json["email"]]!,
        website: json["website"],
        verfied: json["verfied"],
        imageLink: json["imageLink"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "description": description,
        "address": addressValues.reverse[address],
        "phone": phoneValues.reverse[phone],
        "email": emailValues.reverse[email],
        "website": website,
        "verfied": verfied,
        "imageLink": imageLink,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

enum Address { JL_GEGERKALONG_GIRANG_BARU_NO_4 }

final addressValues = EnumValues({
  "Jl. Gegerkalong Girang Baru No. 4": Address.JL_GEGERKALONG_GIRANG_BARU_NO_4
});

enum Email { DEV_AMALA_GSPDT_CO_ID }

final emailValues =
    EnumValues({"dev@amala.gspdt.co.id": Email.DEV_AMALA_GSPDT_CO_ID});

enum Name { AMALA_APP }

final nameValues = EnumValues({"Amala App": Name.AMALA_APP});

enum Phone { THE_0222007134 }

final phoneValues = EnumValues({"022 2007134": Phone.THE_0222007134});

class MainImage {
  MainImageData? data;

  MainImage({
    this.data,
  });

  factory MainImage.fromRawJson(String str) =>
      MainImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MainImage.fromJson(Map<String, dynamic> json) => MainImage(
        data:
            json["data"] == null ? null : MainImageData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class MainImageData {
  int? id;
  IndigoAttributes? attributes;

  MainImageData({
    this.id,
    this.attributes,
  });

  factory MainImageData.fromRawJson(String str) =>
      MainImageData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MainImageData.fromJson(Map<String, dynamic> json) => MainImageData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : IndigoAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class IndigoAttributes {
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
  Provider? provider;
  dynamic providerMetadata;
  DateTime? createdAt;
  DateTime? updatedAt;

  IndigoAttributes({
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

  factory IndigoAttributes.fromRawJson(String str) =>
      IndigoAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IndigoAttributes.fromJson(Map<String, dynamic> json) =>
      IndigoAttributes(
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
        provider: providerValues.map[json["provider"]]!,
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
        "provider": providerValues.reverse[provider],
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

enum Ext { JPG, PNG }

final extValues = EnumValues({".jpg": Ext.JPG, ".png": Ext.PNG});

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

enum Mime { IMAGE_JPEG, IMAGE_PNG }

final mimeValues =
    EnumValues({"image/jpeg": Mime.IMAGE_JPEG, "image/png": Mime.IMAGE_PNG});

enum Provider { LOCAL }

final providerValues = EnumValues({"local": Provider.LOCAL});

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
