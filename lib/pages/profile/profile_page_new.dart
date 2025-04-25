import 'package:ess_mobile/pages/profile/change_password.dart';
import 'package:ess_mobile/pages/profile/profile_settings.dart';
import 'package:ess_mobile/styles/text_style.dart';
// import 'package:ess_mobile/themes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(ProfileNew());
}

class ProfileNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

 void _showImagePicker() {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              // tileColor: Colors.white,
              leading: Icon(Icons.camera_alt),
              title: Text("Ambil Foto"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Pilih dari Galeri"),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    },
  );
}

void _showFullImage() {
    if (_image == null) return;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(_image!, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Profile",
            style: kSubtitle2.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: _showFullImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.person, size: 50, color: Colors.white)
                        : null,
                  ),
                ),
                // CircleAvatar(
                //   radius: 50,
                //   backgroundColor: Colors.grey[300],
                //   backgroundImage: _image != null ? FileImage(_image!) : null,
                //   child: _image == null
                //       ? Icon(Icons.person, size: 50, color: Colors.white)
                //       : null,
                // ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _showImagePicker,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blue[800],
                      child:
                          Icon(Icons.camera_alt, color: Colors.white, size: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Susanto",
            style: kSubtitle2.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Operator",
            style: kSubtitle2.copyWith(
              color: Colors.grey,
              // fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            // style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                // ListTile(
                //   leading: Icon(Icons.notifications, color: Colors.blue),
                //   title: Text("Notification Settings",style: kSubtitle2.copyWith(
                //       color: Colors.black,
                //       // fontWeight: FontWeight.bold,
                //       fontSize: 15,
                //     ),),
                //   trailing: Text("On", style: kSubtitle2.copyWith(
                //       color: Colors.black54,
                //       // fontWeight: FontWeight.bold,
                //       fontSize: 15,
                //     ),),
                // ),
                // ListTile(
                //   leading: Icon(Icons.calendar_today, color: Colors.blue),
                //   title: Text(
                //     "Calender Settings",
                //     style: kSubtitle2.copyWith(
                //       color: Colors.black,
                //       // fontWeight: FontWeight.bold,
                //       fontSize: 15,
                //     ),
                //   ),
                //   trailing: Text("On", style: kSubtitle2.copyWith(
                //       color: Colors.black54,
                //       // fontWeight: FontWeight.bold,
                //       fontSize: 15,
                //     ),),
                // ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text("Personal Info",style: kSubtitle2.copyWith(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileSettings()),
                    );
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.key, color: Colors.blue),
                //   title: Text("Change Password",style: kSubtitle2.copyWith(
                //       color: Colors.black,
                //       // fontWeight: FontWeight.bold,
                //       fontSize: 15,
                //     ),),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => ChangePassword()),
                //     );
                //   },
                //   // trailing: Text("English",
                //   //     style: TextStyle(color: Colors.black54)),
                // ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text("LogOut",style: kSubtitle2.copyWith(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                  onTap: () {
                    exit(0);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey,
      //   currentIndex: 2, // Profile aktif
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "NOTIFICATION"),
      //     BottomNavigationBarItem(icon: Icon(Icons.lock), label: "KUNCI"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "PROFILE"),
      //   ],
      // ),
    );
  }

  // Widget _buildProfileOption(IconData icon, String title, {Color color = Colors.blue}) {
  //   return ListTile(
  //     leading: Icon(icon, color: color),
  //     title: Text(title),
  //     trailing: title.contains("Settings") ? Text("On", style: TextStyle(color: Colors.grey)) : null,
  //     onTap: () {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$title clicked")));
  //     },
  //   );
  // }
}
