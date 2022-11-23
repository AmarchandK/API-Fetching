import 'package:deep_nucleus/constants/sizes.dart';
import 'package:deep_nucleus/constants/widgets.dart';
import 'package:deep_nucleus/view/overview/widgets/buttons.dart';
import 'package:deep_nucleus/view/overview/widgets/custom_appbar.dart';
import 'package:deep_nucleus/view/overview/widgets/map_view.dart';
import 'package:deep_nucleus/view/overview/widgets/mensions.dart';
import 'package:deep_nucleus/view/overview/widgets/profile.dart';
import 'package:deep_nucleus/view/overview/widgets/selectable_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/overview_provider.dart';

class OverView extends StatelessWidget {
  const OverView({super.key});

  @override
  Widget build(BuildContext context) {
    OverViewProvider provider = context.read<OverViewProvider>();

    return Scaffold(
      body: Stack(
        children: [
          const CustomAppBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: heightSize(context) - 450,
              padding: const EdgeInsets.all(10),
              width: widthSize(context),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.grey[800]!, width: 2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SmallImage(provider: provider),
                    customDivider,
                    SizedBox(
                      height: heightSize(context) - 550,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Specs(
                                    tittle: 'Category',
                                    content: provider.adDetail.subCategory),
                                Specs(
                                    tittle: 'Status Now',
                                    content: provider.adDetail.adStatus),
                                Specs(
                                    tittle: 'Ad Type',
                                    content: provider.adDetail.adType)
                              ],
                            ),
                            customDivider,
                            contentText('Special Mensions'),
                            h10,
                            Mensions(provider: provider),
                            customDivider,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  provider.adDetail.price == 0
                                      ? 'Price Not Available !'
                                      : '₹ ${provider.adDetail.price}',
                                  style: const TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.yellowAccent),
                                ),
                                twoColorText('Posted on ', provider.adDate)
                              ],
                            ),
                            headingText(provider.adDetail.title.toUpperCase()),
                            contentText(provider.adDetail.description),
                            headingText('Map'),
                            MapView(provider: provider),
                            headingText('From'),
                            ProfileSection(provider: provider),
                            const Buttons(),
                            h20,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
