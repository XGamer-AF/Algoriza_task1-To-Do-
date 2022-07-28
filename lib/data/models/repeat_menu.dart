class RepeatMenu {
  final int ID;

  final String? nameEn;
  final String? nameAr;
  final bool? isSelected;

  const RepeatMenu(
      {required this.ID, this.nameEn, this.nameAr, this.isSelected});

  static List<RepeatMenu> fillRemindRepeatList() {
    List<RepeatMenu> tmp = [];

    tmp.add(RepeatMenu(
        ID: 1, nameEn: "Don't", nameAr: 'لا اريد', isSelected: true));

    tmp.add(
        RepeatMenu(ID: 2, nameEn: "Daily", nameAr: 'يوميا', isSelected: false));

    tmp.add(RepeatMenu(
        ID: 3, nameEn: "Weekly", nameAr: 'اسبوعيا', isSelected: false));

    tmp.add(RepeatMenu(
        ID: 4, nameEn: "Yearly", nameAr: 'سنويا', isSelected: false));

    return tmp;
  }
}
