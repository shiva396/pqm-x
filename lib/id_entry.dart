import 'package:flutter/material.dart';
import 'package:pond/home.dart';

class UniqueIdEntryScreen extends StatefulWidget {
  const UniqueIdEntryScreen({super.key});

  @override
  _UniqueIdEntryScreenState createState() => _UniqueIdEntryScreenState();
}

class _UniqueIdEntryScreenState extends State<UniqueIdEntryScreen> {
  final TextEditingController _idController = TextEditingController();
  final List<String> validIds = ["123abc", "456DEF", "789GHI", "123"];

  void _validateId() {
    String enteredId = _idController.text.trim();
    if (validIds.contains(enteredId)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home(userId: enteredId)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid ID. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your ID to continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Logo
          Image.asset(
            'assets/images/Logo.png',
            width: 200,
            height: 200,
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      labelText: 'Enter ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _validateId,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Enter'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
