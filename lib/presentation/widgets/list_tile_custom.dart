import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  const ListTileCustom({
    super.key,
    required this.title,
    required this.onTap,
    required this.subTitle,
  });

  final String title;
  final String subTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(title),
      subtitle: Text(subTitle),
      onTap: onTap,
    );
  }
}
