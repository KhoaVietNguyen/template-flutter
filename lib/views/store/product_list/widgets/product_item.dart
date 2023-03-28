import 'package:flutter/material.dart';
import 'package:template/models/s_product.dart';
import 'package:template/utils/currency_format.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this.item, {super.key, this.onTap});

  final SProduct item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        title: Text(item.title ?? ''),
        subtitle: Text(item.price?.toVNCurrency() ?? ''),
      ),
    );
  }
}
