import 'package:flutter/material.dart';

class XItem extends StatelessWidget {
  const XItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: Icon(Icons.notes_sharp)),
      ),
    );
  }
}
