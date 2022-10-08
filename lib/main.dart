import 'package:flutter/material.dart';
import 'package:projek2/Home.dart';
import 'package:projek2/RestaurantDetailPage.dart';
import 'package:projek2/RestaurantListPage.dart';
import 'package:projek2/widget_list_resto.dart';
import 'package:projek2/utils/background_service.dart';
import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:projek2/common/navigation.dart';
import 'package:projek2/Apiresto.dart';
import 'package:projek2/db/database_helper.dart';
import 'package:projek2/preferences/preferences_helper.dart';
import 'package:projek2/provider/database_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:projek2/provider/scheduling_provider.dart';
import 'package:projek2/provider/preferences_provider.dart';
import 'package:projek2/utils/notification_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();

  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
      ],
      child: Consumer<PreferencesProvider>(builder: (context, provider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: provider.themeData,
          navigatorKey: navigatorKey,
          routes: {
            RestaurantListPage.routeName: (context) =>
                const RestaurantListPage(),
          },
          home: Scaffold(body: RestaurantHomePage()),
        );
      }),
    );
  }
}
