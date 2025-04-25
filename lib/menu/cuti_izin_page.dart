import 'package:ess_mobile/menu/pengajuan_cuti.dart';
import 'package:ess_mobile/menu/riwayat_pengajuan_cuit_new.dart';
// import 'package:ess_mobile/menu/riwayat_pengajuan_cuti.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CutiIzin());
}

class CutiIzin extends StatelessWidget {
  const CutiIzin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.lightBlueAccent, // Warna biru saat teks diseleksi
          cursorColor: Colors.blue,              // Warna kursor
          selectionHandleColor: Colors.blue,     // Warna titik seleksi
        ),
      ),
      color: Colors.blue[800],
      debugShowCheckedModeBanner: false,
      home: CutiIzinPage(),
    );
  }
}

class CutiIzinPage extends StatefulWidget {
  const CutiIzinPage({super.key});

  @override
  State<CutiIzinPage> createState() => _CutiIzinPageState();
}

class _CutiIzinPageState extends State<CutiIzinPage> {
    int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Colors.red;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text("Tab Geser Seperti Gambar")),
      body: Column(
        children: [
          SizedBox(height: 40), // Jarak dari atas
          // Toggle Button
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.all(4),
            child: Row(
              children: [
                _buildTabButton("Pengajuan Cuti", 0),
                _buildTabButton("Riwayat Pengajuan Cuti", 1),
              ],
            ),
          ),
          SizedBox(height: 8),
          // Isi berdasarkan tab yang dipilih
          Expanded(
            // child: _selectedIndex == 0 ? PengajuanCuti() : CutiRiwayatPage(),
            child: _selectedIndex == 0 ? PengajuanCuti() : DataList(),
            // child: _selectedIndex == 0 ? _buildAllContent() : _buildUnansweredContent(),
          ),
        ],
      ),
    );
  }

  // Widget untuk Tab Button
  Widget _buildTabButton(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _selectedIndex == index ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }


  Widget cutiCard({
    required String jenisCuti,
    required String tanggalCuti,
    required String sampaiTanggal,
    required String jumlahCuti,
    required String statusApproval,
    required Color statusColor,
    required String keterangan,
  }) 
  {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowText("Jenis Cuti", jenisCuti),
          rowText("Tanggal Cuti", tanggalCuti),
          rowText("Sampai Tanggal", sampaiTanggal),
          rowText("Jumlah Cuti", jumlahCuti),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Status Approval",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                statusApproval,
                style: TextStyle(fontWeight: FontWeight.bold, color: statusColor),
              ),
            ],
          ),
          rowText("Keterangan Cuti", keterangan),
        ],
      ),
    );
  }

  Widget rowText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title :",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}