class RemindMenu {
  final int ID;

  final String? nameEn;
  final String? nameAr;
  final bool? isSelected;

  const RemindMenu(
      {required this.ID, this.nameEn, this.nameAr, this.isSelected});

  static List<RemindMenu> fillRemindRepeatList() {
    List<RemindMenu> tmp = [];

    tmp.add(RemindMenu(
        ID: 1,
        nameEn: "1 day before",
        nameAr: 'قبل يوم واحد',
        isSelected: true));

    tmp.add(RemindMenu(
        ID: 2,
        nameEn: "1 hour before",
        nameAr: 'قبل ساعة واحدة',
        isSelected: false));

    tmp.add(RemindMenu(
        ID: 3,
        nameEn: "30 min before",
        nameAr: 'قبل 30 دقيقة',
        isSelected: false));

    tmp.add(RemindMenu(
        ID: 4,
        nameEn: "10 min before",
        nameAr: 'قبل 10 دقائق',
        isSelected: false));

    return tmp;
  }
}
