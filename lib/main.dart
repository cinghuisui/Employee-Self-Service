import 'package:ess_mobile/kebijakanAPK/kebijakan_apk.dart';
import 'package:ess_mobile/login/login_page_new.dart';
import 'package:ess_mobile/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionColor: Colors.lightBlueAccent, // Warna biru saat teks diseleksi
          // selectionColor: Colors.blue.withOpacity(0.4),
          selectionHandleColor: Colors.blue,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: darkblueColor,
        ),
      ),
      home: hasAcceptedPolicy ? LoginPage1() : PolicyAgreementScreen(),
      // home: PolicyAgreementScreen(),
      // home: hasAcceptedPolicy ? LoginScreen() : PolicyAgreementScreen(),
      // home: ButtomNavBar(),
    );
  }
}
