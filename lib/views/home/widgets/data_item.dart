import 'package:flutter/material.dart';
import 'package:template/models/x_data.dart';

class XDataItem extends StatelessWidget {
  const XDataItem(this.item, {super.key});

  final XData item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.name ?? '',
      ),
    );
  }
}
