import 'package:flutter/material.dart';
import 'package:pond/parameters/data_tab/tab_10days.dart';
import 'package:pond/parameters/data_tab/tab_24hrs.dart';
import 'package:pond/widgets/navbar/bottom_navbar.dart';  

class ParameterDetailPage extends StatelessWidget {
  final String parameterName;
  final String imagePath;
  final String value;
  final String level;

  const ParameterDetailPage({
    super.key,
    required this.parameterName,
    required this.imagePath,
    required this.value,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(parameterName),
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(parameterName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 4),
                        Text('Value: $value', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 4),
                        Text('Level: $level', style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 90,
                    height: 150,
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Switching between 24 Hours and 10 Days data
          const Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: '24 Hours'),
                      Tab(text: '10 Days'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Tab24Hours(),
                        Tab10Days(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: 0, 
        onItemTapped: (index) {
          
        },
      ),
    );
  }
}
