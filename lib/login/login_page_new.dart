import 'package:ess_mobile/buttomnavbar/buttom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Log1());
}

class Log1 extends StatelessWidget {
  const Log1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionColor: Colors.blue.withOpacity(0.4),
          selectionHandleColor: Colors.blue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage1(),
    );
  }
}

class LoginPage1 extends StatefulWidget {
  const LoginPage1({super.key});

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  bool _isPasswordVisible = false;
  bool _isUsernameFocused = false;
  bool _isPasswordFocused = false;
  // bool isLoading = false;
  // bool _showUsernameError = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    // isLoading = true;
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLogin = prefs.getBool('first_login') ?? true;
    // _showUsernameError = _usernameController.text.isEmpty;
    // Simulasi login (username: admin, password: 1234)
    if (_usernameController.text == "23455" &&
        _passwordController.text == "1234") {
      // isLoading = false;
      if (isFirstLogin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ButtomNavBar()),
        );
      }
    } else {
      // _showUsernameError = _usernameController.text.isEmpty;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau Password salah!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue[800],
      ), // transparent status bar color
    );
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(title: const Text(""),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/essadm.png',
                  width: 130,
                ),
                const SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login ID",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 8),
                Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      _isUsernameFocused = hasFocus;
                    });
                  },
                  child: TextField(
                    // cursorColor: _showUsernameError ? Colors.red : Colors.blue,
                    controller: _usernameController,
                    cursorColor: Colors.blue[800],
                    decoration: InputDecoration(
                      // errorText: _showUsernameError ? 'Login ID tidak boleh kosong' : null,
                      prefixIcon: Icon(Icons.person,
                          color: _isUsernameFocused
                              ? Colors.blue[800]
                              : Colors.black54),
                      hintText: "Masukkan FixNo",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 1.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 8),
                Focus(
                  onFocusChange: (hasFocus) {
                    setState(() {
                      _isPasswordFocused = hasFocus;
                    });
                  },
                  child: TextField(
                    controller: _passwordController,

                    // obscureText: true,
                    cursorColor: Colors.blue[800],
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key,
                          color: _isPasswordFocused
                              ? Colors.blue[800]
                              : Colors.black54),
                      hintText: "Masukkan Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black54, width: 1.5),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          // ignore: deprecated_member_use
                          color: Colors.blue[800]!.withOpacity(0.7),
                        ),
                        onPressed: () {
                          setState(() {
                            // isLoading = true;
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 15,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     // const Text("Lupa Password?"),
                //     TextButton(
                //       onPressed: () {
                //         // Navigate to sign up
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) =>
                //                     const ChangePasswordScreen()));
                //       },
                //       child: Text(
                //         'Lupa Password?',
                //         style: TextStyle(
                //           color: Colors.blue[800],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 50),
                // isLoading
                //     ? CircularProgressIndicator()
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                // const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: _login,
                //   child: const Text("Login"),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isPasswordFocused = false;
  bool _isPasswordVisible = false;
  bool isLoading = false;
  // bool _isUsernameFocused = false;
  // final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _changePassword() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'first_login', false); // Set status login pertama selesai
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ButtomNavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue[800],
      ), // transparent status bar color
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text(
          "Ganti Password",
          style: TextStyle(
            color: Colors.white, // Ubah warna teks menjadi biru
            fontSize: 20, // Ukuran teks
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            // Icons.arrow_back,
            Icons.chevron_left_rounded, size: 35,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // appBar: AppBar(title: const Text("Ganti Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password Baru",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // TextField(
            //   controller: _newPasswordController,
            //   decoration: const InputDecoration(labelText: "Password Baru"),
            //   obscureText: true,
            // ),
            const SizedBox(height: 15),
            Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  _isPasswordFocused = hasFocus;
                });
              },
              child: TextField(
                controller: _passwordController,

                // obscureText: true,
                cursorColor: Colors.blue[800],
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key_rounded,
                      color: _isPasswordFocused
                          ? Colors.blue[800]
                          : Colors.black54),
                  hintText: "Masukkan Password Baru",
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue[800]!, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 1.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      // ignore: deprecated_member_use
                      color: Colors.blue[800]!.withOpacity(0.7),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blue[800] // Warna biru untuk tombol
                        ),
                    onPressed: _changePassword,
                    child: const Text(
                      "Simpan Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
