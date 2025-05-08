import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});
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
      title: 'GET API to Form',
      home: PersonalInfo2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PersonalInfo2 extends StatefulWidget {
  const PersonalInfo2({super.key});

  @override
  State<PersonalInfo2> createState() => _PersonalInfo2State();
}

class _PersonalInfo2State extends State<PersonalInfo2> {
  final TextEditingController fixNoController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nikidCardController = TextEditingController();
  final TextEditingController departementController = TextEditingController();
  final TextEditingController jabatanController = TextEditingController();
  final TextEditingController hariLiburIMController = TextEditingController();
  final TextEditingController jeniscutiController = TextEditingController();
  final TextEditingController cutiPadaTanggalController = TextEditingController();
  final TextEditingController sampaiTanggalController = TextEditingController();
  final TextEditingController jumlahCutiHariController = TextEditingController();
  final TextEditingController masukKerjaTanggalController = TextEditingController();
  final TextEditingController keteranganCutiController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  bool _isLoading = false;

  Future<void> _fetchData() async {
    setState(() => _isLoading = true);

    final url = Uri.parse('https://apimobileess-bfgzc6bsgbc3gcff.southeastasia-01.azurewebsites.net/api/tblPengajuanLeavePermission/18/'); // Ganti dengan API kamu
    // final url = Uri.parse('https://adm-rsup.azurewebsites.net/admMobile/getEmpInfo?Msg=MjU3MA==');
    // final url = Uri.parse('https://adm-rsup.azurewebsites.net/admMobile/getEmpInfo?Msg=MjU3MA==/'); // Ganti dengan API kamu
    
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = data['data'];

        setState(() {
          // _nameController.text = '${user['first_name']} ${user['last_name']}';
          // _emailController.text = user['email'];

          // kimakController.text = data['namaLengkap'];
          // // data[index]['namaLengkap'],
          // kontolController.text = data['nikidCard'];
            // _buildTextField("FixNo", _employeeData!['FixNo'].toString()),
          fixNoController.text = data['fixNo'].toString();
          namaController.text = data['namaLengkap'];
          nikidCardController.text = data['nikidCard'];
          departementController.text = data['departement'];
          jabatanController.text = data['jabatan'];
          hariLiburIMController.text = data['hariLiburIM'];
          jeniscutiController.text = data['jenisCuti'];
          cutiPadaTanggalController.text = data['cutiPadaTanggal'];
          sampaiTanggalController.text = data['sampaiTanggal'];
          jumlahCutiHariController.text = data['jumlahCutiHari'];
          masukKerjaTanggalController.text = data['masukKerjaTanggal'];
          keteranganCutiController.text = data['keteranganCuti'];
          statusController.text = data['status'];

          // _nameController.text = user['namalengkap'];
          // _emailController.text = user['departement'];
          _isLoading = false;
        });
      } else {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengambil data')),
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData(); // Ambil data saat pertama kali halaman dimuat
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text("GET Data ke TextFormField")),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("Profile Saya",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: _isLoading
              ? Center(child: CircularProgressIndicator(strokeWidth: 8,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]!),
                        backgroundColor: Colors.black26, ))
                        
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  const Text(
                    "FixNo",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: fixNoController,
                    cursorColor: Colors.blue[800],
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "FixNo",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),  
                  const Text(
                    "Nama",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: namaController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "N a m a",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: nikidCardController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "E m a i l",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Departement",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: departementController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "Departement",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Jabatan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: jabatanController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "Jabatan",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Hari Libur IM",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: hariLiburIMController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "Hari Libur IM",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Jenis Cuti",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: jeniscutiController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "Jenis Cuti",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Cuti Pada Tanggal",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: cutiPadaTanggalController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "Cuti Pada Tanggal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Sampai Tanggal",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: sampaiTanggalController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "Sampai Tanggal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Jumlah Cuti Hari",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: jumlahCutiHariController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "Jumlah Cuti Hari",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Masuk Kerja Tanggal",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: masukKerjaTanggalController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "Masuk Kerja Tanggal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Keterangan Cuti",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: keteranganCutiController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "Keterangan Cuti",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Status",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: statusController,
                    // keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                      hintText: "Status",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // 
                    // TextFormField(
                    //   controller: _nameController,
                    //   decoration: InputDecoration(labelText: 'Nama'),
                    // ),
                    // SizedBox(height: 10),
                    // TextFormField(
                    //   controller: _emailController,
                    //   decoration: InputDecoration(labelText: 'Email'),
                    // ),
                  ],
                ),
        ),
      ),
    );
  }
}