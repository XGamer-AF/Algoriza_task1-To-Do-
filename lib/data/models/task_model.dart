class TaskModel {
  int? taskID;
  String? taskTitle;
  String? taskDeadline;
  String? startTime;
  String? endTime;
  int? isReminded;
  String? remind;
  int? isRepeated;
  String? repeat;
  int? taskColor;
  String? taskStatus;
  int? isFavourite;

  TaskModel({
    this.taskID,
    this.taskTitle,
    this.taskDeadline,
    this.startTime,
    this.endTime,
    this.isReminded,
    this.remind,
    this.isRepeated,
    this.repeat,
    this.taskColor,
    this.taskStatus,
    this.isFavourite
  });

  //Not used in our app
  TaskModel.fromJson(Map<String, dynamic> json) {
    taskID = json['taskID'];
    taskTitle = json['taskTitle'];
    taskDeadline = json['taskDeadline'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    isReminded = json['isReminded'];
    remind = json['remind'];
    isRepeated = json['isRepeated'];
    repeat = json['repeat'];
    taskColor = json['taskColor'];
    taskStatus = json['taskStatus'];
    isFavourite = json['isFavourite'];
  }

  //Not used in our app
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskID'] = this.taskID;
    data['taskTitle'] = this.taskTitle;
    data['taskDeadline'] = this.taskDeadline;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['isReminded'] = this.isReminded;
    data['remind'] = this.remind;
    data['isRepeated'] = this.isRepeated;
    data['repeat'] = this.repeat;
    data['taskColor'] = this.taskColor;
    data['taskStatus'] = this.taskStatus;
    data['isFavourite'] = this.isFavourite;
    return data;
  }
}
