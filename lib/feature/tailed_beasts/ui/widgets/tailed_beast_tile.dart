import 'package:flutter/material.dart';
import '../../model/tailed_beast.dart';

class TailedBeastTile extends StatelessWidget {
  const TailedBeastTile({super.key, required this.item});

  final TailedBeast item;

  @override
  Widget build(BuildContext context) {
    final imageUrl = item.images.isNotEmpty ? item.images.first : null;

    return ListTile(
      leading: imageUrl != null
          ? Image.network(
        imageUrl,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      )
          : const SizedBox(width: 56, height: 56),
      title: Text(item.name),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
