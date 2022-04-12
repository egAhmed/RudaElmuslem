class RadioModel {
  bool isSelected;
  final String time;
  final String type;
  //final Function onTap;

  RadioModel(this.isSelected,this.time, this.type);
}


class RadioModelChek {
  bool isSelected;
  final String? title;
  final String? soundName;
  int? groupValues;
 final Function()? onPress;
 final Function(int?)? onChanged;
 final int? value;

  RadioModelChek(
     this.isSelected ,
     this.title,
    this.value,
     this.groupValues,
     this.onChanged,
     this.onPress, this.soundName
    );
}
