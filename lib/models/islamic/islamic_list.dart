

class IslamicList {
  String? title;
  String? titleAr;
  String? fileName;
  String? sectionName;
  String? sectionNameAr;
  String? section;
  

  IslamicList({this.title, this.titleAr, this.fileName,
  this.sectionNameAr,this.section,this.sectionName});

  IslamicList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleAr = json['titleAr'];
    fileName = json['fileName'];
    sectionName = json['sectionName'];
    sectionNameAr = json['sectionNameAr'];
    section = json['section'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['titleAr'] = this.titleAr;
    data['fileName'] = this.fileName;
    data['sectionName'] = this.sectionName;
    data['sectionNameAr'] = this.sectionNameAr;
    data['section'] = this.section;
    return data;
  }
}