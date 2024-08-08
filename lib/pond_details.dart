import 'package:flutter/material.dart';
import 'package:pond/widgets/drop_down.dart';
import 'package:pond/widgets/navbar/bottom_navbar.dart';
import 'package:pond/parameters/parameter_details.dart';

class CardDetailPage extends StatelessWidget {
  final String title;
  final int landSqFeet;
  final int numSystems;

  const CardDetailPage({
    super.key,
    required this.title,
    required this.landSqFeet,
    required this.numSystems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        actions: [
          Dropdown(
            numSystems: numSystems,
            onChanged: (value) {
              // print('Selected system: $value');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Oxygen Level Card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ParameterDetailPage(
                        parameterName: 'Oxygen Level',
                        value: '7.5',
                        level: 'Normal',
                        imagePath: 'assets/images/o2.png',
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Oxygen Level',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(height: 4),
                              Text('Value: 7.5',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(height: 4),
                              Text('Level: Normal',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 90,
                          height: 150,
                          child: Image.asset('assets/images/o2.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // PH Level Card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ParameterDetailPage(
                        parameterName: 'PH Level',
                        value: '7.5',
                        level: 'Slightly Acidic',
                        imagePath: 'assets/images/ph.png',
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('PH Level',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(height: 4),
                              Text('Value: 6.8',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(height: 4),
                              Text('Level: Slightly Acidic',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 90,
                          height: 150,
                          child: Image.asset('assets/images/ph.png',fit: BoxFit.none,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Temperature Card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ParameterDetailPage(
                        parameterName: 'Temperature',
                        value: '22°C',
                        level: 'Normal',
                        imagePath: 'assets/images/temp.png',
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              child:
                                  Image.asset('assets/images/temp.png'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Temperature',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(height: 4),
                                  Text('Value: 22°C',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 4),
                                  Text('Level: Normal',
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Salinity Card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ParameterDetailPage(
                                parameterName: 'Salinity',
                                value: '35 ppt',
                                level: 'Normal',
                                imagePath: 'assets/images/salinity.png',
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                child: Image.asset('assets/images/salinity.png'),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Salinity',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(height: 4),
                                    Text('Value: 35 ppt',
                                        style: TextStyle(fontSize: 16)),
                                    SizedBox(height: 4),
                                    Text('Level: Normal',
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: 0,
        onItemTapped: (index) {
          // 
        },
      ),
    );
  }
}
