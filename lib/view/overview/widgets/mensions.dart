
import 'package:deep_nucleus/constants/widgets.dart';
import 'package:deep_nucleus/controller/overview_provider.dart';
import 'package:flutter/material.dart';

class Mensions extends StatelessWidget {
  const Mensions({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final OverViewProvider provider;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        provider.adDetail.specialMention.length,
        (index) => Container(
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10)),
          child: contents(
              provider.adDetail.specialMention[index]),
        ),
      ),
    );
  }
}
