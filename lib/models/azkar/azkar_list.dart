

class AzkarList {
  String? title;
  String? titleAr;
  String? filename;
  String? srcImage;

  AzkarList({this.title, this.titleAr, this.filename, this.srcImage});

  AzkarList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleAr = json['titleAr'];
    filename = json['filename'];
    srcImage = json['srcImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['titleAr'] = this.titleAr;
    data['filename'] = this.filename;
    data['srcImage'] = this.srcImage;
    return data;
  }
}