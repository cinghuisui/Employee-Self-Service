import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileSettings(),
  ));
}

class ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("Profile Saya",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade200,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              SizedBox(height: 20),
              buildTextField("Nama Lengkap", "Rizkillah Rasyid"),
              buildTextField("Fix No", "232455"),
              buildTextField("NIK TK", "BP232345"),
              buildTextField("NoHandphone", "082345674455"),
              buildTextField("NIK TK", "BP232345"),
              buildTextField("Tanggal Kontrak", "12-22-2025"),
              buildTextField("Status Kontrak", "0"),
              buildTextField("Pekerjaan", "Software Developer"),
              buildTextField("Sub Pekerjaan", "0"),
              buildTextField("Jabatan", "Programmer"),
              buildTextField("Level Jabatan", "Level 3"),
              buildTextField("Departemen", "ITD"),
              buildTextField("Divisi", "Industri"),
              buildTextField("Lokasi Kerja", "0"),
              buildTextField("Perusahaan", "Sambu Group"),
              // buildTextField("ID Fingerprint", "124"),
              // buildTextField("Tempat Lahir", "Batam"),
              // buildTextField("Jenis Kelamin", "Male"),
              // buildTextField("Jumlah Anak", "0"),
              // buildTextField("Ibu Kandung", "Andi Rohana"),
              // buildTextField("Jumlah Saudara", "2"),
              // buildTextField("Asal Daerah", "Batam"),
              // buildTextField("Agama", "Islam"),
              // buildTextField("Tingi Badan", "169 Cm"),
              // buildTextField("NoHandphone", "082233158477"),
              // buildTextField("No eKTP/KTP", "0001324998473649877"),
              // buildTextField("No KK", "12488303874"),
              // buildTextField("No BPJS Kes", "2321443554"),
              // buildTextField("Tanggal MCU", "12 Nov 2024"),
              // buildTextField("Pendidikan Terakhir", "S1 Teknik Informatika"),
              // buildTextField("Asal Sekolah/Universitas", "Universitas Putra Batam"),
              // buildTextField("Tahun Masuk", "2024"),
              // buildTextField("Status Kawin", "Belum Kawin"),
              // buildTextField("Status Pajak", "0"),
              // buildTextField("Pekerjaan Orang Tua", "BusinessMan"),
              // buildTextField("Anak Ke", "1"),
              // buildTextField("Suku", "Pure Indonesia"),
              // buildTextField("Hobi", "Coding"),
              // buildTextField("Berat Badan", "70 Kg"),
              // buildTextField("Email", "rizkillahrasyid@gmail.com"),
              // buildTextField("NPWP", "1233 3232 3223"),
              // buildTextField("Bahasa Inggris", "Expert"),
              // buildTextField("Jurusan", "Teknik Informatika"),
              // buildTextField("IPK/Nilai", "3,5"),
              // buildTextField("Tahun Lulus", "2019"),
              // buildTextField("Tanggal Registrasi", "22-11-2023"),
              // buildTextField("Tanggal Bekerja", "23-11-2023"),
              // buildTextField("Pekerjaan", "Sofware Developer"),
              // buildTextField("Sub Pekerjaan", "0"),
              // buildTextField("Jabatan", "Programmer"),
              // buildTextField("Level Jabatan", "Level 3"),
              // buildTextField("Shift", "NonShift"),
              // buildTextField("Line", "Nothing Line"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextField(
            cursorColor: Colors.blue[800], // Kursor merah
            readOnly: true,
            controller: TextEditingController(text: value),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}