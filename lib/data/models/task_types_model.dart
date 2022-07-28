import 'package:todo_app/lang/localizations.dart';

class TaskTypesModel {
  int ID;
  String? taskTypeName;
  bool? isSelected;

  TaskTypesModel({
    required this.ID,
    this.taskTypeName,
    this.isSelected,
  });

  static List<TaskTypesModel> fillTaskTypes() {
    List<TaskTypesModel> taskTypes = [];

    taskTypes.add(TaskTypesModel(
        ID: 1,
        taskTypeName: AppLocalizations().allLabel,
        isSelected: true));

    taskTypes.add(TaskTypesModel(
        ID: 2,
        taskTypeName: AppLocalizations().completedLabel,
        isSelected: false));

    taskTypes.add(TaskTypesModel(
        ID: 3,
        taskTypeName: AppLocalizations().unCompletedLabel,
        isSelected: false));

    taskTypes.add(TaskTypesModel(
        ID: 4,
        taskTypeName: AppLocalizations().favLabel,
        isSelected: false));

    return taskTypes;
  }
}
