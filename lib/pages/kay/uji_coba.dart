import 'dart:async';

import 'package:ess_mobile/menu/pengajuan_cuti.dart';
import 'package:ess_mobile/styles/colors.dart';
import 'package:ess_mobile/styles/text_style.dart';
// import 'package:ess_mobile/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UjiCoba extends StatefulWidget {
  const UjiCoba({super.key});

  @override
  State<UjiCoba> createState() => _UjiCobaState();
}

class _UjiCobaState extends State<UjiCoba> {
  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Matikan timer saat widget dihapus
    super.dispose();
  }

  String getFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
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
                image: AssetImage('assets/images/bg-container.png'),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
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
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    _currentTime,
                    style: kSubtitle2.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.grey[100],
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                    child: Expanded(
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 30,
                        runSpacing: 20,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PengajuanCuti()),
                              );
                            },
                            child: Category(
                              color: Color(0xffFEBD2B),
                              icon: Icon(
                                Icons.work,
                                size: 35,
                                color: Colors.white,
                              ),
                              caption: "Cuti / Izin",
                            ),
                          ),
                          Category(
                            color: Color(0Xff67DD7F),
                            icon: Icon(
                              Icons.slideshow_sharp,
                              size: 35,
                              color: Colors.white,
                            ),
                            caption: "Slip Gaji",
                          ),
                          Category(
                            color: Color(0xff56A5FF),
                            icon: Icon(
                              Icons.calendar_today,
                              size: 35,
                              color: Colors.white,
                            ),
                            caption: "Absensi",
                          ),
                          Category(
                            color: Color(0xffF86867),
                            icon: Icon(
                              Icons.warning,
                              size: 35,
                              color: Colors.white,
                            ),
                            caption: "Warning",
                          ),
                          Category(
                              color: Color(0xffBC73FF),
                              icon: Icon(
                                Icons.shopping_cart,
                                size: 35,
                                color: Colors.white,
                              ),
                              caption: "Transaki \n Belanja Bulanan"),
                          Category(
                            color: Color(0xFF2193B0),
                            icon: Icon(
                              Icons.update,
                              size: 35,
                              color: Colors.white,
                            ),
                            caption: "Update Data",
                          ),
                          Category(
                            color: Color(0xFF56AB2F),
                            icon: Icon(
                              Icons.lock,
                              size: 35,
                              color: Colors.white,
                            ),
                            caption: "OTP \n Transaksi",
                          ),
                          Category(
                            color: Color(0xFF1E3C72),
                            icon: Icon(
                              Icons.leaderboard,
                              size: 35,
                              color: Colors.white,
                            ),
                            caption: "Update",
                          ),
                          Category(
                            color: Color(0xFFFF9A9E),
                            icon: Icon(
                              Icons.settings,
                              size: 35,
                              color: Colors.white,
                            ),
                            caption: "Setting",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ),
          // SizedBox(
          //         width: MediaQuery.of(context).size.width,
          //         child: Padding(
          //           padding: const EdgeInsets.only(
          //             left: 20,
          //             right: 20,
          //           ),

          //         ),
          //       ),
        ],
      ),
    );    
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.color,
    required this.icon,
    required this.caption,
  });
  final Color color;
  final Icon icon;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: color.withOpacity(0.4),
                offset: Offset(0, 10),
              ),
            ],
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: icon,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          caption,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class CutiIzinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cuti / Izin")),
      body: Center(
        child: Text(
          "Ini adalah halaman Cuti / Izin",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
