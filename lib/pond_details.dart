import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:pond/parameters/parameter_details.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CardDetailPage extends StatefulWidget {
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
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  String value = 'System 1';
  double _widgetPointerWithGradientValue = 60;
  double _meterValue = 35;
  final double _temperatureValue = 37.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DropdownButton<String>(
                hint: Text(value),
                icon: const Icon(Icons.arrow_drop_down),
                underline: Container(),
                items: List.generate(widget.numSystems, (index) {
                  return DropdownMenuItem<String>(
                    value: 'System ${index + 1}',
                    child: Text('System ${index + 1}'),
                  );
                }).toList(),
                onChanged: (v) {
                  setState(() {
                    value = v!;
                  });
                },
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: value == "System 1"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Oxygen Level Card
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ParameterDetailPage(
                              parameterName: 'Oxygen Level',
                              value: '7.5',
                              level: 'Normal',
                              imagePath: 'assets/GIF/oxygen-tank.gif',
                              meter: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: LiquidCircularProgressIndicator(
                                      value: .5,
                                      valueColor: AlwaysStoppedAnimation(
                                          Color.fromARGB(255, 30, 142, 233)),
                                      backgroundColor: Colors.white,
                                      borderColor:
                                          Color.fromARGB(255, 117, 117, 117),
                                      borderWidth: 1.0,
                                      direction: Axis.vertical,
                                    ),
                                  )),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: LiquidCircularProgressIndicator(
                                        value: .5,
                                        valueColor:
                                            const AlwaysStoppedAnimation(
                                                Color.fromARGB(
                                                    255, 30, 142, 233)),
                                        backgroundColor: Colors.white,
                                        borderColor: const Color.fromARGB(
                                            255, 117, 117, 117),
                                        borderWidth: 1.0,
                                        direction: Axis.vertical,
                                      ),
                                    )),
                              ],
                            ),
                            Container(
                              height: 3,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
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
                            builder: (context) => ParameterDetailPage(
                              parameterName: 'PH Level',
                              value: '6.8',
                              level: 'Slightly Acidic',
                              imagePath: 'assets/GIF/ph-meter.gif',
                              meter: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: SfRadialGauge(axes: <RadialAxis>[
                                      RadialAxis(
                                          minimum: 0,
                                          maximum: 150,
                                          ranges: <GaugeRange>[
                                            GaugeRange(
                                                label: "Acidic",
                                                labelStyle: GaugeTextStyle(
                                                    fontSize: 10),
                                                startValue: 0,
                                                endValue: 50,
                                                color: Colors.green),
                                            GaugeRange(
                                                label: "Neutral",
                                                labelStyle: GaugeTextStyle(
                                                    fontSize: 10),
                                                startValue: 50,
                                                endValue: 100,
                                                color: Colors.orange),
                                            GaugeRange(
                                                label: "Alkaline",
                                                labelStyle: GaugeTextStyle(
                                                    fontSize: 10),
                                                startValue: 100,
                                                endValue: 150,
                                                color: Colors.red)
                                          ],
                                          pointers: <GaugePointer>[
                                            NeedlePointer(
                                              value: 50,
                                            )
                                          ],
                                          annotations: <GaugeAnnotation>[
                                            GaugeAnnotation(
                                                widget: Container(
                                                    child: Text('50.0',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                angle: 90,
                                                positionFactor: 0.5)
                                          ])
                                    ]),
                                  )),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: SfRadialGauge(axes: <RadialAxis>[
                                        RadialAxis(
                                            minimum: 0,
                                            maximum: 150,
                                            ranges: <GaugeRange>[
                                              GaugeRange(
                                                  label: "Acidic",
                                                  labelStyle:
                                                      const GaugeTextStyle(
                                                          fontSize: 10),
                                                  startValue: 0,
                                                  endValue: 50,
                                                  color: Colors.green),
                                              GaugeRange(
                                                  label: "Neutral",
                                                  labelStyle:
                                                      const GaugeTextStyle(
                                                          fontSize: 10),
                                                  startValue: 50,
                                                  endValue: 100,
                                                  color: Colors.orange),
                                              GaugeRange(
                                                  label: "Alkaline",
                                                  labelStyle:
                                                      const GaugeTextStyle(
                                                          fontSize: 10),
                                                  startValue: 100,
                                                  endValue: 150,
                                                  color: Colors.red)
                                            ],
                                            pointers: <GaugePointer>[
                                              const NeedlePointer(
                                                value: 50,
                                              )
                                            ],
                                            annotations: <GaugeAnnotation>[
                                              GaugeAnnotation(
                                                  widget: Container(
                                                      child: const Text('50.0',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  angle: 90,
                                                  positionFactor: 0.5)
                                            ])
                                      ]),
                                    )),
                              ],
                            ),
                            Container(
                              height: 3,
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Temperature and Salinity Cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ParameterDetailPage(
                                    parameterName: 'Temperature',
                                    value: '22°C',
                                    level: 'Normal',
                                    imagePath: 'assets/GIF/Temperature.gif',
                                    meter: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          height: 100,
                                          width: 60,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              /// Linear gauge to display celsius scale.
                                              SfLinearGauge(
                                                  minimum: -20,
                                                  maximum: 50,
                                                  interval: 10,
                                                  minorTicksPerInterval: 0,
                                                  axisTrackExtent: 23,
                                                  axisTrackStyle:
                                                      LinearAxisTrackStyle(
                                                          thickness: 12,
                                                          color: Colors.grey,
                                                          borderWidth: 1,
                                                          edgeStyle:
                                                              LinearEdgeStyle
                                                                  .bothCurve),
                                                  tickPosition:
                                                      LinearElementPosition
                                                          .outside,
                                                  labelPosition:
                                                      LinearLabelPosition
                                                          .outside,
                                                  orientation:
                                                      LinearGaugeOrientation
                                                          .vertical,
                                                  markerPointers: <LinearMarkerPointer>[
                                                    LinearWidgetPointer(
                                                        markerAlignment:
                                                            LinearMarkerAlignment
                                                                .end,
                                                        value: 50,
                                                        enableAnimation: false,
                                                        position:
                                                            LinearElementPosition
                                                                .outside,
                                                        offset: 8,
                                                        child: SizedBox(
                                                          height: 30,
                                                          child: Text(
                                                            '°C',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        )),
                                                    LinearShapePointer(
                                                      value: -20,
                                                      markerAlignment:
                                                          LinearMarkerAlignment
                                                              .start,
                                                      shapeType:
                                                          LinearShapePointerType
                                                              .circle,
                                                      borderWidth: 1,
                                                      borderColor:
                                                          Colors.black26,
                                                      color: Colors.grey,
                                                      position:
                                                          LinearElementPosition
                                                              .cross,
                                                      width: 24,
                                                      height: 24,
                                                    ),
                                                    LinearShapePointer(
                                                      value: -20,
                                                      markerAlignment:
                                                          LinearMarkerAlignment
                                                              .start,
                                                      shapeType:
                                                          LinearShapePointerType
                                                              .circle,
                                                      borderWidth: 6,
                                                      borderColor:
                                                          Colors.transparent,
                                                      color: _meterValue >
                                                              _temperatureValue
                                                          ? const Color(
                                                              0xffFF7B7B)
                                                          : const Color(
                                                              0xff0074E3),
                                                      position:
                                                          LinearElementPosition
                                                              .cross,
                                                      width: 24,
                                                      height: 24,
                                                    ),
                                                    LinearWidgetPointer(
                                                        value: -20,
                                                        markerAlignment:
                                                            LinearMarkerAlignment
                                                                .start,
                                                        child: Container(
                                                          width: 10,
                                                          height: 3.4,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border(
                                                              left: BorderSide(
                                                                  width: 2.0,
                                                                  color: Colors
                                                                      .grey),
                                                              right: BorderSide(
                                                                  width: 2.0,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                            color: _meterValue >
                                                                    _temperatureValue
                                                                ? const Color(
                                                                    0xffFF7B7B)
                                                                : const Color(
                                                                    0xff0074E3),
                                                          ),
                                                        )),
                                                    LinearWidgetPointer(
                                                        value: _meterValue,
                                                        enableAnimation: false,
                                                        position:
                                                            LinearElementPosition
                                                                .outside,
                                                        onChanged:
                                                            (dynamic value) {
                                                          setState(() {
                                                            _meterValue =
                                                                value as double;
                                                          });
                                                        },
                                                        child: Container(
                                                            width: 16,
                                                            height: 12,
                                                            transform: Matrix4
                                                                .translationValues(
                                                                    4, 0, 0.0),
                                                            child: Image.asset(
                                                              'assets/images/triangle_pointer.png',
                                                              color: _meterValue >
                                                                      _temperatureValue
                                                                  ? const Color(
                                                                      0xffFF7B7B)
                                                                  : const Color(
                                                                      0xff0074E3),
                                                            ))),
                                                    LinearShapePointer(
                                                      value: _meterValue,
                                                      width: 20,
                                                      height: 20,
                                                      enableAnimation: false,
                                                      color: Colors.transparent,
                                                      position:
                                                          LinearElementPosition
                                                              .cross,
                                                      onChanged:
                                                          (dynamic value) {
                                                        setState(() {
                                                          _meterValue =
                                                              value as double;
                                                        });
                                                      },
                                                    )
                                                  ],
                                                  barPointers: <LinearBarPointer>[
                                                    LinearBarPointer(
                                                      value: _meterValue,
                                                      enableAnimation: false,
                                                      thickness: 6,
                                                      edgeStyle: LinearEdgeStyle
                                                          .endCurve,
                                                      color: _meterValue >
                                                              _temperatureValue
                                                          ? const Color(
                                                              0xffFF7B7B)
                                                          : const Color(
                                                              0xff0074E3),
                                                    )
                                                  ]),
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 100,
                                      width: 60,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          /// Linear gauge to display celsius scale.
                                          SfLinearGauge(
                                              minimum: -20,
                                              maximum: 50,
                                              interval: 10,
                                              minorTicksPerInterval: 0,
                                              axisTrackExtent: 23,
                                              axisTrackStyle:
                                                  LinearAxisTrackStyle(
                                                      thickness: 12,
                                                      color: Colors.grey,
                                                      borderWidth: 1,
                                                      edgeStyle: LinearEdgeStyle
                                                          .bothCurve),
                                              tickPosition:
                                                  LinearElementPosition.outside,
                                              labelPosition:
                                                  LinearLabelPosition.outside,
                                              orientation:
                                                  LinearGaugeOrientation
                                                      .vertical,
                                              markerPointers: <LinearMarkerPointer>[
                                                LinearWidgetPointer(
                                                    markerAlignment:
                                                        LinearMarkerAlignment
                                                            .end,
                                                    value: 50,
                                                    enableAnimation: false,
                                                    position:
                                                        LinearElementPosition
                                                            .outside,
                                                    offset: 8,
                                                    child: SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                        '°C',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    )),
                                                LinearShapePointer(
                                                  value: -20,
                                                  markerAlignment:
                                                      LinearMarkerAlignment
                                                          .start,
                                                  shapeType:
                                                      LinearShapePointerType
                                                          .circle,
                                                  borderWidth: 1,
                                                  borderColor: Colors.black26,
                                                  color: Colors.grey,
                                                  position:
                                                      LinearElementPosition
                                                          .cross,
                                                  width: 24,
                                                  height: 24,
                                                ),
                                                LinearShapePointer(
                                                  value: -20,
                                                  markerAlignment:
                                                      LinearMarkerAlignment
                                                          .start,
                                                  shapeType:
                                                      LinearShapePointerType
                                                          .circle,
                                                  borderWidth: 6,
                                                  borderColor:
                                                      Colors.transparent,
                                                  color: _meterValue >
                                                          _temperatureValue
                                                      ? const Color(0xffFF7B7B)
                                                      : const Color(0xff0074E3),
                                                  position:
                                                      LinearElementPosition
                                                          .cross,
                                                  width: 24,
                                                  height: 24,
                                                ),
                                                LinearWidgetPointer(
                                                    value: -20,
                                                    markerAlignment:
                                                        LinearMarkerAlignment
                                                            .start,
                                                    child: Container(
                                                      width: 10,
                                                      height: 3.4,
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          left: BorderSide(
                                                              width: 2.0,
                                                              color:
                                                                  Colors.grey),
                                                          right: BorderSide(
                                                              width: 2.0,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        color: _meterValue >
                                                                _temperatureValue
                                                            ? const Color(
                                                                0xffFF7B7B)
                                                            : const Color(
                                                                0xff0074E3),
                                                      ),
                                                    )),
                                                LinearWidgetPointer(
                                                    value: _meterValue,
                                                    enableAnimation: false,
                                                    position:
                                                        LinearElementPosition
                                                            .outside,
                                                    onChanged: (dynamic value) {
                                                      setState(() {
                                                        _meterValue =
                                                            value as double;
                                                      });
                                                    },
                                                    child: Container(
                                                        width: 16,
                                                        height: 12,
                                                        transform: Matrix4
                                                            .translationValues(
                                                                4, 0, 0.0),
                                                        child: Image.asset(
                                                          'assets/images/triangle_pointer.png',
                                                          color: _meterValue >
                                                                  _temperatureValue
                                                              ? const Color(
                                                                  0xffFF7B7B)
                                                              : const Color(
                                                                  0xff0074E3),
                                                        ))),
                                                LinearShapePointer(
                                                  value: _meterValue,
                                                  width: 20,
                                                  height: 20,
                                                  enableAnimation: false,
                                                  color: Colors.transparent,
                                                  position:
                                                      LinearElementPosition
                                                          .cross,
                                                  onChanged: (dynamic value) {
                                                    setState(() {
                                                      _meterValue =
                                                          value as double;
                                                    });
                                                  },
                                                )
                                              ],
                                              barPointers: <LinearBarPointer>[
                                                LinearBarPointer(
                                                  value: _meterValue,
                                                  enableAnimation: false,
                                                  thickness: 6,
                                                  edgeStyle:
                                                      LinearEdgeStyle.endCurve,
                                                  color: _meterValue >
                                                          _temperatureValue
                                                      ? const Color(0xffFF7B7B)
                                                      : const Color(0xff0074E3),
                                                )
                                              ]),
                                        ],
                                      )),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  Container(
                                    height: 3,
                                    decoration: const BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ParameterDetailPage(
                                    parameterName: 'Salinity',
                                    value: '35 ppt',
                                    level: 'Normal',
                                    imagePath: 'assets/images/salinity.png',
                                    meter: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 100,
                                        child: Image.asset(
                                            'assets/images/salinity.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: Image.asset(
                                        'assets/images/salinity.png'),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  Container(
                                    height: 3,
                                    decoration: const BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
