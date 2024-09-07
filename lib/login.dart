// import 'package:flutter/material.dart';
// import 'package:pond/widgets/tabs/login_tab.dart';
// import 'package:pond/widgets/tabs/signup_tab.dart';


// class LoginForm extends StatelessWidget {
//   const LoginForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2, 
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(height: 80.0),
//             Image.asset(
//               'assets/images/Logo.png', 
//               height: 200.0,
//             ),
//             const SizedBox(height: 16.0),
//             const TabBar(
//               indicatorColor: Color(0xFF26A3EA),
//               labelColor: Colors.black, 
//               unselectedLabelColor: Colors.grey, 
//               tabs: [
//                 Tab(text: 'Login'),
//                 Tab(text: 'Sign Up'),
//               ],
//             ),
//             const SizedBox(height: 32.0),
//             const Expanded(
//               child: TabBarView(
//                 children: [
//                   LoginTab(),
//                   SignUpTab(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }  
// }
