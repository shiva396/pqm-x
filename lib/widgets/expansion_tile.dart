import 'package:flutter/material.dart';
import 'package:pond/widgets/dialog_box/edit_dialog_box.dart';
import 'package:pond/pond_details.dart';

class TaskBlock extends StatefulWidget {
  final String title;
  final int landSqFeet;
  final int numSystems;

  const TaskBlock({
    super.key,
    required this.title,
    required this.landSqFeet,
    required this.numSystems,
  });

  @override
  TaskBlockState createState() => TaskBlockState();
}

class TaskBlockState extends State<TaskBlock> {
  bool isExpanded = false;
  late String currentTitle;
  late int currentLandSqFeet;
  late int currentNumSystems;

  @override
  void initState() {
    super.initState();
    currentTitle = widget.title;
    currentLandSqFeet = widget.landSqFeet;
    currentNumSystems = widget.numSystems;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardDetailPage(
              title: currentTitle,
              landSqFeet: currentLandSqFeet,
              numSystems: currentNumSystems,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final newTitle = await showDialog<String>(
                        context: context,
                        builder: (context) => EditTitleDialog(initialTitle: currentTitle),
                      );

                      if (newTitle != null && newTitle.isNotEmpty) {
                        setState(() {
                          currentTitle = newTitle;
                        });
                      }
                    },
                    child: Text(
                      currentTitle,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                  ),
                ],
              ),
              if (isExpanded) ...[
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Expanded(
                      child: Text(
                        'Land Sq Feet:  $currentLandSqFeet' ,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Text(
                    //   '$currentLandSqFeet',
                    //   style: const TextStyle(
                    //     fontSize: 16,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Expanded(
                      child: Text(
                        'Number of Systems: $currentNumSystems',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Text(
                    //   '$currentNumSystems',
                    //   style: const TextStyle(
                    //     fontSize: 16,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
