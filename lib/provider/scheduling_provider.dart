import 'dart:ffi';
import 'package:projek2/utils/date_time_helper.dart';
import 'package:projek2/utils/background_service.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'package:flutter/material.dart';
import 'package:projek2/utils/background_service.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledNews(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      print('Notification Activated');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Notification Canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
