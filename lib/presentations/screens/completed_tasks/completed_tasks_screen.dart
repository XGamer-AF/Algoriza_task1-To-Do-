import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/constants/theme.dart';
import 'package:todo_app/data/local_db/task_helper.dart';
import 'package:todo_app/data/models/task_model.dart';
import 'package:todo_app/lang/localizations.dart';
import 'package:todo_app/utilities/cookies_class.dart';

class CompletedTasksScreen extends StatefulWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTasksScreen> createState() => _CompletedTasksScreenState();
}

class _CompletedTasksScreenState extends State<CompletedTasksScreen> {
  String? lang = '';

  List<TaskModel> completedTasks = [];
  List<String> moreMenu = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLang().then((value) {
      setState(() {
        lang = value;
      });
    });
    moreMenu = [
      AppLocalizations().completeTaskLabel,
      AppLocalizations().addFavLabel,
      AppLocalizations().removeTaskLabel,
    ];

    getCompletedTasks();
  }

  Future<String?> getLang() async {
    return await getValuesSF("lang");
  }

  getCompletedTasks() async {
    TaskHelper db = TaskHelper();
    var tmp = await db.getAll();
    completedTasks =
        tmp.where((element) => element.taskStatus == 'completed').toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: side, vertical: top),
        child: Column(
          children: [
            ...completedTasks.map((task) {
              return Padding(
                padding: const EdgeInsets.only(bottom: space3),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    var taskItem = task;
                    changeTaskStatus(taskItem);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: Color(task.taskColor!)),
                                color: task.taskStatus == 'completed'
                                    ? Color(task.taskColor!)
                                    : Colors.transparent),
                            child: Icon(
                              Icons.check,
                              color: OwnColors.colorPalette['white'],
                            ),
                          ),
                          SizedBox(
                            width: space1,
                          ),
                          Text(
                            task.taskTitle ?? '',
                            style: OwnColors.bigBlack(lang),
                          )
                        ],
                      ),

                      PopupMenuButton(
                        elevation: 3.2,
                        initialValue: '',
                        onCanceled: () {
                          print('You have not chossed anything');
                        },

                        // onSelected:
                        itemBuilder: (BuildContext context) {
                          return moreMenu.map((choice) {
                            return PopupMenuItem(
                              onTap: () {
                                var index = moreMenu.indexOf(choice);
                                if (index == 0) {
                                  changeTaskStatus(task);
                                  return;
                                }
                                if (index == 1) {
                                  addFavourite(task);
                                  return;
                                }
                                if(index == 2){
                                  removeTask(task);
                                }
                              },
                              value: moreMenu.indexOf(choice).toString(),
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      )

                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  changeTaskStatus(TaskModel task) async {
    if (task.taskStatus != 'completed') {
      setState(() {
        task.taskStatus = 'completed';
      });
    } else {
      setState(() {
        task.taskStatus = '';
      });
    }

    TaskHelper db = TaskHelper();
    await db.update(task);
    getCompletedTasks();
  }


  addFavourite(TaskModel task) async {
    if (task.isFavourite != 1) {
      setState(() {
        task.isFavourite = 1;
      });
    } else {
      setState(() {
        task.isFavourite = 0;
      });
    }

    TaskHelper db = TaskHelper();
    await db.update(task);
  }

  removeTask(TaskModel task) async {
    TaskHelper db = TaskHelper();
    await db.delete(task.taskID.toString());
    getCompletedTasks();
  }

}
