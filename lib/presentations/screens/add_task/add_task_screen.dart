import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/data/local_db/task_helper.dart';
import 'package:todo_app/data/models/remind_menu.dart';
import 'package:todo_app/data/models/repeat_menu.dart';
import 'package:todo_app/data/models/task_colors.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/utilities/TextBoxNormal.dart';
import 'package:todo_app/utilities/app_bar.dart';
import 'package:todo_app/utilities/constant_text_form_field.dart';
import 'package:todo_app/utilities/cookies_class.dart';
import 'package:todo_app/utilities/custom_button.dart';
import 'package:todo_app/utilities/custom_date_format.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? lang = '';

  TextEditingController title = new TextEditingController();
  TextEditingController remind = new TextEditingController();
  TextEditingController repeat = new TextEditingController();
  TextEditingController color = new TextEditingController();

  DateTime currentDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime deadLineDate = DateTime.now();

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  String startTimeText = '';
  String endTimeText = '';

  List<RemindMenu> remindChoices = [];
  List<RepeatMenu> repeatChoices = [];
  RemindMenu? remindSelectedItem;
  RepeatMenu? repeatSelectedItem;

  List<TaskColors> taskColors = [];
  Color? taskColor;

  selectDateBtn(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: currentDate,
        lastDate: endDate);
    if (picked != null && picked != deadLineDate) {
      setState(() {
        deadLineDate = picked;
      });
    }
  }

  Future<TimeOfDay> selectTimeBtn(
      BuildContext context, TimeOfDay? initialTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      return picked;
    } else {
      return TimeOfDay.now();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    endDate =
        DateTime(currentDate.year + 2, currentDate.month, currentDate.day);

    remindChoices = RemindMenu.fillRemindRepeatList();
    repeatChoices = RepeatMenu.fillRemindRepeatList();
    remindSelectedItem = remindChoices[0];
    repeatSelectedItem = repeatChoices[0];

    taskColors = TaskColors.fillTaskColors();
    taskColor = taskColors[0].color;

    endTime = TimeOfDay(hour: startTime.hour, minute: startTime.minute + 10);

    startTimeText =
        startTime.hour.toString() + ' : ' + startTime.minute.toString();

    endTimeText = endTime.hour.toString() + ' : ' + endTime.minute.toString();

    getLang().then((value) {
      setState(() {
        lang = value;
      });
    });
  }

  Future<String?> getLang() async {
    return await getValuesSF("lang");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBarUpdated(
                lang: lang,
                title: AppLocalizations.of(context)!.addTaskLabel,
                withBorder: true,
                leadingWidget: BackIconAppBar(
                  lang: lang,
                )),
            Padding(
              padding: const EdgeInsets.only(
                  top: space2, right: side, left: side, bottom: bottom),
              child: Column(
                children: [
                  CustomTextBoxNormal(
                    title: AppLocalizations.of(context)!.titleLabel,
                    keyboardPadding: true,
                    lang: lang,
                    index: 0,
                    hint: AppLocalizations.of(context)!.titleLabel,
                    tec: title,
                  ),
                  ConstantTextFormField(
                    lang: lang,
                    title: AppLocalizations.of(context)!.deadLineLabel,
                    text: CustomDateFormat()
                        .ShortDate(deadLineDate.toString(), lang),
                    onClick: () {
                      selectDateBtn(context);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                      color: OwnColors.colorPalette['gray'],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ConstantTextFormField(
                          lang: lang,
                          title: AppLocalizations.of(context)!.startTimeLabel,
                          text: startTimeText,
                          onClick: () {
                            selectTimeBtn(context, null).then((value) {
                              setState(() {
                                startTime = value;
                                startTimeText = startTime.hour.toString() +
                                    ' : ' +
                                    startTime.minute.toString();
                              });
                            });
                          },
                          icon: Icon(
                            Icons.access_time,
                            size: 25,
                            color: OwnColors.colorPalette['gray'],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: space1,
                      ),
                      Expanded(
                        child: ConstantTextFormField(
                          lang: lang,
                          title: AppLocalizations.of(context)!.endTimeLabel,
                          text: endTimeText,
                          onClick: () {
                            selectTimeBtn(context, endTime).then((value) {
                              setState(() {
                                endTime = value;
                                endTimeText = endTime.hour.toString() +
                                    ' : ' +
                                    endTime.minute.toString();

                              });
                            });
                          },
                          icon: Icon(
                            Icons.access_time,
                            size: 25,
                            color: OwnColors.colorPalette['gray'],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ConstantTextFormField(
                    lang: lang,
                    title: AppLocalizations.of(context)!.remindLabel,
                    onClick: () {},
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(lang == 'en'
                            ? remindSelectedItem!.nameEn ?? ''
                            : remindSelectedItem!.nameAr ?? ''),
                        PopupMenuButton(
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          elevation: 3.2,
                          initialValue: '',
                          onCanceled: () {
                            print('You have not chossed anything');
                          },

                          // onSelected:
                          itemBuilder: (BuildContext context) {
                            return remindChoices.map((item) {
                              return PopupMenuItem(
                                onTap: () {
                                  var itemIndex = remindChoices.indexOf(item);
                                  setState(() {
                                    remindSelectedItem =
                                        remindChoices[itemIndex];
                                  });
                                },
                                value: item.ID.toString(),
                                child: Text(lang == 'en'
                                    ? item.nameEn ?? ''
                                    : item.nameAr ?? ''),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                  ),
                  ConstantTextFormField(
                    lang: lang,
                    title: AppLocalizations.of(context)!.repeatLabel,
                    onClick: () {},
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(lang == 'en'
                            ? repeatSelectedItem!.nameEn ?? ''
                            : repeatSelectedItem!.nameAr ?? ''),
                        PopupMenuButton(
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          elevation: 3.2,
                          initialValue: '',
                          onCanceled: () {
                            print('You have not chossed anything');
                          },

                          // onSelected:
                          itemBuilder: (BuildContext context) {
                            return repeatChoices.map((item) {
                              return PopupMenuItem(
                                onTap: () {
                                  var itemIndex = repeatChoices.indexOf(item);
                                  setState(() {
                                    repeatSelectedItem =
                                        repeatChoices[itemIndex];
                                  });
                                },
                                value: item.ID.toString(),
                                child: Text(lang == 'en'
                                    ? item.nameEn ?? ''
                                    : item.nameAr ?? ''),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                  ),
                  ConstantTextFormField(
                    lang: lang,
                    title: AppLocalizations.of(context)!.colorLabel,
                    bgColor: OwnColors.colorPalette['white'],
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...taskColors.map((e) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                var rowIndex = taskColors.indexOf(e);
                                taskColor = taskColors[rowIndex].color;
                                selectedColor(rowIndex);
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(round),
                                  color: e.color,
                                  shape: BoxShape.circle,
                                  border: e.isSelected!
                                      ? Border.all(
                                          color:
                                              OwnColors.colorPalette['gray']!,
                                          width: 2)
                                      : null),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  CustomButton(
                    lang: lang,
                    text: AppLocalizations.of(context)!.createTaskBtn,
                    textStyle: OwnColors.btnWhite(lang),
                    onClick: () {
                      addNewTask();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  selectedColor(int index) {
    setState(() {
      for (var item in taskColors) {
        item.isSelected = false;
      }
      taskColors[index].isSelected = true;
    });
  }

  addNewTask() async {
    int isReminded = 0;
    if (remindSelectedItem!.ID.toString() != 1) {
      setState(() {
        isReminded = 1;
      });
    }

    int isRepeated = 0;
    if (repeatSelectedItem!.ID.toString() != 1) {
      setState(() {
        isRepeated = 1;
      });
    }

    TaskModel selectedTaskModel = new TaskModel(
        taskTitle: title.text,
        taskDeadline: deadLineDate.toString(),
        startTime: startTimeText,
        endTime: endTimeText,
        isReminded: isReminded,
        remind: isReminded != 0
            ? lang == 'en'
                ? remindSelectedItem!.nameEn
                : remindSelectedItem!.nameAr
            : '',
        isRepeated: isRepeated,
        repeat: isRepeated != 0
            ? lang == 'en'
                ? repeatSelectedItem!.nameEn
                : repeatSelectedItem!.nameAr
            : '',
        taskStatus: '',
        taskColor: taskColor!.value,
        isFavourite: 0);

    TaskHelper db = new TaskHelper();
    await db.savePost(selectedTaskModel);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }
}
