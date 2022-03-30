import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import 'homePage.dart';

// const SERVER_IP = 'http://192.168.1.167:5000';
// final storage = FlutterSecureStorage();

// class LoginPage extends StatelessWidget {
//   final TextEditingController __usernameController = TextEditingController();
//   final TextEditingController __passwordController = TextEditingController();

//   void displayDialog(context, title, text) => showDialog(
//         context: context,
//         builder: (context) =>
//             AlertDialog(title: Text(title), content: Text(text)),
//       );

//   Future<String?> attemptLogIn(String username, String password) async {
//     var res = await http.post("$SERVER_IP/login",
//         body: {"username": username, "password": password});
//     if (res.statusCode == 200) return res.body;
//     return null;
//   }

//   Future<int> attemptSignUp(String username, String password) async {
//     var res = await http.post('$SERVER_IP/signup',
//         body: {"username": username, "password": password});
//     return res.statusCode;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Log In"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               TextField(
//                 controller: __usernameController,
//                 decoration: const InputDecoration(labelText: 'Username'),
//               ),
//               TextField(
//                 controller: __passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//               ),
//               FlatButton(
//                   onPressed: () async {
//                     var username = __usernameController.text;
//                     var password = __passwordController.text;
//                     var jwt = await attemptLogIn(username, password);
//                     if (jwt != null) {
//                       storage.write(key: "jwt", value: jwt);
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => HomePage.fromBase64(jwt)));
//                     } else {
//                       displayDialog(context, "An Error Occurred",
//                           "No account was found matching that username and password");
//                     }
//                   },
//                   child: Text("Log In")),
//               FlatButton(
//                   onPressed: () async {
//                     var username = __usernameController.text;
//                     var password = __passwordController.text;

//                     if (username.length < 4)
//                       displayDialog(context, "Invalid Username",
//                           "The username should be at least 4 characters long");
//                     else if (password.length < 4)
//                       displayDialog(context, "Invalid Password",
//                           "The password should be at least 4 characters long");
//                     else {
//                       var res = await attemptSignUp(username, password);
//                       if (res == 201)
//                         displayDialog(context, "Success",
//                             "The user was created. Log in now.");
//                       else if (res == 409)
//                         displayDialog(
//                             context,
//                             "That username is already registered",
//                             "Please try to sign up using another username or log in if you already have an account.");
//                       else {
//                         displayDialog(
//                             context, "Error", "An unknown error occurred.");
//                       }
//                     }
//                   },
//                   child: Text("Sign Up"))
//             ],
//           ),
//         ));
//   }
// }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Widget buildForgetPassBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () => print('Forget button pressed'),
      child: const Text(
        'Forget Password',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<String?> attemptLogIn(String username, String password) async {
    // var res = await http.post("https://localhost/login",
    //     body: {"username": username, "password": password});
    // if (res.statusCode == 200) return res.body;
    return null;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff5ac18e),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black38),
            ),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: _passwordController,
            // controller: __passwordController,
            obscureText: true,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff5ac18e),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black38),
            ),
          ),
        )
      ],
    );
  }

  Widget buildRememberCb() {
    return SizedBox(
      height: 20,
      child: Row(children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: isRememberMe,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                isRememberMe = value!;
              });
            },
          ),
        ),
        const Text(
          'Remember Me',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }

  Widget buildLoginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          var username = _usernameController.text;
          var password = _passwordController.text;
          var jwt = await attemptLogIn(username, password);
          displayDialog(context, "An Error Occurred",
              "No account was found matching that username and password");
        },
        child: const Text(
          'Login',
          style: TextStyle(
              color: Color(0xff5ac18e),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x665ac18e),
                        Color(0x995ac18e),
                        Color(0xcc5ac18e),
                        Color(0xff5ac18e),
                      ]),
                ),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 50),
                        buildEmail(),
                        const SizedBox(height: 20),
                        buildPassword(),
                        buildForgetPassBtn(),
                        buildRememberCb(),
                        buildLoginButton()
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
