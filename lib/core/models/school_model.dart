import 'package:albanoon/core/models/attachment.dart';

import '../../features/school/data/models/single_public_school_response.dart';

class School {
  School({
    this.id,
    this.name,
    this.nameAr,
    this.description,
    this.descriptionAr,
    this.countryId,
    this.country,
    this.provinceId,
    this.province,
    this.city,
    this.street,
    this.buildingNumber,
    this.postalCode,
    this.address,
    this.logo,
    this.logoAttachment,
    this.attachments,
    this.images,
    this.isActive,
    this.latitude,
    this.longitude,
    this.isFavorite,
  });

  String? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? countryId;
  Country? country;
  String? provinceId;
  Province? province;
  String? city;
  String? street;
  String? buildingNumber;
  String? postalCode;
  String? address;
  String? logo;
  Attachment? logoAttachment;
  List<Attachment>? attachments;
  List<Attachment>? images;
  bool? isActive;
  double? latitude;
  double? longitude;
  bool? isFavorite;

  factory School.fromJson(Map<String, dynamic> json) => School(
    id: json['id'] as String?,
    name: json['name'] as String?,
    nameAr: json['nameAr'] as String?,
    description: json['description'] as String?,
    descriptionAr: json['descriptionAr'] as String?,
    countryId: json['countryId'] as String?,
    country:
    json['country'] != null ? Country.fromJson(json['country']) : null,
    provinceId: json['provinceId'] as String?,
    province: json['province'] != null
        ? Province.fromJson(json['province'])
        : null,
    city: json['city'] as String?,
    street: json['street'] as String?,
    buildingNumber: json['buildingNumber'] as String?,
    postalCode: json['postalCode'] as String?,
    address: json['address'] as String?,
    logo: json['logo'] as String?,
    logoAttachment: json['logoAttachment'] != null
        ? Attachment.fromJson(json['logoAttachment'])
        : null,
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => Attachment.fromJson(e))
        .toList(),
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => Attachment.fromJson(e))
        .toList(),
    isActive: json['isActive'] as bool?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    isFavorite: json['isFavorite'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'nameAr': nameAr,
    'description': description,
    'descriptionAr': descriptionAr,
    'countryId': countryId,
    'country': country?.toJson(),
    'provinceId': provinceId,
    'province': province?.toJson(),
    'city': city,
    'street': street,
    'buildingNumber': buildingNumber,
    'postalCode': postalCode,
    'address': address,
    'logo': logo,
    'logoAttachment': logoAttachment?.toJson(),
    'attachments': attachments?.map((e) => e.toJson()).toList(),
    'images': images?.map((e) => e.toJson()).toList(),
    'isActive': isActive,
    'latitude': latitude,
    'longitude': longitude,
    'isFavorite': isFavorite,
  };
}