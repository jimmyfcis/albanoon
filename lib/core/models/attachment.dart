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
  Map<String, dynamic> toJson() => {
    'id': id,
    'fileName': fileName,
    'contentType': contentType,
    'url': url,
  };
}