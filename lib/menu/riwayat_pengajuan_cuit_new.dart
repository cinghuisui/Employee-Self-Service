import 'package:ess_mobile/menu/surat_cuti.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataList(),
    );
  }
}

class DataList extends StatefulWidget {
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        "https://apimobileess-bfgzc6bsgbc3gcff.southeastasia-01.azurewebsites.net/api/tblPengajuanLeavePermission/"));
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal mengambil data")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("Riwayat Pengajuan Cuti", style: TextStyle(color: Colors.white)),
      //   backgroundColor: Colors.blue,
      // ),
      body: data.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        strokeWidth: 8,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]!),
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    Icon(
                      Icons.hourglass_empty,
                      color: Colors.blue[800],
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text("Loading data..."),
              ],
            ),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        data[index]['namaLengkap'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          "NIKIDCard: ${data[index]['nikidCard']} \nDepartement: ${data[index]['departement']} \nJabatan: ${data[index]['jabatan']} \nTanggal Pengajuan: ${data[index]['cutiPadaTanggal']} \nSampai Tanggal: ${data[index]['sampaiTanggal']} \nMasuk Kerja Tanggal: ${data[index]['masukKerjaTanggal']} \nJumlah Cuti: ${data[index]['jumlahCutiHari']} \nStatus: ${data[index]['status']}"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailPage(data[index]),
                        //   ),
                        // );
                      },
                      isThreeLine: true,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.green),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PengajuanCutiScreen()),
                        );
                        // Aksi ketika tombol "Lihat Form" ditekan
                      },
                      child: const Text(
                        "Lihat Form",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
