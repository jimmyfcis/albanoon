import 'package:albanoon/core/models/school_model.dart';

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
