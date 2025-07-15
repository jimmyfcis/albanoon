import 'package:albanoon/core/models/school_model.dart';

class SinglePublicSchoolResponse {
  SinglePublicSchoolResponse({
    this.result,
    this.status,
    this.statuscode,
    this.message,
    this.exception,
  });

  School? result;
  int? status;
  int? statuscode;
  List<String>? message;
  dynamic exception; // keep dynamic if the API sometimes returns objects

  factory SinglePublicSchoolResponse.fromJson(Map<String, dynamic> json) {
    return SinglePublicSchoolResponse(
      result: json['result'] != null ? School.fromJson(json['result']) : null,
      status: json['status'] as int?,
      statuscode: json['statuscode'] as int?,
      message: (json['message'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      exception: json['exception'],
    );
  }

  Map<String, dynamic> toJson() => {
    'result': result?.toJson(),
    'status': status,
    'statuscode': statuscode,
    'message': message,
    'exception': exception,
  };
}


class Country {
  Country({
    this.id,
    this.name,
    this.nameAr,
    this.code,
    this.dialCode,
    this.isActive,
  });

  String? id;
  String? name;
  String? nameAr;
  String? code;
  String? dialCode;
  bool? isActive;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json['id'] as String?,
    name: json['name'] as String?,
    nameAr: json['nameAr'] as String?,
    code: json['code'] as String?,
    dialCode: json['dialCode'] as String?,
    isActive: json['isActive'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'nameAr': nameAr,
    'code': code,
    'dialCode': dialCode,
    'isActive': isActive,
  };
}

class Province {
  Province({
    this.id,
    this.name,
    this.nameAr,
    this.countryId,
    this.country,
    this.isActive,
  });

  String? id;
  String? name;
  String? nameAr;
  String? countryId;
  Country? country;
  bool? isActive;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
    id: json['id'] as String?,
    name: json['name'] as String?,
    nameAr: json['nameAr'] as String?,
    countryId: json['countryId'] as String?,
    country:
    json['country'] != null ? Country.fromJson(json['country']) : null,
    isActive: json['isActive'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'nameAr': nameAr,
    'countryId': countryId,
    'country': country?.toJson(),
    'isActive': isActive,
  };
}


