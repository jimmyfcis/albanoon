class GetPublicSchoolsRequestModel {
  Filter? filter;
  int? pageNo;
  int? pageSize;
  String? sortBy;
  String? sortDir;

  GetPublicSchoolsRequestModel({
    this.filter,
    this.pageNo,
    this.pageSize,
    this.sortBy,
    this.sortDir,
  });

  factory GetPublicSchoolsRequestModel.fromJson(Map<String, dynamic> json) {
    return GetPublicSchoolsRequestModel(
      filter: json['filter'] != null ? Filter.fromJson(json['filter']) : null,
      pageNo: json['pageNo'],
      pageSize: json['pageSize'],
      sortBy: json['sortBy'],
      sortDir: json['sortDir'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'filter': filter?.toJson(),
      'pageNo': pageNo,
      'pageSize': pageSize,
      'sortBy': sortBy,
      'sortDir': sortDir,
    };
  }
}

class Filter {
  String? freeText;
  String? name;
  String? countryId;
  String? provinceId;
  String? city;
  bool? active;

  Filter({
    this.freeText,
    this.name,
    this.countryId,
    this.provinceId,
    this.city,
    this.active,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      freeText: json['freeText'],
      name: json['name'],
      countryId: json['countryId'],
      provinceId: json['provinceId'],
      city: json['city'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'freeText': freeText,
      'name': name,
      'countryId': countryId,
      'provinceId': provinceId,
      'city': city,
      'active': active,
    };
  }
}
