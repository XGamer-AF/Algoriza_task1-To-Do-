import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/data/models/calender.dart';
import 'package:todo_app/utilities/custom_date_format.dart';

class CustomHorizontalCalendar extends StatefulWidget {
  final DateTime? firstDate;
  final DateTime? selectedDate;
  final String? lang;
  final DateTime? endDate;
  final Function(DateTime? dateTime)? onChangeDate;
  final int? dayOf;

  const CustomHorizontalCalendar(
      {Key? key,
      this.firstDate,
      this.lang,
      this.endDate,
      this.onChangeDate,
      this.dayOf,
      this.selectedDate})
      : super(key: key);

  @override
  _CustomHorizontalCalendarState createState() =>
      _CustomHorizontalCalendarState();
}

class _CustomHorizontalCalendarState extends State<CustomHorizontalCalendar> {
  Color? backgroundColor = OwnColors.colorPalette['white'];
  List<CalendarDate> dates = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var def = widget.endDate!.difference(widget.firstDate!).inDays;

    for (var i = 0; i <= def; i++) {
      dates.add(new CalendarDate(
          date: widget.firstDate!.add(Duration(days: i)), isSelect: false));
    }
    if (dates.length > 0) {
      var row = dates.where((element) =>
          CustomDateFormat().ShortDate(element.date.toString(), "en") ==
          CustomDateFormat().ShortDate(widget.selectedDate.toString(), "en"));
      if (row.length > 0) {
        row.first.isSelect = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return calendar();
  }

  Widget calendar() {
    var width = (MediaQuery.of(context).size.width - (3 * side)) * 0.29;

    if (dates.length > 0) {
      var row = dates.where((element) =>
          CustomDateFormat().ShortDate(element.date.toString(), "en") ==
          CustomDateFormat().ShortDate(widget.selectedDate.toString(), "en"));
    }

    return Container(
      // color: OwnColors.color2[50],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...dates.map((e) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  for (var row in dates) {
                    row.isSelect = false;
                  }
                  e.isSelect = true;
                  widget.onChangeDate!(e.date);
                });
              },
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: e.isSelect!
                              ? OwnColors.colorPalette['primary']
                              : OwnColors.colorPalette['white'],
                          borderRadius: BorderRadius.circular(round),
                          border: Border.all(
                              color: e.isSelect!
                                  ? OwnColors.colorPalette['primary']!
                                  : OwnColors.colorPalette['white']!,
                              width: 1.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(space1),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              CustomDateFormat()
                                  .shortDayOnly(e.date.toString(), widget.lang),
                              style: e.isSelect!
                                  ? OwnColors.suitableWhiteBold(widget.lang)
                                  : OwnColors.suitableBlackBold(widget.lang),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    e.date!.day.toString(),
                                    style: e.isSelect!
                                        ? OwnColors.suitableWhiteBold("en")
                                        : OwnColors.suitableBlackBold("en"),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: space1,
                  )
                ],
              ),
            );
          }).toList(),
        ]),
      ),
    );
  }
}
