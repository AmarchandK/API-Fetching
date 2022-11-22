import 'package:deep_nucleus/constants/sizes.dart';
import 'package:deep_nucleus/constants/widgets.dart';
import 'package:deep_nucleus/view/overview/widgets/custom_appbar.dart';
import 'package:deep_nucleus/view/overview/widgets/selectable_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../controller/overview_provider.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    OverViewProvider provider = context.read<OverViewProvider>();

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: widthSize(context),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.adDetail.imageUrl.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            provider.changeAppbarImage(
                              image: provider.adDetail.imageUrl[index],
                            );
                          },
                          child: AppBarSmallImage(
                            image: provider.adDetail.imageUrl[index],
                          ),
                        ),
                      ),
                    ),
                    customDivider,
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
                    subTittleText('Special Mensions'),
                    h10,
                    Wrap(
                      children: List.generate(
                        provider.adDetail.specialMention.length,
                        (index) => Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child:
                              contents(provider.adDetail.specialMention[index]),
                        ),
                      ),
                    ),
                    customDivider,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹ ${provider.adDetail.price}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700]),
                        ),
                        twoColorText('Posted on ', provider.adDate)
                      ],
                    ),
                    h10,
                    headingText(provider.adDetail.title),
                    h20,
                    subTittleText(provider.adDetail.description),
                    h10,
                    headingText('Map'),
                    Container(
                      width: widthSize(context),
                      height: heightSize(context) - 480,
                      child: GoogleMap(
                          initialCameraPosition:
                              CameraPosition(target: provider.location)),
                    ),
                    h10,
                    headingText('From'),
                    ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(provider.ownersDetail.profileUrl)),
                      title: Text(provider.ownersDetail.name),
                      subtitle: Text('Member since ${provider.userDate}'),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.forward)),
                    ),
                    h20
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
