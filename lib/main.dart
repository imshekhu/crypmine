import './transaction.dart';
import 'package:flutter/material.dart';
import './loginScreen.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrypMine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      onGenerateRoute: onGenerateRoute,
    );
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == '/login') {
      return MaterialPageRoute(builder: (_) => LoginScreen());
    }
    // if (routeSettings.name == '/forget_password') {
    //   return MaterialPageRoute(builder: (_) => ForgetPassword());
    // }

    return MaterialPageRoute(builder: (_) => LoginScreen());
  }
}

// class MyHomePage extends StatelessWidget {
//   final List<Transaction> transactions = [
//     Transaction(id: 't1', title: 'title', amount: 10, date: DateTime.now()),
//     Transaction(id: 't2', title: 'title2', amount: 20, date: DateTime.now())
//   ];

//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Expanses Calculator"),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Container(
//               width: double.infinity,
//               child: const Card(
//                 child: Text("Chart!"),
//                 elevation: 5,
//                 color: Colors.black12,
//               ),
//             ),
//             Column(
//               children: transactions
//                   .map((el) => Card(child: Text(el.title)))
//                   .toList(),
//             ),
//           ],
//         ));
//   }
// }
