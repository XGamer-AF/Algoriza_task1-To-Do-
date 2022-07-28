class CalendarDate {
  DateTime? date;
  int? month;
  int? year;
  bool? isHoliday;
  bool? idDisable;
  bool? thisMonth;
  bool? prevMonth;
  bool? nextMonth;
  bool? contractDay;
  bool? canSelect;
  bool? isSelect;
  bool? movedDay;

  CalendarDate({
    this.date,
    this.month,
    this.year,
    this.isHoliday,
    this.idDisable,
    this.thisMonth,
    this.nextMonth,
    this.prevMonth,
    this.contractDay,
    this.canSelect,
    this.isSelect,
    this.movedDay,
  });
}
