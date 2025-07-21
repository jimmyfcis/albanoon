class Lookup {
  final String? id;
  final String? name;

  Lookup({
    this.id,
    this.name,
  });

  factory Lookup.fromJson(Map<String, dynamic> json) {
    return Lookup(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}