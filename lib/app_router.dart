import 'package:flutter/material.dart';
import 'package:todo_app/data/models/data_change_lang.dart';
import 'package:todo_app/presentations/screens/Intro.dart';
import 'package:todo_app/presentations/screens/add_task/add_task_screen.dart';
import 'package:todo_app/presentations/screens/boarding/boarding_screen.dart';
import 'package:todo_app/presentations/screens/home/home_screen.dart';
import 'package:todo_app/presentations/screens/language/langugeMain.dart';
import 'package:todo_app/presentations/screens/start/getStart.dart';
import 'package:todo_app/presentations/screens/tasks_schedule/tasks_schedule_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final eventInfo = settings.arguments;
    final lang = settings.arguments;
    final _moreIndex = settings.arguments;
    switch (settings.name) {
      case '/':
        if (args is Data) {
          return MaterialPageRoute(builder: (_) => Intro(args));
        }
        break;

      case '/home':
        return MaterialPageRoute(builder: (_) => Home());

      case '/lang':
        return MaterialPageRoute(builder: (_) => LanguageMain());

      case '/onBoarding':
        return MaterialPageRoute(builder: (_) => BoardingScreen());

      case '/getStart':
        return MaterialPageRoute(builder: (_) => GetStart());

      case '/addTask':
        return MaterialPageRoute(builder: (_) => AddTaskScreen());

      case '/tasksSchedule':
        return MaterialPageRoute(builder: (_) => TasksScheduleScreen());

      case '/intro':
        if (args is Data) {
          return MaterialPageRoute(builder: (_) => Intro(args));
        }

        return _errorRoute();
      default:
      // return MaterialPageRoute(builder: (_) => LogIn());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error '),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
