import 'package:ess_mobile/login/login_page.dart';
import 'package:ess_mobile/login/login_page_new.dart';
// import 'package:ess_mobile/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasAcceptedPolicy = prefs.getBool('hasAcceptedPolicy') ?? false;
  runApp(KebijakanApk(hasAcceptedPolicy: hasAcceptedPolicy));
}

class KebijakanApk extends StatelessWidget {
  final bool hasAcceptedPolicy;
  const KebijakanApk({super.key, required this.hasAcceptedPolicy});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hasAcceptedPolicy ? LoginPage() : PolicyAgreementScreen(),
    );
  }
}

class PolicyAgreementScreen extends StatefulWidget {
  @override
  _PolicyAgreementScreenState createState() => _PolicyAgreementScreenState();
}

class _PolicyAgreementScreenState extends State<PolicyAgreementScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isChecked = false;
  bool _hasScrolledToEnd = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _hasScrolledToEnd = true;
        });
      }
    });
  }

  Future<void> _acceptPolicy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasAcceptedPolicy', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Center(
          child: Text(
            "Privacy & Policy",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "Selamat datang di Aplikasi Mandiri Tenaga Kerja atau Platform pengelolaan yang berkaitan dengan pengelolaan Administrasi dalam konteks pengelolaan Sumber Daya Manusia dan mengetahui informasi diri tenaga kerja di PT Askar Daksa Mandala yang selanjutnya disebut (“Perusahaan” atau “kami”).  Berikut ini adalah Syarat dan Ketentuan yang mengatur penggunaan Platform ini (selanjutnya disebut dengan “Ketentuan”). Dengan mengunduh, mengakses dan/atau menggunakan Platform, Anda setuju bahwa Anda telah membaca, memahami, mengetahui, menyetujui, dan menerima seluruh informasi, syarat, dan ketentuan penggunaan layanan yang terdapat dalam Ketentuan ini. Ketentuan ini merupakan perjanjian yang sah antara Kami dan Anda terkait tata cara dan persyaratan penggunaan Platform ini. \n\n"),
                          TextSpan(
                            text: "Kebijakan Privasi \n\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "Adanya Kebijakan Privasi ini adalah komitmen dari Perusahaan untuk menghargai dan melindungi setiap data atau informasi pribadi Pengguna Platform "),
                          TextSpan(
                            text: "(domain website), ",
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ), 
                          TextSpan(
                              text:
                                  "(Platform-Platform turunannya, serta Aplikasi Mandiri Tenaga Kerja (selanjutnya disebut sebagai ('Platform'). Kebijakan Privasi ini (beserta syarat-syarat penggunaan dari Platform Aplikasi Mandiri Tenaga Kerja sebagaimana tercantum dalam Syarat & Ketentuan dan informasi lain yang tercantum di Platform) menetapkan dasar atas perolehan, pengumpulan, pengolahan, penganalisisan, penampilan, pengiriman, pembukaan, penyimpanan, perubahan, penghapusan dan/atau segala bentuk pengelolaan yang terkait dengan data atau informasi yang mengidentifikasikan atau dapat digunakan untuk mengidentifikasi Pengguna yang Pengguna berikan kepada Perusahaan atau yang Perusahaan kumpulkan dari Pengguna maupun pihak lainnya (selanjutnya disebut sebagai 'Data Pribadi'). Dengan mengklik “Login” (masuk) atau pernyataan serupa yang tersedia di laman login Platform, Pengguna menyatakan bahwa setiap Data Pribadi Pengguna merupakan data yang benar dan sah, Pengguna mengakui bahwa ia telah diberitahukan dan memahami ketentuan Kebijakan Privasi ini serta Pengguna memberikan persetujuan kepada Perusahaan untuk memperoleh, mengumpulkan, mengolah, menganalisis, menampilkan, mengirimkan, membuka, menyimpan, mengubah, menghapus, mengelola dan/atau mempergunakan data tersebut untuk tujuan sebagaimana tercantum dalam Kebijakan Privasi. \n\n"),                                 
                          TextSpan(
                            text:
                                "A.	Perolehan dan Pengumpulan Data Pribadi Pengguna \n\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "Perusahaan mengumpulkan Data Pribadi Pengguna dengan tujuan untuk memproses transaksi Pengguna, mengelola dan memperlancar proses penggunaan Platform, serta tujuan-tujuan lainnya selama diizinkan oleh peraturan perundang-undangan yang berlaku. Adapun data Pengguna yang dikumpulkan adalah sebagai berikut:\n\n"
                                  "Data yang diserahkan secara mandiri oleh Pengguna, termasuk namun tidak terbatas pada data yang diserahkan pada saat Pengguna: \n\n"
                                  "1.	Membuat atau memperbarui akun Aplikasi Mandiri Tenaga Kerja, termasuk diantaranya nama pengguna (username), alamat email, nomor telepon, password, alamat, foto, dan informasi lainnya yang dapat mengidentifikasi Pengguna \n\n"
                                  "2.	Kami dapat mengumpulkan informasi pribadi yang relevan untuk keperluan pengelolaan karyawan dan administrasi perusahaan. Informasi pribadi yang kami kumpulkan mungkin meliputi, namun tidak terbatas pada, nama, alamat, tanggal lahir, nomor identifikasi karyawan, informasi kontak, informasi kontak darurat, riwayat pekerjaan, informasi nomor rekening Bank, kualifikasi dan riwayat pendidikan, Nomor BPJS dan Nomor Pokok Wajib Pajak (NPWP), serta informasi perangkat ponsel seperti merek ponsel, type ponsel, versi ponsel, dan nomor token untuk keperluan notifikasi. \n\n"
                                  "3.	Data yang terekam pada saat Pengguna mempergunakan Platform, termasuk namun tidak terbatas pada (data lokasi riil atau perkiraannya seperti alamat IP, lokasi Wi-Fi dan geo-location, data berupa waktu dari setiap aktivitas Pengguna sehubungan dengan penggunaan Platform, termasuk waktu pendaftaran, login dan transaksi)\n\n"
                                  "4.	Data penggunaan atau preferensi Pengguna, diantaranya interaksi Pengguna dalam menggunakan Platform, pilihan yang disimpan, serta pengaturan yang dipilih. Data tersebut diperoleh menggunakan cookies, pixel tags, dan teknologi serupa yang menciptakan dan mempertahankan pengenal unik;\n\n"
                                  "5.	Data perangkat, diantaranya jenis perangkat yang digunakan untuk mengakses Platform, termasuk model perangkat keras, sistem operasi dan versinya, perangkat lunak, nama file dan versinya, pilihan bahasa, pengenal perangkat unik, pengenal iklan, informasi gerakan perangkat, dan/atau informasi jaringan seluler\n\n"
                                  "6.	Data catatan (log), diantaranya catatan pada server yang menerima data seperti alamat IP perangkat, tanggal dan waktu akses, fitur aplikasi atau laman yang dilihat, proses kerja aplikasi dan aktivitas sistem lainnya, browser, dan/atau Platform atau layanan pihak ketiga yang Pengguna gunakan sebelum berinteraksi dengan Platform.\n\n"
                                  "7.	Data yang diperoleh dari sumber lain, termasuk namun tidak terbatas pada (data berupa e-mail, nomor telepon, nama, gender, dan/atau tanggal lahir dari Pengguna membuat atau mengakses akun Aplikasi Mandiri Tenaga Kerja, seperti layanan media sosial, atau Platform/aplikasi yang menggunakan application programming interface (API) yang digunakan Aplikasi Mandiri Tenaga Kerja)\n\n"),
                          TextSpan(
                            text: "B.	Penggunaan Data Pribadi \n\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "Aplikasi Mandiri Tenaga Kerja dapat menggunakan Data Pribadi yang diperoleh dan dikumpulkan dari Pengguna sebagaimana disebutkan dalam bagian sebelumnya untuk hal-hal sebagai berikut:\n\n"
                                  "1.	Memproses segala bentuk permintaan, aktivitas maupun transaksi yang dilakukan oleh Pengguna melalui Platform, termasuk untuk keperluan pengiriman data kepada Pengguna. \n\n"
                                  "2.	Penyediaan fitur-fitur untuk memberikan, mewujudkan, memelihara dan memperbaiki produk dan layanan kami, termasuk: melakukan kegiatan internal yang diperlukan untuk menyediakan layanan pada Platform Aplikasi Mandiri Tenaga Kerja, seperti pemecahan masalah software, bug, permasalahan operasional, melakukan analisis data, pengujian, dan penelitian, dan untuk memantau dan menganalisis kecenderungan penggunaan dan aktivitas. \n\n"
                                  "3.	Memeriksa dan mengatasi permasalahan Pengguna dalam lingkup informasi dan data ketenagakerjaan \n\n"
                                  "4.	Mengarahkan pertanyaan Pengguna kepada petugas layanan pelanggan yang tepat untuk mengatasi permasalahan dalam lingkup informasi dan data ketenagakerjaan\n\n"),
                          TextSpan(
                            text: "C.	Pengungkapan Data Pribadi Pengguna \n\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "Aplikasi Mandiri Tenaga Kerja berkomitmen untuk menjaga kerahasiaan Data Pribadi Pengguna yang berada di bawah kendali Aplikasi Mandiri Tenaga Kerja dan menjamin tidak ada pengungkapan, penjualan, pengalihan, distribusi dan/atau peminjaman Data Pribadi Pengguna kepada pihak ketiga lain tanpa persetujuan dari Pengguna, kecuali dalam hal-hal sebagai berikut: \n\n"
                                  "1.	Pengguna menghubungi Aplikasi Mandiri Tenaga Kerja melalui media publik seperti media sosial, dan fitur tertentu pada Platform, yang mana komunikasi antara Pengguna dan Aplikasi Mandiri Tenaga Kerja tersebut dapat dilihat dan diketahui oleh khalayak ramai. \n\n"
                                  "2.	Aplikasi Mandiri Tenaga Kerja dapat membagikan Data Pribadi Pengguna kepada Perusahaan dan afiliasinya yang menggunakan jasa kami untuk membantu memberikan layanan atau melakukan pengolahan data untuk dan atas nama Aplikasi Mandiri Tenaga Kerja. \n\n"
                                  "3.	Aplikasi Mandiri Tenaga Kerja mengungkapkan Data Pribadi Pengguna dalam upaya mematuhi kewajiban hukum dan/atau adanya permintaan yang sah dari aparat penegak hukum atau instansi penyelenggara negara yang berwenang. \n\n"
                                  "Sehubungan dengan pengungkapan Data Pribadi Pengguna sebagaimana dijelaskan di atas, Aplikasi Mandiri Tenaga Kerja akan/mungkin perlu mengungkapkan Data Pribadi Pengguna kepada penyedia layanan pihak ketiga dan/atau afiliasi atau perusahaan terkait Aplikasi Mandiri Tenaga Kerja, dan/atau pihak ketiga lainnya. Meskipun demikian, penyedia layanan pihak ketiga dan/atau afiliasi atau perusahaan terkait dan/atau pihak ketiga lainnya tersebut hanya akan mengelola dan/atau memanfaatkan Data Pribadi Pengguna sehubungan dengan satu atau lebih tujuan sebagaimana diatur dalam Kebijakan Privasi ini dan sesuai dengan ketentuan peraturan perundangan-undangan yang berlaku.\n\n"),
                          TextSpan(
                            text: "D.	Cookies \n\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "Cookies adalah file kecil yang secara otomatis akan mengambil tempat di dalam perangkat Pengguna yang menjalankan fungsi dalam menyimpan preferensi maupun konfigurasi Pengguna selama mengunjungi suatu Platform. Cookies tersebut tidak diperuntukkan untuk digunakan pada saat melakukan akses data lain yang Pengguna miliki di perangkat komputer Pengguna, selain dari yang telah Pengguna setujui untuk disampaikan. Walaupun secara otomatis perangkat komputer Pengguna akan menerima cookies, Pengguna dapat menentukan pilihan untuk melakukan modifikasi melalui pengaturan browser Pengguna yaitu dengan memilih untuk menolak cookies (pilihan ini dapat menghambat tersedianya layanan Aplikasi Mandiri Tenaga Kerja secara optimal pada saat Pengguna mengakses Platform).\n\n"),
                          TextSpan(
                            text: "E.	Pilihan Pengguna dan Transparansi \n\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "Perangkat seluler pada umumnya (iOS dan Android) memiliki pengaturan sehingga aplikasi Aplikasi Mandiri Tenaga Kerja tidak dapat mengakses data tertentu tanpa persetujuan dari Pengguna. Perangkat Android akan memberikan pemberitahuan kepada Pengguna saat aplikasi Aplikasi Mandiri Tenaga Kerja pertama kali dimuat. Dengan menggunakan aplikasi dan memberikan akses terhadap aplikasi, Pengguna dianggap memberikan persetujuannya terhadap pengumpulan dan penggunaan Data Pribadi Pengguna dalam perangkatnya.Pengguna dapat mengakses dan mengubah informasi berupa alamat email, nomor telepon, tanggal lahir, jenis kelamin, daftar alamat, dan lain-lain melalui fitur pengaturan (settings) pada Platform. Pengguna dapat menarik diri (opt-out) dari informasi atau notifikasi dari Admin yang dikirimkan oleh Aplikasi Mandiri Tenaga Kerja melalui fitur pengaturan pada Platform. Aplikasi Mandiri Tenaga Kerja tetap dapat mengirimkan pesan atau email berupa keterangan transaksi atau informasi terkait akun Pengguna. Sepanjang tidak bertentangan dengan ketentuan peraturan perundang-undangan yang berlaku, Pengguna dapat menghubungi Aplikasi Mandiri Tenaga Kerja untuk melakukan penarikan persetujuan terhadap perolehan, pengumpulan, penyimpanan, pengelolaan dan penggunaan data Pengguna. Apabila terjadi demikian maka Pengguna memahami konsekuensi bahwa Pengguna tidak dapat menggunakan layanan Platform maupun layanan Aplikasi Mandiri Tenaga Kerja lainnya.\n\n"),
                          TextSpan(
                            text:
                                "F. Keamanan, Penyimpanan dan Penghapusan Data Pribadi Pengguna \n\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "Aplikasi Mandiri Tenaga Kerja melindungi setiap Data Pribadi Pengguna yang disimpan dalam sistemnya, serta melindungi data tersebut dari akses, penggunaan, modifikasi, pengambilan dan/atau pengungkapan tidak sah dengan menggunakan sejumlah tindakan dan prosedur keamanan, termasuk kata sandi dan kode OTP (One Time Password) Pengguna.Walaupun Aplikasi Mandiri Tenaga Kerja telah menggunakan upaya terbaiknya untuk mengamankan dan melindungi Data Pribadi Pengguna, perlu diketahui bahwa pengiriman data melalui Internet tidak pernah sepenuhnya aman. Dengan demikian, Aplikasi Mandiri Tenaga Kerja tidak dapat menjamin 100% keamanan data yang disediakan atau dikirimkan kepada Aplikasi Mandiri Tenaga Kerja oleh Pengguna dan pemberian informasi oleh Pengguna merupakan risiko yang ditanggung oleh Pengguna sendiri.Aplikasi Mandiri Tenaga Kerja akan menghapus dan/atau menganonimkan Data Pribadi Pengguna yang ada di bawah kendali Aplikasi Mandiri Tenaga Kerja apabila (i) Data Pribadi Pengguna tidak lagi diperlukan untuk memenuhi tujuan dari pengumpulannya; dan (ii) penyimpanan tidak lagi diperlukan untuk tujuan kepatuhan terhadap peraturan perundang-undangan yang berlaku.Mohon diperhatikan bahwa masih ada kemungkinan bahwa beberapa Data Pribadi Pengguna disimpan oleh pihak lain termasuk instansi penyelenggara negara yang berwenang. Dalam hal kami membagikan Data Pribadi Pengguna kepada instansi penyelenggara negara yang berwenang dan/atau instansi lainnya yang dapat ditunjuk oleh pemerintah yang berwenang atau memiliki kerja sama dengan Aplikasi Mandiri Tenaga Kerja, Pengguna menyetujui dan mengakui bahwa penyimpanan Data Pribadi Pengguna oleh instansi tersebut akan mengikuti kebijakan penyimpanan data masing-masing instansi tersebut.\n\n"),
                          TextSpan(
                            text: "G.	Pembaruan Kebijakan Privasi \n\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                                  "Aplikasi Mandiri Tenaga Kerja dapat sewaktu-waktu melakukan perubahan atau pembaruan terhadap Kebijakan Privasi ini sebagai bagian dari kepatuhan terhadap peraturan perundang-undangan dan kebijakan internal perusahaan. Aplikasi Mandiri Tenaga Kerja akan memberikan notifikasi kepada Pengguna dalam adanya perubahan dan/atau pembaruan dalam Kebijakan Privasi ini.\n\n"),
                          // TextSpan(text: "Aplikasi Mandiri Tenaga Kerja dapat sewaktu-waktu "),
                          // TextSpan(
                          //   text: "Penting: ",
                          //   style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          // ),
                          // TextSpan(
                          //     text:
                          //         "Jika Anda tidak menyetujui ketentuan ini, harap untuk tidak menggunakan aplikasi ini."),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  activeColor: Colors.blue[800],
                  onChanged: _hasScrolledToEnd
                      ? (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        }
                      : null, // Disable centang jika belum scroll
                ),
                Expanded(
                  child: Text(
                      "Saya telah membaca dan menyetujui kebijakan di atas."),
                ),
              ],
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800] // Warna biru untuk tombol
                ),
                onPressed: _isChecked
                    ? _acceptPolicy
                    : null, // Disable tombol jika belum dicentang
                child: Text(
                  "Lanjut ke Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}