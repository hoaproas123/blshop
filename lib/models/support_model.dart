class SupportModel {
  int? id;
  String? urlImg;
  String? label;
  String? info;
  String? link;

  SupportModel({
    this.id,
    this.urlImg,
    this.label,
    this.info,
    this.link,
  });

  SupportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlImg = json['urlImg'];
    label = json['label'];
    info = json['info'];
    link = json['link'];
  }
}