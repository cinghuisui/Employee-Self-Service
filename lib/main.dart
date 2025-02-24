// import 'package:ess_mobile/buttomnavbar/buttom_nav_bar.dart';
// import 'package:ess_mobile/buttomnavbar/buttom_nav_bar.dart';
import 'package:ess_mobile/kebijakanAPK/kebijakan_apk.dart';
import 'package:ess_mobile/login/login_page.dart';
// import 'package:ess_mobile/pages/kay/tanggal.dart';
// import 'package:ess_mobile/pages/kay/kay_page.dart';
import 'package:ess_mobile/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intl/date_symbol_data_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

bool hasAcceptedPolicy = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasAcceptedPolicy = prefs.getBool('hasAcceptedPolicy') ?? false;
  runApp(MyApp(hasAcceptedPolicy: hasAcceptedPolicy));

  //  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null); // Inisialisasi format lokal

  // runApp(HomeScreen());
}

// void main1() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeDateFormatting('id_ID', null); // Inisialisasi format lokal

//   runApp(HomeScreen());
// }

class MyApp extends StatelessWidget {
  final bool hasAcceptedPolicy;
  const MyApp({required this.hasAcceptedPolicy});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue[800],
      ), // transparent status bar color
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: darkblueColor,
        ),
      ),
      home: hasAcceptedPolicy ? LoginPage() : PolicyAgreementScreen(),
      // home: PolicyAgreementScreen(),
      // home: hasAcceptedPolicy ? LoginScreen() : PolicyAgreementScreen(),
      // home: ButtomNavBar(),
    );
  }
}
