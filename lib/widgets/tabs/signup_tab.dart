// import 'package:flutter/material.dart';
// import 'package:pond/home.dart';

// class SignUpTab extends StatefulWidget {
//   const SignUpTab({super.key});

//   @override
//   State<SignUpTab> createState() => _SignUpTabState();
// }

// class _SignUpTabState extends State<SignUpTab> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           child: Column(
//             children: <Widget>[
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Email Address',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 28),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey[350],
//                     borderRadius: BorderRadius.circular(12.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 6,
//                         offset: const Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Email',
//                       hintStyle: const TextStyle(color: Colors.black),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Password',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 28),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey[350],
//                     borderRadius: BorderRadius.circular(12.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 6,
//                         offset: const Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       hintStyle: const TextStyle(color: Colors.black),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     obscureText: true,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Confirm Password',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 28),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey[350],
//                     borderRadius: BorderRadius.circular(12.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 6,
//                         offset: const Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Confirm Password',
//                       hintStyle: const TextStyle(color: Colors.black),
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     obscureText: true,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // print('clicked');
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const Home()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF26A3EA),
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 32.0, vertical: 12.0),
//                   textStyle: const TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.bold),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 child: const Text('Sign Up'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
