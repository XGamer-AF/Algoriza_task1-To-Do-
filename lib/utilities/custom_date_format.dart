import 'package:intl/intl.dart';

class CustomDateFormat {

  String ShortDate(String? date, String? lang) {

    if(date == '' || date!.isEmpty || date == 'null'){
      return '';
    }

    DateTime _date = DateTime.parse(date);
    if (lang == 'ar') {
      return DateFormat("yyyy-M-d", 'en_US').format(_date);
    } else {
      return DateFormat("d-M-yyyy", 'en_US').format(_date);
    }
  }

  String ShortDateWithMonth(String? date, String? lang) {

    if(date == '' || date!.isEmpty || date == 'null'){
      return '';
    }

    DateTime _date = DateTime.parse(date);
    if (lang == 'ar') {
      return DateFormat("yyyy MMMM, d", 'en_US').format(_date);
    } else {
      return DateFormat("d MMMM, yyyy", 'en_US').format(_date);
    }
  }

  String ShortDateCalendar(String? date, String? lang) {

    if(date == '' || date!.isEmpty || date == 'null'){
      return '';
    }

    DateTime _date = DateTime.parse(date);
    if (lang == 'ar') {
      return DateFormat("MMM", 'ar').format(_date);
    } else {
      return DateFormat("MMM", 'en_US').format(_date);
    }
  }

  String ShortDateWithTime(String date, String? lang) {

    if(date == '' || date.isEmpty || date == 'null'){
      return '';
    }

    DateTime _date = DateTime.parse(date);
    if (lang == 'ar') {
      return DateFormat("yyyy-M-d  hh:mm a", 'en_US').format(_date);
    } else {
      return DateFormat("d-M-yyyy  hh:mm a", 'en_US').format(_date);
    }
  }

  String TimeOnly(String? date, String lang) {

    if(date == '' || date!.isEmpty || date == 'null'){
      return '';
    }

    DateTime _date = DateTime.parse(date);
    if (lang == 'ar') {
      return DateFormat("hh:mm a", 'en_US').format(_date);
    } else {
      return DateFormat("hh:mm a", 'en_US').format(_date);
    }
  }


  String ShortDateWithDateTime(DateTime date, String? lang) {

    if(date == '' || date == 'null'){
      return '';
    }

    if (lang == 'ar') {
      return DateFormat("dd-MM-yyyy", 'ar').format(date);
    } else {
      return DateFormat("dd-MM-yyyy", 'en_US').format(date);
    }
  }

  String LongDate(String date, String lang) {

    if(date == '' || date.isEmpty || date == 'null'){
      return '';
    }

    DateTime _date = DateTime.parse(date);
    if (lang == 'ar') {
      return DateFormat("dd-MMM-yyyy", 'ar').format(_date);
    } else {
      return DateFormat("dd-MMM-yyyy", 'en_US').format(_date);
    }
  }

  String longDateWithDay(String date, String lang) {
    if(date == '' || date.isEmpty || date == 'null'){
      return '';
    }
    DateTime _date = DateTime.parse(date);
    if (lang == 'ar') {
      var date = DateFormat("dd-MM-yyyy", 'en_US').format(_date);
      var day = DateFormat.EEEE('ar').format(_date);
      return day + ',' + date;
    } else {
      var date = DateFormat("dd-MM-yyyy", 'en_US').format(_date);
      var day = DateFormat.EEEE('en_US').format(_date);
      return day + ',' + date;
    }
  }

  String fullDayOnly(String? date, String? lang) {
    if(date == '' || date!.isEmpty || date == 'null'){
      return '';
    }
    DateTime _date = DateTime.parse(date);
    if (lang == 'ar') {
      var day = DateFormat.EEEE('ar').format(_date);
      return day;
    } else {
      var day = DateFormat('EEEE','en_US').format(_date);
      return day;
    }
  }

  String shortDayOnly(String? date, String? lang) {
    if(date == '' || date!.isEmpty || date == 'null'){
      return '';
    }
    DateTime _date = DateTime.parse(date);
    if (lang == 'ar') {
      var day = DateFormat.EEEE('ar').format(_date);
      return day;
    } else {
      var day = DateFormat('EE','en_US').format(_date);
      return day;
    }
  }
  String dayNumber(String? date, String? lang) {
    if(date == '' || date!.isEmpty || date == 'null'){
      return '';
    }
    DateTime _date = DateTime.parse(date);

      var day = _date.day.toString();
      return day;

  }


  String ClockMinutesSeconds(Duration d, String? lang) {
    if(d == '' || d == 'null'){
      return '';
    }
    // var mil_s = (d.inMilliseconds % 1000).toString().padLeft(3, '0');
    var sec_s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return d.inMinutes.toString().padLeft(2, '0') + ':' + sec_s + '  ';


  }

}
