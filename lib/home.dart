import 'package:flutter/material.dart';
import 'package:pond/profile.dart';
import 'package:pond/widgets/dialog_box/input_dialog_box.dart';
import 'package:pond/widgets/expansion_tile.dart';
import 'package:pond/widgets/drawer/custom_drawer.dart';
import 'package:pond/widgets/navbar/bottom_navbar.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  final String userId;

  const Home({super.key, required this.userId});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> taskBlocks = [];
  int _selectedIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          title: _selectedIndex == 0
              ? const Text('Pond Details')
              : _selectedIndex == 1
                  ? const Text('Notification page')
                  : _selectedIndex == 2
                      ? const Text('Profile')
                      : _selectedIndex == 3
                          ? const Text('Settings')
                          : const SizedBox(),
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: _selectedIndex == 0
          ? ListView(
              padding: const EdgeInsets.all(16.0),
              children: taskBlocks,
            )
          : _selectedIndex == 1
              ? const Center(child: Text('Notification page'))
              : _selectedIndex == 2
                  ? const ProfilePage()
                  : _selectedIndex == 3
                      ? const SettingsPage()
                      : const SizedBox(),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.blue.shade300,
              onPressed: () async {
                final values = await showDialog<List<dynamic>>(
                  context: context,
                  builder: (context) => const InputDialog(),
                );

                if (values != null) {
                  setState(() {
                    taskBlocks.add(TaskBlock(
                      title: values[0],
                      landSqFeet: values[1],
                      numSystems: values[2],
                    ));
                  });
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onNavItemTapped,
      ),
    );
  }
}
