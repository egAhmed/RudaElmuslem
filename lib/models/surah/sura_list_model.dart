class SuraList {
  //final int sid;
  final String? place;
  final String? type;
  final String? title;
  final String? titleAr;
  final int? pages;
  final int? count;

  SuraList( {this.place, this.type, this.title, this.titleAr, this.count,this.pages,});

  factory SuraList.fromJson(Map<String, dynamic> json) {
    return SuraList(
      place : json['place'],
       type: json['type'],
      title: json['title'], 
      titleAr: json['titleAr'], 
      count: json['count'],
      pages: json['pages'],
      
      );
  }

  
}
