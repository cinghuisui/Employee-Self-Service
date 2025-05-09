import 'dart:async';

// import 'package:ess_mobile/menu/absensi_page.dart';
import 'package:ess_mobile/menu/cuti_izin_page.dart';
// import 'package:ess_mobile/menu/pengajuan_cuti.dart';
// import 'package:ess_mobile/menu/riwayat_pengajuan_cuti.dart';
import 'package:ess_mobile/styles/colors.dart';
import 'package:ess_mobile/styles/text_style.dart';
// import 'package:ess_mobile/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
// import 'package:lottie/lottie.dart' as lottie;

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
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

  void _showUnderDevelopment(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView (
                child: Lottie.asset(
                  'assets/lottie/Animation - 1740973278054.json',
                  width: 200,
                  height: 200,
                  repeat: true,
                ),
              ),
              // Icon(Icons.info_outline, size: 50, color: Colors.orange),
              // SizedBox(height: 10),
              SingleChildScrollView(
                child: Text(
                  "Layanana Belum Tersedia",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Text(
              //   "Layanan Belum Tersedia",
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
              // ),
              SizedBox(height: 10),
              SingleChildScrollView (
                child: Text(
                  "Fitur ini masih dalam tahap pengembangan. Nantikan update berikutnya!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 14,color: Colors.grey,
                  ),
                ),
              ),
              // Text(
              //   "Fitur ini masih dalam tahap pengembangan. Nantikan update berikutnya!",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 14, color: Colors.grey),
              // ),
              SizedBox(height: 20),
              SingleChildScrollView (
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.orangeAccent,
                      backgroundColor: Colors.blue[800]),
                  onPressed: () => Navigator.pop(context),
                  child: Text("Tutup", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white,),),
                ),
              ),

              SizedBox(height: 20,),
            ],
          ),
        );
      },
    );
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
      // physics: BouncingScrollPhysics(),
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
                  // Text(
                  //   "ESS MOBILE",
                  //   style: GoogleFonts.roboto(
                  //     fontSize: 45,
                  //     fontWeight: FontWeight.bold,color: Colors.white,
                  //   ),
                  // ),
                  Text(
                    'ESS MOBILE',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.grey[100],
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          spacing: 44,
                          runSpacing: 20,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CutiIzin()),
                                );
                              },
                              child: Category(
                                color: Color(0xffFEBD2B),
                                icon: Icon(
                                  (FontAwesomeIcons.filePen),
                                  size: 35,
                                  color: Colors.white,
                                ),
                                caption: "Cuti / Izin",
                              ),
                            ),
                            InkWell(
                              onTap: () => _showUnderDevelopment(context),
                              // onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) {
                              //         _showUnavailableService(context);
                              //         return Container(); // Return an empty container or any other widget
                              //       }),
                              // );
                              // },
                              child: Category(
                                color: Color(0Xff67DD7F),
                                icon: Icon(
                                  Icons.receipt,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                caption: "Slip Gaji",
                                // caption: "Riwayat\nPengajuan Cuti",
                              ),
                            ),
                            InkWell(
                              onTap: () => _showUnderDevelopment(context),
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Absensi()),
                              //   );
                              // },
                              child: Category(
                                color: Color(0xff56A5FF),
                                icon: Icon(
                                  Icons.edit_calendar,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                caption: "Absensi",
                              ),
                            ),
                            InkWell(
                              onTap: () => _showUnderDevelopment(context),
                              child: Category(
                                color: Color(0xffF86867),
                                icon: Icon(
                                  Icons.warning,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                caption: "Warning",
                              ),
                            ),
                            InkWell(
                              onTap: () => _showUnderDevelopment(context),
                              child: Category(
                                  color: Color(0xffBC73FF),
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  caption: "Transaki \n Belanja Bulanan"),
                            ),
                            InkWell(
                              onTap: () => _showUnderDevelopment(context),
                              child: Category(
                                color: Color(0xFF2193B0),
                                icon: Icon(
                                  Icons.update,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                caption: "Update Data",
                              ),
                            ),
                            InkWell(
                              onTap: () => _showUnderDevelopment(context),
                              child: Category(
                                color: Color(0xFF56AB2F),
                                icon: Icon(
                                  Icons.lock,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                caption: "OTP \n Transaksi",
                              ),
                            ),
                            InkWell(
                              onTap: () => _showUnderDevelopment(context),
                              child: Category(
                                color: Color(0xFF1E3C72),
                                icon: Icon(
                                  Icons.leaderboard,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                caption: "Update",
                              ),
                            ),
                            InkWell(
                              onTap: () => _showUnderDevelopment(context),
                              child: Category(
                                color: Color(0xFFFF9A9E),
                                icon: Icon(
                                  Icons.settings,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                caption: "Setting",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Card(
          //         color: Colors.blue[50],
          //         elevation: 3,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //         child: ListTile(
          //           leading: Icon(Icons.person, size: 40, color: Colors.blue),
          //           title: Text("Rizkillah Rasyid"),
          //           subtitle: Text("Programmer"),
          //           trailing: IconButton(
          //             icon: Icon(Icons.arrow_forward),
          //             onPressed: () {
          //               print("Card diklik!");
          //             },
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 20,
          // ),

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
          style: kSubtitle2.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 9,
          ),
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          //   fontSize: 10,
          // ),
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
