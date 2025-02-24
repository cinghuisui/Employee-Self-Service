import 'package:ess_mobile/buttomnavbar/buttom_nav_bar.dart';
import 'package:ess_mobile/pages/profile/change_password.dart';
import 'package:ess_mobile/pages/profile/profile_settings.dart';
// import 'package:ess_mobile/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ButtomNavBar(),),
            );
            // Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text("Andi Wibawa",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Operator",
                    style: TextStyle(fontSize: 16, color: Colors.black54)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.blue),
                  title: Text("Notification Settings"),
                  trailing: Text("On", style: TextStyle(color: Colors.black54)),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.blue),
                  title: Text("Calender Settings"),
                  trailing: Text("On", style: TextStyle(color: Colors.black54)),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text("Account Settings"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileSettings()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.key, color: Colors.blue),
                  title: Text("Change Password"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword()),
                    );
                  },
                  // trailing: Text("English",
                  //     style: TextStyle(color: Colors.black54)),
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text("LogOut"),
                  onTap: () {
                    exit(0);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class AccountSettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Account Settings",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Center(
//         child: Text("Account Settings Page", style: TextStyle(fontSize: 18)),
//       ),
//     );
//   }
// }
