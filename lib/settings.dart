import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const ListTile(
            title: Text('Version'),
            subtitle: Text('1.0.0'),
            leading: Icon(Icons.info_outline),
          ),
          ListTile(
            title: const Text('Terms of Use'),
            leading: const Icon(Icons.article),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Licenses'),
            leading: const Icon(Icons.document_scanner_sharp),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Notifications'),
            leading: const Icon(Icons.notifications),
            trailing: Switch(
              activeColor: Colors.blue.shade300,
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Help Center'),
            leading: const Icon(Icons.help_outline),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Contact Us'),
            leading: const Icon(Icons.contact_mail),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
