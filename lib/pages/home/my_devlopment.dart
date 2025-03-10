import 'package:ess_mobile/menu/cuti_izin_page.dart';
import 'package:ess_mobile/pages/home/home_page_new.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(mydevlopment());
}

class mydevlopment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
              Lottie.asset(
                'assets/lottie/Animation - 1740973278054.json', width: 200, height: 200, repeat: true,
              ),
              // Icon(Icons.info_outline, size: 50, color: Colors.orange),
              // SizedBox(height: 10),
              Text(
                "Layanan Belum Tersedia",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Fitur ini masih dalam tahap pengembangan. Nantikan update berikutnya!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(style: ElevatedButton.styleFrom(shadowColor: Colors.orange,backgroundColor: Colors.orange),
                onPressed: () => Navigator.pop(context),
                child: Text("Tutup", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Menu")),
      body: Center(
        child: Padding(
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
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) {
                                //         _showUnavailableService(context);
                                //         return Container(); // Return an empty container or any other widget
                                //       }),
                                // );
                              },
                           child:  Category(
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
                              //   //  () => _showUnderDevelopment(context);
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomeScreen()),
                              //   );
                              // },
                            child:  Category(
                              color: Color(0xff56A5FF),
                              icon: Icon(
                                Icons.edit_calendar,
                                size: 35,
                                color: Colors.white,
                              ),
                              caption: "Absensi",
                            ),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        // child: ElevatedButton(
        //   onPressed: () => _showUnderDevelopment(context),
        //   child: Text("Klik Menu"),
        // ),
      ),
    );
  }
}


