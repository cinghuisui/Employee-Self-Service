// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor:
              Colors.lightBlueAccent, // Warna biru saat teks diseleksi
          cursorColor: Colors.blue, // Warna kursor
          selectionHandleColor: Colors.blue, // Warna titik seleksi
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const PengajuanCuti(),
    );
  }
}

class PengajuanCuti extends StatefulWidget {
  const PengajuanCuti({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PengajuanCutiState createState() => _PengajuanCutiState();
}

class _PengajuanCutiState extends State<PengajuanCuti> {
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _keterangancutiController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final void Function() startQuiz;

  DateTime? _startDate;
  DateTime? _endDate;
  DateTime? _masukKerjaDate;
  DateTime? returnDate;
  int _jumlahHariCuti = 0;
  String? _selectedHariLibur;
  String? selectedDepartement;
  String? selectedJabatan;
  String? selectedJenisCuti;
  String? _errorNamaLengkap;
  String? _errorNik;
  String? _errorKeteranganCuti;
  String? selectedDay;
  String? selectedLeaveType;
  bool isFocused = false;

  void _clearFields() {
    // Menghapus teks di semua TextEditingController
    _namaLengkapController.clear();
    _nikController.clear();
    _keterangancutiController.clear();
    _hariLiburOptions.clear();
    departement.clear();
    jabatan.clear();
    jenisCutiList.clear();
    _jumlahHariCuti = 0;
    // Mengatur ulang errorText menjadi null
    setState(() {
      _errorNamaLengkap = null;
      // _errorNik = null;
      _errorKeteranganCuti = null;
      _selectedHariLibur = null;
      _startDate = null;
      _endDate = null;
      _masukKerjaDate = null;
      // _errorDept = null;
    });
  }

  // void _showDayPicker(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (context) {
  //       return Container(
  //         height: MediaQuery.of(context).size.height * 0.5, // 50% layar
  //         decoration: BoxDecoration(
  //           color: Colors.blue, // Warna background seperti gambar
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //         ),
  //         child: ListView.builder(
  //           itemCount: days.length,
  //           itemBuilder: (context, index) {
  //             return ListTile(
  //               title: Text(
  //                 days[index],
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
  //               ),
  //               onTap: () {
  //                 setState(() {
  //                   selectedDay = days[index];
  //                 });
  //                 Navigator.pop(context);
  //               },
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  List<String> leaveTypes = [
    "Cuti tahunan",
    "Cuti Membastis Anak",
    "Cuti Menikah",
    "Cuti Menghitankan Anak",
    "Cuti Pernikahan Anak",
    "Cuti Ibadah Haji",
    "Cuti Istri Melahirkan/Keguguran",
    "Cuti Menikah",
    "Cuti Menghitankan Anak",
    "Cuti Pernikahan Anak",
    "Cuti Ibadah Haji",
    "Cuti Istri Melahirkan/Keguguran",
  ];

  final List<String> days = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu",
  ];

  final _dateFormat = DateFormat('dd-MM-yyyy');
  final List<String> _hariLiburOptions = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
    // 'Hari Libur Nasional',
  ];
  final List<String> departement = [
    "MPD",
    "Turbin",
    "Quality",
    "PSN",
    "ITD",
    "Security"
  ];
  final List<String> jabatan = [
    "Operator",
    "Supervisor",
    "Manager",
    "Kepalas Sift",
    "ADM"
  ];
  final List<String> jenisCutiList = [
    "Cuti Tahunan",
    "Cuti Ibadah Haji",
    "Cuti Menikah",
    "Cuti Pernikahan Anak",
    "Cuti Mengkhitankan Anak",
    "Cuti Membaptiskan Anak",
    "Cuti Istri Melahirkan/Keguguran"
    // "Cuti Suami/Istri, Orangtua/Mertua, Anak/Menantu Meninggal",
    // "Anggota Keluarga Dalam Satu Rumah Meninggal"
  ];
  // Daftar hari libur nasional (contoh)
  final List<DateTime> _hariLiburNasional = [
    DateTime(2024, 1, 1), // Tahun Baru
    DateTime(2024, 5, 1), // Hari Buruh
    DateTime(2024, 8, 17), // Hari Kemerdekaan
    DateTime(2024, 12, 25), //Hari Natal
  ];

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
            content: Text(
              'Pengajuan Cuti berhasil diajukan!',
            )),
      );
      _clearFields();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
          content: Text('Mohon di isi semua data dengan benar!'),
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // Warna utama
              onPrimary: Colors.white, // Warna teks di atas warna utama
              onSurface: Colors.black, // Warna teks lainnya
            ),
          ),
          child: child!,
        );
      },
      selectableDayPredicate: (DateTime date) {
        // Nonaktifkan hari libur nasional pada kalender
        return !_hariLiburNasional.contains(date);
      },
    );

    if (picked != null) {
      setState(
        () {
          if (isStartDate) {
            _startDate = picked;
          } else {
            _endDate = picked;
            _calculateMasukKerjaDate();
          }
          _calculateDays();
        },
      );
    }
  }

  void _calculateDays() {
    if (_startDate != null && _endDate != null) {
      int totalDays = _endDate!.difference(_startDate!).inDays + 1;
      int liburCount = 0;

      for (int i = 0; i < totalDays; i++) {
        DateTime currentDate = _startDate!.add(Duration(days: i));
        if (_isLibur(currentDate)) {
          liburCount++;
        }
      }

      setState(() {
        _jumlahHariCuti = totalDays - liburCount;
        if (_jumlahHariCuti < 0) _jumlahHariCuti = 0;
      });
    }
  }

  void _calculateMasukKerjaDate() {
    if (_endDate != null) {
      DateTime tempDate = _endDate!.add(const Duration(days: 1));
      while (_isLibur(tempDate)) {
        tempDate = tempDate.add(const Duration(days: 1));
      }
      setState(() {
        _masukKerjaDate = tempDate;
      });
    }
  }

  void _showLeaveTypes() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.blue[800],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: leaveTypes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  leaveTypes[index],
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    selectedLeaveType = leaveTypes[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  bool _isLibur(DateTime date) {
    if (_selectedHariLibur == 'Senin' && date.weekday == DateTime.monday) {
      return true;
    } else if (_selectedHariLibur == 'Selasa' &&
        date.weekday == DateTime.tuesday) {
      return true;
    } else if (_selectedHariLibur == 'Rabu' &&
        date.weekday == DateTime.wednesday) {
      return true;
    } else if (_selectedHariLibur == 'Kamis' &&
        date.weekday == DateTime.thursday) {
      return true;
    } else if (_selectedHariLibur == 'Jumat' &&
        date.weekday == DateTime.friday) {
      return true;
    } else if (_selectedHariLibur == 'Sabtu' &&
        date.weekday == DateTime.saturday) {
      return true;
    } else if (_selectedHariLibur == 'Minggu' &&
        date.weekday == DateTime.sunday) {
      return true;
    } else if (_selectedHariLibur == 't') {
      return _hariLiburNasional.contains(date);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: Colors.blue[800],
      // backgroundColor: Colors.amber,
      // appBar: AppBar(
      //   // elevation: 5,
      //   title: const Text(
      //     "Pengajuan Cuti",
      //     style: TextStyle(
      //       color: Colors.white, // Ubah warna teks menjadi biru
      //       fontSize: 20, // Ukuran teks
      //     ),
      //   ),
      //   backgroundColor: Colors.blue[800],
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.chevron_left_rounded, size: 35,
      //       // Icons.arrow_back,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),

      body: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Informasi Cuti
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                    "Informasi Cuti",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    // style: TextStyle(
                    //   fontWeight: FontWeight.bold,
                    //   fontSize: 16,
                    // ),
                  ),
                ),
                // const SizedBox(height: 16),
                const SizedBox(height: 8),
                // Card Informasi
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoCard(
                        title: "SISA CUTI",
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "12",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Text(
                  "Nama Lengkap",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _namaLengkapController,
                  cursorColor: Colors.blue[800],
                  decoration: InputDecoration(
                    hintText: "Nama Lengkap",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorText: _errorNamaLengkap,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIK/ID Card harus diisi';
                    }
                    return null;
                  },
                  inputFormatters: [
                    UpperCaseTextFormatter(), // Formatter untuk huruf besar
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "NIK / ID Card",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nikController,
                  decoration: InputDecoration(
                    hintText: "NIK/ID Card",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorText: _errorNik,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIK/ID Card harus diisi';
                    }
                    return null;
                  },
                  inputFormatters: [
                    UpperCaseTextFormatter(), // Formatter untuk huruf besar
                  ],
                ),

                const SizedBox(height: 16),
                const Text(
                  "Departemen/Bagian",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    // labelText: 'Departemen/Bagian',
                    hintText: '-Pilih Departemen-',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'it',
                      child: Text('IT'),
                    ),
                    DropdownMenuItem(
                      value: 'hr',
                      child: Text('HR'),
                    ),
                    // Tambahkan item lainnya sesuai kebutuhan
                  ],
                  onChanged: (value) {
                    // Handle perubahan
                  },
                ),
                // DropdownButtonFormField<String>(
                //   hint: const Text("-Pilih Departement-"),
                //   value: selectedDepartement,
                //   items: departement.map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   onChanged: (newValue) {
                //     setState(() {});
                //   },
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Departement harus diisi';
                //     }
                //     return null;
                //   },
                // ),

                const SizedBox(height: 16),
                const Text(
                  "Jabatan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  hint: const Text("-Pilih Jabatan-"),
                  value: selectedJabatan,
                  items: jabatan.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedJabatan = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(8.0),
                    // ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jabatan harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Dropdown Hari Libur
                const Text('Hari Libur/IM',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: '-Pilih Hari-',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.red),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // border: OutlineInputBorder(),
                  ),
                  value: _selectedHariLibur,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedHariLibur = newValue;
                      _calculateDays();
                      _calculateMasukKerjaDate();
                    });
                  },
                  items: _hariLiburOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Hari Libur harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Jenis Cuti",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  hint: const Text("-Pilih Jenis Cuti-"),
                  value: selectedJenisCuti,
                  items: jenisCutiList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedJenisCuti = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.red),
                    //   borderRadius: BorderRadius.circular(8.0),
                    // ),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(8.0),
                    // ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jenis Cuit harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Jenis Cuti',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: _showLeaveTypes,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                  //     border: Border.all(
                  //   color: isFocused ? Colors.blue : Colors.black54,width: 2,
                  // ),
                      border: Border.all(color: isFocused ? Colors.blue[800]! : Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedLeaveType ?? "-Pilih Cuti-",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: (16),
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.black54,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Cuti Pada Tanggal
                const Text('Cuti Pada Tanggal',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => _selectDate(context, true),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: _startDate == null
                            ? '-Pilih Tanggal-'
                            : _dateFormat.format(_startDate!),
                        suffixIcon: const Icon(
                          Icons.calendar_today,
                          color: Colors.blueAccent,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (_startDate == null || _startDate!.isUtc) {
                          return 'Tanggal harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Sampai Tanggal
                const Text('Sampai Tanggal',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => _selectDate(context, false),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: _endDate == null
                            ? '-Pilih Tanggal-'
                            : _dateFormat.format(_endDate!),
                        suffixIcon: const Icon(
                          Icons.calendar_today,
                          color: Colors.blueAccent,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (_endDate == null || _endDate!.isUtc) {
                          return 'Tanggal harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Jumlah Cuti
                const Text('Jumlah Cuti (Hari)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 8),
                TextField(
                  enabled: false,
                  // controller: _jumlahCuti,
                  decoration: InputDecoration(
                    hintText: _jumlahHariCuti == 0
                        ? 'Jumlah Cuti Hari'
                        : '$_jumlahHariCuti Hari',
                    border: const OutlineInputBorder(),
                    // errorText: _errorJumlahCuti
                  ),
                ),
                const SizedBox(height: 16),
                // Masuk Kerja Tanggal
                const Text('Masuk Kerja Tanggal',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: _masukKerjaDate == null
                        ? '-Pilih Tanggal-'
                        : _dateFormat.format(_masukKerjaDate!),
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                // const SizedBox(height: 16),

                // Text(
                //   "Hari Libur/IM",
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: 8),
                // GestureDetector(
                //   onTap: () => _showDayPicker(context),
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.black54),
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text(
                //           selectedDay ?? "-Pilih Hari-",
                //           style: TextStyle(fontSize: 16, color: Colors.black54),
                //         ),
                //         Icon(Icons.arrow_drop_down),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 16,
                ),

                const Text(
                  "Keterangan Cuti",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                TextFormField(
                  maxLines: 4,
                  controller: _keterangancutiController,
                  decoration: InputDecoration(
                    hintText: "Keterangan Cuti",
                    hintStyle: TextStyle(
                        color: returnDate != null ? Colors.black : Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorText: _errorKeteranganCuti,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[800]!, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Keterangan Cuti harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                const Text(
                  'Lampiran Wajib:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                AttachmentCard(
                  title: 'Photo Copy Buku Nikah/KK - Menikah(3. Hk)',
                ),
                const SizedBox(height: 10),
                AttachmentCard(
                  title: 'Photo copy Buku Nikah/KK-ANAK KANDUNG MENIKAH',
                ),
                const SizedBox(height: 10),
                AttachmentCard(
                  title:
                      'Surat Kematian/KK (Orang tua/Mertua/Istri/Suami/Menantu/Anak)',
                ),
                const SizedBox(height: 10),
                AttachmentCard(
                  title: 'Surat Khitan Anak / Babtis',
                ),
                const SizedBox(height: 10),
                AttachmentCard(
                  title:
                      'Surat Kelahiran Anak/Photo copy Buku Nikah - ISTRI MELAHIRKAN"',
                ),

                const SizedBox(height: 24),
                // SizedBox(
                //   // width: double.maxFinite,
                //   child: ElevatedButton(
                //     onPressed: _submitForm,
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.blue[800], // Warna latar belakang tombol
                //       foregroundColor: Colors.white, // Warna teks atau ikon
                //       shadowColor: Colors.black, // Warna bayangan
                //       elevation: 5, // Tinggi bayangan
                //     ),
                //     child: const Text('Ajukan'),
                //   ),
                // ),
                OutlinedButton.icon(
                  onPressed: _submitForm,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue[800],
                    shadowColor: const Color.fromARGB(55, 66, 164, 245),
                    elevation: 5,
                  ),

                  // shadowColor.Colors.blackm
                  icon: const Icon(Icons.check_box),
                  label: const Text("Ajukan",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                  // child: const Text('Start Quiz'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Mengonversi semua teks menjadi huruf besar
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class AttachmentCard extends StatefulWidget {
  final String title;

  AttachmentCard({required this.title});

  @override
  _AttachmentCardState createState() => _AttachmentCardState();
}

class _AttachmentCardState extends State<AttachmentCard> {
  final ImagePicker _picker = ImagePicker();
  final List<File> _images = [];

  // Future<void> _pickImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.camera);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _images.add(File(pickedFile.path));
  //     });
  //   }
  // }
  List<String> myList = []; // List kosong

// void main() {
//   if (myList.isNotEmpty) {
//     print(myList[0]);
//   } else {
//     print('List kosong, tidak ada elemen untuk diakses.');
//   }
// }

  Future<void> _removeImage(int index) async {
    setState(() {
      _images.removeAt(index);
    });
  }

  void _viewImage(File image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImage(image: image),
      ),
    );
  }

  bool _isPickingImage = false;

  Future<void> _pickImage() async {
    if (_isPickingImage) return; // Prevent multiple taps
    setState(() {
      _isPickingImage = true;
    });

    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _isPickingImage = false; // Re-enable the button
    });

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _pickImagee() async {
    if (_isPickingImage) return; // Prevent multiple taps
    setState(() {
      _isPickingImage = true;
    });

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _isPickingImage = false; // Re-enable the button
    });

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with dynamic height
          Container(
            constraints: const BoxConstraints(maxHeight: 40),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              overflow: TextOverflow.visible,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.black),
            onPressed: _pickImage,
          ),
          IconButton(
            icon: const Icon(Icons.photo, color: Colors.black),
            onPressed: _pickImagee,
          ),
          const SizedBox(height: 10),
          Row(
            children: _images.asMap().entries.map((entry) {
              int index = entry.key;
              File image = entry.value;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                      child: GestureDetector(
                        onTap: () => _viewImage(image),
                        child: Image.file(
                          image,
                          width: 93,
                          height: 93,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _removeImage(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(
                                0.5), // Transparent black background
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final File image;

  const FullScreenImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        title: const Text(
          'Lihat Gambar',
          style: TextStyle(
            color: Colors.white, // Ubah warna teks menjadi biru
            fontSize: 20, // Ukuran teks
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded,
              size: 35,
              color: Colors.white), // Mengubah warna ikon back menjadi putih
          onPressed: () {
            // Aksi saat ikon back ditekan
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Center(
          child: Image.file(image),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final Widget content;

  const InfoCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 80,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Center(child: content),
          ),
        ],
      ),
    );
  }
}
