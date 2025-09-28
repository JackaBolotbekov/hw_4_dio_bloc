import 'package:cached_network_image/cached_network_image.dart';
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
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            )
          : const SizedBox(width: 56, height: 56),
      title: Text(item.name),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
