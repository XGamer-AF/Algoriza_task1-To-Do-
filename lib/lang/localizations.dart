import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/lang/messages_all.dart';

class AppLocalizations {
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  //* Language -----------------------------------------------------------------

  String get LangMain1 {
    return Intl.message('الرجاء اختيار اللغة', name: 'LangMain1');
  }

  String get LangMain2 {
    return Intl.message('Please select language', name: 'LangMain2');
  }

  String get LangMain3 {
    return Intl.message('عربي', name: 'LangMain3');
  }

  String get LangMain4 {
    return Intl.message('English', name: 'LangMain4');
  }

  //----------------------------------------------------------------------------

  //* Splash -----------------------------------------------------------------

  String get todo_label {
    return Intl.message('To Do', name: 'todo_label');
  }

  //----------------------------------------------------------------------------

  //* Onboarding ---------------------------------------------------------------

  String get skip_label {
    return Intl.message('SKIP', name: 'skip_label');
  }

  String get slide1_title {
    return Intl.message('Add Task', name: 'slide1_title');
  }

  String get slide1_desc {
    return Intl.message(
        'If you find there is something missing, you can easily add it to you tasks',
        name: 'slide1_desc');
  }

  String get slide2_title {
    return Intl.message('Schedule Tasks', name: 'slide2_title');
  }

  String get slide2_desc {
    return Intl.message(
        'The app allows you to easily organise your tasks according to task type',
        name: 'slide2_desc');
  }

  String get slide3_title {
    return Intl.message('Attractive View', name: 'slide3_title');
  }

  String get slide3_desc {
    return Intl.message(
        'The app displays you own tasks in easily way which provide responsive view',
        name: 'slide3_desc');
  }

  String get getStart_btn {
    return Intl.message('Get Start', name: 'getStart_btn');
  }

  String get register_msg {
    return Intl.message("Don't have an account?", name: 'register_msg');
  }

  String get signup_btn {
    return Intl.message('Sign Up', name: 'signup_btn');
  }

  //----------------------------------------------------------------------------

  // * getStart-----------------------------------------------------------------

  String get getStart1 {
    return Intl.message('Simply', name: 'getStart1');
  }

  String get getStart2 {
    return Intl.message('Memorize', name: 'getStart2');
  }

  String get getStart3 {
    return Intl.message('Your Tasks', name: 'getStart3');
  }

  //----------------------------------------------------------------------------

  //* Login/Signup -------------------------------------------------------------

  String get welcome_msg {
    return Intl.message('Welcome to Fashion Daily', name: 'welcome_msg');
  }

  String get sign_in {
    return Intl.message('Sign in', name: 'sign_in');
  }

  String get mail_hint {
    return Intl.message('Email', name: 'mail_hint');
  }

  String get phone_hint {
    return Intl.message('Phone Number', name: 'phone_hint');
  }

  String get password_hint {
    return Intl.message('Password', name: 'password_hint');
  }

  String get register {
    return Intl.message('Register', name: 'register');
  }

  String get google_sign {
    return Intl.message('Sign with by google', name: 'google_sign');
  }

  String get register_msg2 {
    return Intl.message("Doesn't has an account?", name: 'register_msg2');
  }

  String get register_here {
    return Intl.message('Register here', name: 'register_here');
  }

  String get policy_msg {
    return Intl.message(
        'Use the application according to policy rules. Any kind of violation will be subject to sanctions',
        name: 'policy_msg');
  }

  String get sign_in_msg {
    return Intl.message("Has any account?", name: 'sign_in_msg');
  }

  String get sign_in_here {
    return Intl.message('Sign In here', name: 'sign_in_here');
  }

  String get accept_condition_msg {
    return Intl.message('By registering your account,you are agree to our',
        name: 'accept_condition_msg');
  }

  String get terms_condition {
    return Intl.message('terms and condition', name: 'terms_condition');
  }

  String get help {
    return Intl.message("Help", name: 'help');
  }

  String get or {
    return Intl.message('Or', name: 'or');
  }

  String get lang {
    return Intl.message('Lang', name: 'lang');
  }

//----------------------------------------------------------------------------

// * Home Page -----------------------------------------------------------------

  String get boardLabel {
    return Intl.message('Board', name: 'boardLabel');
  }

  String get allLabel {
    return Intl.message('All', name: 'allLabel');
  }

  String get completedLabel {
    return Intl.message('Completed', name: 'completedLabel');
  }

  String get unCompletedLabel {
    return Intl.message('Uncompleted', name: 'unCompletedLabel');
  }

  String get favLabel {
    return Intl.message('Favourite', name: 'favLabel');
  }

  String get addTaskBtn {
    return Intl.message('Add a task', name: 'addTaskBtn');
  }

  //---------------Menu btn ------------------------------
  String get completeTaskLabel {
    return Intl.message('Complete task', name: 'completeTaskLabel');
  }

  String get addFavLabel {
    return Intl.message('Add to favorites', name: 'addFavLabel');
  }

  String get removeTaskLabel {
    return Intl.message('Remove task', name: 'removeTaskLabel');
  }

//----------------------------------------------------------------------------

// * Add Task Page -----------------------------------------------------------

  String get addTaskLabel {
    return Intl.message('Add task', name: 'addTaskLabel');
  }

  String get titleLabel {
    return Intl.message('Title', name: 'titleLabel');
  }

  String get deadLineLabel {
    return Intl.message('Deadline', name: 'deadLineLabel');
  }

  String get startTimeLabel {
    return Intl.message('Start time', name: 'startTimeLabel');
  }

  String get endTimeLabel {
    return Intl.message('End time', name: 'endTimeLabel');
  }

  String get remindLabel {
    return Intl.message('Remind', name: 'remindLabel');
  }

  String get repeatLabel {
    return Intl.message('Repeat', name: 'repeatLabel');
  }

  String get createTaskBtn {
    return Intl.message('Create a task', name: 'createTaskBtn');
  }

  String get colorLabel {
    return Intl.message('Color', name: 'colorLabel');
  }

//----------------------------------------------------------------------------

// * Schedule Page -----------------------------------------------------------

  String get scheduleLabel {
    return Intl.message('Schedule', name: 'scheduleLabel');
  }

//----------------------------------------------------------------------------


}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<_DefaultCupertinoLocalizations>(
          _DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;

  _DefaultCupertinoLocalizations(this.locale);
}
