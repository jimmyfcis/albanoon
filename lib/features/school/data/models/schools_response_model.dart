class PublicSchoolsResponseModel {
  Result? result;
  int? status;
  int? statuscode;
  List<String>? message;
  String? exception;

  PublicSchoolsResponseModel({
    this.result,
    this.status,
    this.statuscode,
    this.message,
    this.exception,
  });

  factory PublicSchoolsResponseModel.fromJson(Map<String, dynamic> json) {
    return PublicSchoolsResponseModel(
      result: json['result'] != null ? Result.fromJson(json['result']) : null,
      status: json['status'],
      statuscode: json['statuscode'],
      message: (json['message'] as List?)?.map((e) => e.toString()).toList(),
      exception: json['exception'],
    );
  }
}

class Result {
  List<School>? schools;
  ListMetadata? listMetadata;

  Result({this.schools, this.listMetadata});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      schools: (json['schools'] as List?)
          ?.map((e) => School.fromJson(e))
          .toList(),
      listMetadata: json['listMetadata'] != null
          ? ListMetadata.fromJson(json['listMetadata'])
          : null,
    );
  }
}

class School {
  String? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? countryName;
  String? provinceName;
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

  School({
    this.id,
    this.name,
    this.nameAr,
    this.description,
    this.descriptionAr,
    this.countryName,
    this.provinceName,
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

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'],
      name: json['name'],
      nameAr: json['nameAr'],
      description: json['description'],
      descriptionAr: json['descriptionAr'],
      countryName: json['countryName'],
      provinceName: json['provinceName'],
      city: json['city'],
      street: json['street'],
      buildingNumber: json['buildingNumber'],
      postalCode: json['postalCode'],
      address: json['address'],
      logo: json['logo'],
      logoAttachment: json['logoAttachment'] != null
          ? Attachment.fromJson(json['logoAttachment'])
          : null,
      attachments: (json['attachments'] as List?)
          ?.map((e) => Attachment.fromJson(e))
          .toList(),
      images: (json['images'] as List?)
          ?.map((e) => Attachment.fromJson(e))
          .toList(),
      isActive: json['isActive'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isFavorite: json['isFavorite'],
    );
  }
}

class Attachment {
  String? id;
  String? fileName;
  String? contentType;
  String? url;

  Attachment({this.id, this.fileName, this.contentType, this.url});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'],
      fileName: json['fileName'],
      contentType: json['contentType'],
      url: json['url'],
    );
  }
}

class ListMetadata {
  int? currentPage;
  int? pageSize;
  int? totalPages;
  int? totalCount;

  ListMetadata({
    this.currentPage,
    this.pageSize,
    this.totalPages,
    this.totalCount,
  });

  factory ListMetadata.fromJson(Map<String, dynamic> json) {
    return ListMetadata(
      currentPage: json['currentPage'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
      totalCount: json['totalCount'],
    );
  }
}
