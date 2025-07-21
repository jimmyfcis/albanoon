import 'package:albanoon/core/models/lookup.dart';

class SchoolLookupsResponseModel {
  final Result? result;
  final int? status;
  final int? statuscode;
  final List<String>? message;
  final String? exception;

  SchoolLookupsResponseModel({
    this.result,
    this.status,
    this.statuscode,
    this.message,
    this.exception,
  });

  factory SchoolLookupsResponseModel.fromJson(Map<String, dynamic> json) {
    return SchoolLookupsResponseModel(
      result: json['result'] != null ? Result.fromJson(json['result']) : null,
      status: json['status'],
      statuscode: json['statuscode'],
      message: (json['message'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      exception: json['exception'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result?.toJson(),
      'status': status,
      'statuscode': statuscode,
      'message': message,
      'exception': exception,
    };
  }
}

class Result {
  final List<Lookup>? countries;
  final List<Lookup>? provinces;

  Result({
    this.countries,
    this.provinces,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Lookup.fromJson(e))
          .toList(),
      provinces: (json['provinces'] as List<dynamic>?)
          ?.map((e) => Lookup.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'countries': countries?.map((e) => e.toJson()).toList(),
      'provinces': provinces?.map((e) => e.toJson()).toList(),
    };
  }
}


