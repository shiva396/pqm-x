// import 'package:flutter/material.dart';

// class TemperaturePainter extends CustomPainter {
//   final double fillLevel; // Should be between 0.0 and 1.0

//   TemperaturePainter({required this.fillLevel});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final double pipeWidth = size.width * 0.2;
//     final double pipeHeight = size.height * 0.6;
//     final double baseOvalWidth = size.width;
//     final double baseOvalHeight = size.height * 0.4;
//     final double liquidHeight = pipeHeight * fillLevel;

//     final Paint paintOutline = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4.0;

//     // Draw the base oval
//     final Path baseOvalPath = Path()
//       ..addOval(Rect.fromCenter(
//         center: Offset(size.width * 0.5, size.height - baseOvalHeight / 2),
//         width: baseOvalWidth,
//         height: baseOvalHeight,
//       ));

//     // Draw the vertical pipe
//     final Path pipePath = Path()
//       ..addRect(Rect.fromLTWH(
//         size.width * 0.5 - pipeWidth / 2,
//         0,
//         pipeWidth,
//         pipeHeight,
//       ));

//     // Draw the liquid fill
//     final Path fillPath = Path()
//       ..addRect(Rect.fromLTWH(
//         size.width * 0.5 - pipeWidth / 2,
//         size.height - baseOvalHeight - pipeHeight + (pipeHeight - liquidHeight),
//         pipeWidth,
//         liquidHeight,
//       ));

//   
//     final Paint paintFill = Paint()
//       // ignore: prefer_const_constructors
//       ..shader = LinearGradient(
//         colors: const [Colors.blue, Colors.red], // Gradient colors for temperature
//         begin: Alignment.bottomCenter,
//         end: Alignment.topCenter,
//       ).createShader(Rect.fromLTWH(
//         size.width * 0.5 - pipeWidth / 2,
//         size.height - baseOvalHeight - pipeHeight,
//         pipeWidth,
//         pipeHeight + baseOvalHeight,
//       ))
//       ..style = PaintingStyle.fill;

//     // Draw the gradient fill
//     canvas.drawPath(pipePath, paintOutline);
//     canvas.drawPath(baseOvalPath, paintOutline);
//     canvas.drawPath(fillPath, paintFill);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return oldDelegate != this;
//   }
// }
