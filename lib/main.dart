// import 'package:flutter/material.dart';
// import 'package:pond/helper/flask.dart';
// // import 'temperature_container.dart'; // Import the file with the TemperatureContainer class

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Temperature Container')),
//         body: Center(
//           child: TemperatureContainer(
//             fillLevel: 0.75, // 75% filled
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pond/id_entry.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Poppins',
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade300)))),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        body: UniqueIdEntryScreen(),
      ),
    );
  }
}
