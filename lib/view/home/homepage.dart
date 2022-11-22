import 'package:deep_nucleus/constants/const_strings.dart';
import 'package:deep_nucleus/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/overview_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    OverViewProvider provider = context.read<OverViewProvider>();
    return Scaffold(
      body: SizedBox(
        width: widthSize(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                provider.getAdService(id: ConstStrings.adOne);
              },
              child: const Text('Ad 1'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.getAdService(id: ConstStrings.adTwo);
              },
              child: const Text('Ad 2'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.getAdService(id: ConstStrings.adThree);
              },
              child: const Text('Ad 3'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.getAdService(id: ConstStrings.adFour);
              },
              child: const Text('Ad 4'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.getAdService(id: ConstStrings.adFive);
              },
              child: const Text('Ad 5'),
            ),
          ],
        ),
      ),
    );
  }
}
