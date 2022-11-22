import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import '../../../controller/overview_provider.dart';

class SmallImage extends StatelessWidget {
  const SmallImage({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final OverViewProvider provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          child: Container(
      margin: const EdgeInsets.all(4),
      child: CachedNetworkImage(
        imageUrl: provider.adDetail.imageUrl[index],
        imageBuilder: (context, imageProvider) {
          return Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        placeholder: (context, url) => const SizedBox(
          height: 70,
          width: 70,
          child: CupertinoActivityIndicator(),
        ),
      ),
    )
        ),
      ),
    );
  }
}