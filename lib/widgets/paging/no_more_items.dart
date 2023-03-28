part of '../common_paged_list.dart';

class NoMoreItems extends StatelessWidget {
  const NoMoreItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Icon(Icons.linear_scale),
    );
  }
}
