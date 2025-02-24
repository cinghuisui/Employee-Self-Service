import 'package:ess_mobile/buttomnavbar/buttom_nav_bar.dart';
import 'package:ess_mobile/pages/profile/change_password.dart';
// import 'package:ess_mobile/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Log());
}

class Log extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue[800],
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();

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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            //We put all our textfield to a from to be controlled and not allow as empty
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  //Username field

                  //Before we show the image, after we copied the image we need to define the location in pubspec.yaml
                  Image.asset(
                    'assets/images/essadm.png',
                    width: 130,
                  ),
                  // Image.asset(
                  //   "lib/assets/essadm.png",
                  //   width: 130,
                  // ),
                  const SizedBox(
                    height: 100,
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "   Silahkan login untuk masuk aplikasi",
                        style: TextStyle(
                          color: Colors.grey,
                          height: 5,
                        ),
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),

                      // TextButton(
                      //     onPressed: () {
                      //       //Navigate to sign up
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => const SignUp()));
                      //     },
                      //     child: const Text("SIGN UP"))
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 10, 168, 241)
                            .withOpacity(.1)),
                    child: TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "NIK Label is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Fix No",
                      ),
                    ),
                  ),

                  //Password fild
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 10, 137, 241)
                            .withOpacity(.1)),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        }
                        return null;
                      },
                      obscureText: isVisible,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                //In here we will create a click to show and hide the password a toggle button
                                setState(() {
                                  //toggle button
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // const Text("Lupa Password?"),
                      TextButton(
                          onPressed: () {
                            // Navigate to sign up
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChangePassword()));
                          },
                          child: Text('Lupa Password?',style: TextStyle(color: Colors.blue[800],),))
                    ],
                  ),

                  const SizedBox(height: 10),
                  //Login Button

                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ButtomNavBar()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 130, // Lebar tombol
                        vertical: 17, // Tinggi tombol
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor:
                          Colors.blue[800], // Warna latar belakang tombol
                      foregroundColor: Colors.white, // Warna teks atau ikon
                      shadowColor: Colors.black, // Warna bayangan
                      elevation: 5, // Tinggi bayangan
                    ),
                    child: const Text(
                      "L o g i n",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Container(
                  //   height: 60,
                  //   width: MediaQuery.of(context).size.width * .9,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       color: Colors.blue),
                  //   child: TextButton(
                  //     onPressed: () {
                  //       if (formKey.currentState!.validate()) {
                  //         //Login method will be here
                  //       }
                  //     },
                  //     child: const Text(
                  //       "LOGIN",
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  // Sign up button,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Text("Belum punya acconunt?"),
                  //     TextButton(
                  //         onPressed: () {
                  //           //Navigate to sign up
                  //           // Navigator.push(
                  //           //     context,
                  //           //     MaterialPageRoute(
                  //           //         builder: (context) => const SignUp()));
                  //         },
                  //         child: const Text("SIGN UP"))
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
