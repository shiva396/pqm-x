import 'package:flutter/material.dart';
import 'package:pond/widgets/dialog_box/input_dialog_box.dart';
import 'package:pond/widgets/expansion_tile.dart';
import 'package:pond/widgets/drawer/custom_drawer.dart';
import 'package:pond/widgets/navbar/bottom_navbar.dart'; 

class Home extends StatefulWidget {
  const Home({super.key});

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
          title: const Text('Pond Details'),
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: taskBlocks,
      ),
      floatingActionButton: FloatingActionButton(
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
      ),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onNavItemTapped,
      ),
    );
  }
}
