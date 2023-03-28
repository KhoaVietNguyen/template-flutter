import 'package:flutter/material.dart';
import 'package:template/models/s_category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.item, {super.key, this.onTap});

  final SCategory item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(item.name ?? ''),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
