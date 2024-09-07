import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:pond/parameters/data_tab/tab_10days.dart';
import 'package:pond/parameters/data_tab/tab_24hrs.dart';

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
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      appBar: AppBar(
        title: Text(parameterName),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: const Border(
                bottom: BorderSide(color: Colors.blueAccent, width: 5),
              ),
            ),
            child: Card(
              color: Colors.white,
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
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
                          Text('Value: $value',
                              style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 4),
                          Text('Level: $level',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        child: LiquidCircularProgressIndicator(
                          value: .5,
                          valueColor: AlwaysStoppedAnimation(
                              const Color.fromARGB(255, 30, 142, 233)),
                          backgroundColor: Colors.white,
                          borderColor: const Color.fromARGB(255, 117, 117, 117),
                          borderWidth: 1.0,
                          direction: Axis.vertical,
                        ),
                      )),
                ],
              ),
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
                    indicatorColor: Colors.blueAccent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
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
    );
  }
}
