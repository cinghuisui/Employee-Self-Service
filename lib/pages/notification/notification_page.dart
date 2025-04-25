import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(Notifi());
}

class Notifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // final TextEditingController _searchController = TextEditingController();
  bool isFocused = false; // Untuk melacak status fokus TextField

  // Data Notifikasi
  List<Map<String, String>> notifications = [
    {
      "icon": "approved",
      "title": "Pengajuan Cuti Anda Berhasil di Approve",
      "approver": "Junaidi",
      "role": "Manager Departement",
      "date": "20 Feb",
      "month": "Bulan Ini"
    },
    {
      "icon": "pending",
      "title": "Pengajuan Cuti Anda Menunggu Di Approve",
      "approver": "Junaidi",
      "role": "Manager Departement",
      "date": "15 Feb",
      "month": "Bulan Ini"
    },
    {
      "icon": "rejected",
      "title": "Pengajuan Cuti Anda Ditolak",
      "ditolak": "Junaidi",
      "role": "Manager Departement",
      "date": "10 Feb",
      "month": "Bulan Ini"
    },
    {
      "icon": "approved",
      "title": "Pengajuan Cuti Anda Berhasil di Approve",
      "approver": "Junaidi",
      "role": "Manager Departement",
      "date": "22 Jan",
      "month": "Januari 2025"
    },
    {
      "icon": "pending",
      "title": "Pengajuan Cuti Anda Menunggu Di Approve",
      "approver": "Junaidi",
      "role": "Manager Departement",
      "date": "18 Jan",
      "month": "Januari 2025"
    },
    {
      "icon": "rejected",
      "title": "Pengajuan Cuti Anda Ditolak",
      "approver": "Junaidi",
      "role": "Manager Departement",
      "date": "14 Jan",
      "month": "Januari 2025"
    },
  ];
  List<Map<String, String>> filteredNotifications = [];
  void _filterNotifications(String query) {
    setState(() {
      filteredNotifications = notifications
          .where((notification) => notification["title"]!
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mengelompokkan data berdasarkan bulan
    Map<String, List<Map<String, dynamic>>> groupedNotifications = {};
    for (var notification in notifications) {
      groupedNotifications.putIfAbsent(notification["month"]!, () => []);
      groupedNotifications[notification["month"]!]!.add(notification);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Notification",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue[800],
        // leading: Icon(
        //   Icons.arrow_back,
        //   color: Colors.white,
        // ),
      ),
      body: Column(
        children: [
          // Kotak Pencarian
          Padding(
            padding: const EdgeInsets.all(10),
            child: Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  isFocused = hasFocus; // Ubah status saat fokus berubah
                });
              },
              child: Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: TextSelectionThemeData(
                    selectionColor:
                        Colors.blue[800], // Warna merah saat teks diblok
                    cursorColor: Colors.blue[800], // Kursor merah
                    selectionHandleColor:
                        Colors.blue[800], // Pegangan seleksi merah
                  ),
                ),
                child: TextField(
                  cursorColor: Colors.blue[800], // Kursor warna merah
                  onChanged: _filterNotifications,
                  decoration: InputDecoration(
                    hintText: "Cari Riwayat",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2), // Garis merah saat diklik
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: isFocused
                            ? Colors.blue
                            : Colors.grey, // Sesuaikan warna border
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: groupedNotifications.keys.map((month) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Bulan dengan Background Abu-Abu Full Width
                    Container(
                      width: double.infinity,
                      color: Colors.grey[300],
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text(
                        month,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // List Notifikasi dengan Garis Pemisah
                    ...groupedNotifications[month]!.map((notification) {
                      return Column(
                        children: [
                          ListTile(
                            leading: _getIcon(notification["icon"]!),
                            title: Text(
                              notification["title"]!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "Di Approve Oleh ${notification["approver"]}\n${notification["role"]}"),
                            trailing: Text(notification["date"]!),
                          ),
                          Divider(), // Garis pemisah antar item
                        ],
                      );
                    }),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk mendapatkan ikon berdasarkan status
  Widget _getIcon(String status) {
    switch (status) {
      case "approved":
        return CircleAvatar(
          backgroundColor: Colors.green[100],
          child: FaIcon(FontAwesomeIcons.calendarCheck, color: Colors.green),
          // child: Icon(Icons.verified, color: Colors.green),
        );
      case "pending":
        return CircleAvatar(
          backgroundColor: Colors.orange[100],
          child: Icon(Icons.pending_actions, color: Colors.orange),
        );
      case "rejected":
        return CircleAvatar(
          backgroundColor: Colors.red[100],
          child: (FaIcon(
            FontAwesomeIcons.calendarXmark,
            color: Colors.red,
          )),
          // child: Icon(Icons.highlight_off, color: Colors.red),
        );
      default:
        return CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.notifications, color: Colors.grey),
        );
    }
  }
}









// import 'package:ess_mobile/buttomnavbar/buttom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: NotificationPage(),
//     );
//   }
// }

// class NotificationPage extends StatelessWidget {
//   final List <Map<String, String>> notifications = [
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "04 Feb"},
//     {"title": "Pengajuan Izin Anda Berhasil di Approve", "date": "03 Feb"},
//     {"title": "Pengajuan CM Anda Berhasil di Approve", "date": "02 Feb"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "01 Feb"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "10 Jan"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "09 Jan"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "08 Jan"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "07 Jan"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "06 Jan"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "05 Jan"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "04 Jan"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "03 Jan"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "02 Jan"},
//     {"title": "Pengajuan Cuti Anda Berhasil di Approve", "date": "01 Jan"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//      SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//     ]);
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(
//           statusBarColor: Colors.transparent), // transparent status bar color
//     );
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.blue[800],
//         title: Text('Notification',style: TextStyle(color: Colors.white),),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back,color: Colors.white,),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => ButtomNavBar(),),
//             );
//             // Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.all(16.0),
//             color: Colors.grey[300],
//             width: double.infinity,
//             child: Text("Info", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           ),
//           Expanded(            
//             child: ListView.builder(
//               itemCount: notifications.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Icon(Icons.circle, color: Colors.green, size: 12),
//                   title: Text(notifications[index]["title"]!),
//                   trailing: Text(notifications[index]["date"]!,
//                       style: TextStyle(color: Colors.black54)),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
