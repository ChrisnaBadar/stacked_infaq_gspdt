import 'dart:convert';

class FundraiseModel {
  FundraiseModelData? data;
  Meta? meta;

  FundraiseModel({
    this.data,
    this.meta,
  });

  factory FundraiseModel.fromRawJson(String str) =>
      FundraiseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FundraiseModel.fromJson(Map<String, dynamic> json) => FundraiseModel(
        data: json["data"] == null
            ? null
            : FundraiseModelData.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class FundraiseModelData {
  int? id;
  PurpleAttributes? attributes;

  FundraiseModelData({
    this.id,
    this.attributes,
  });

  factory FundraiseModelData.fromRawJson(String str) =>
      FundraiseModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FundraiseModelData.fromJson(Map<String, dynamic> json) =>
      FundraiseModelData(
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
  String? type;
  List<Child>? children;

  Description({
    this.type,
    this.children,
  });

  factory Description.fromRawJson(String str) =>
      Description.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        type: json["type"],
        children: json["children"] == null
            ? []
            : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}

class Child {
  String? type;
  String? text;

  Child({
    this.type,
    this.text,
  });

  factory Child.fromRawJson(String str) => Child.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        type: json["type"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
      };
}

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
  String? donationStatus;
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
        donationStatus: json["donationStatus"],
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
        "donationStatus": donationStatus,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

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
  String? title;
  String? action;
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
        title: json["title"],
        action: json["action"],
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
        "title": title,
        "action": action,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

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
  String? name;
  String? description;
  String? address;
  String? phone;
  String? email;
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
        name: json["name"],
        description: json["description"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
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
        "name": name,
        "description": description,
        "address": address,
        "phone": phone,
        "email": email,
        "website": website,
        "verfied": verfied,
        "imageLink": imageLink,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

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
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
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
        ext: json["ext"],
        mime: json["mime"],
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
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Formats {
  Small? thumbnail;
  Small? small;

  Formats({
    this.thumbnail,
    this.small,
  });

  factory Formats.fromRawJson(String str) => Formats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: json["thumbnail"] == null
            ? null
            : Small.fromJson(json["thumbnail"]),
        small: json["small"] == null ? null : Small.fromJson(json["small"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail?.toJson(),
        "small": small?.toJson(),
      };
}

class Small {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  dynamic path;
  int? width;
  int? height;
  double? size;
  String? url;

  Small({
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

  factory Small.fromRawJson(String str) => Small.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Small.fromJson(Map<String, dynamic> json) => Small(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
      };
}

class Meta {
  Meta();

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
