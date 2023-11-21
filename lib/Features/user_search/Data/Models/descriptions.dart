class Descriptions {
  String? description1;
  String? description2;
  String? description3;

  Descriptions({this.description1, this.description2, this.description3});

  Descriptions.fromJson(Map<String, dynamic> json) {
    description1 = json['description1'];
    description2 = json['description2'];
    description3 = json['description3'];
  }
  static List<Descriptions> parseDescriptions(json) {
    final list = json as List;
    return list.map((e) => Descriptions.fromJson(e)).toList();
  }
}
