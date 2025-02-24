import 'package:ess_mobile/styles/colors.dart';
import 'package:ess_mobile/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';

class KayPage extends StatelessWidget {
  
  const KayPage({super.key});
  
  String getFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(now);
    return formattedDate;
  }

  

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/bg-container-2.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: kGrey.withOpacity(0.8),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    'ESS Mobile',
                    style: kHeading6.copyWith(
                      color: kWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Text(
                  //   'Savings Value',
                  //   style: kSubtitle2.copyWith(
                  //       color: kWhite, fontWeight: FontWeight.w600),
                  // ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    getFormattedDate(), // Format tanggal otomatis
                    style: kSubtitle2.copyWith(
                      color: kWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// // import 'package:ess_mobile/main.dart';
// import 'package:ess_mobile/pages/kay/tanggal.dart';
// // import 'package:ess_mobile/styles/colors.dart';
// // import 'package:ess_mobile/styles/text_style.dart';
// import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:intl/intl.dart';
// // import 'package:intl/date_symbol_data_local.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized(); // Pastikan Flutter terinisialisasi
// //   await initializeDateFormatting('id_ID', null); // Gantilah dengan locale yang diperlukan
// //   runApp(KayPage());
// // }

// class KayPage extends StatelessWidget {
//   const KayPage({super.key});

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await initializeDateFormatting('id_ID', null); // Inisialisasi format lokal

// //   runApp(MyAppp());
// // }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyAppp(),
//     );
//   }
// }
