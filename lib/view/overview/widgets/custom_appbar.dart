import 'package:cached_network_image/cached_network_image.dart';
import 'package:deep_nucleus/constants/sizes.dart';
import 'package:deep_nucleus/controller/overview_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<OverViewProvider, String>(
      selector: (context, obj) => obj.appbarImage,
      builder: (context, image, _) {
        return CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Container(
            width: double.infinity,
            height: heightSize(context) - 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: heightSize(context) * 0.05),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back)),
                  ],
                ),
              ],
            ),
          ),
          placeholder: (context, url) => const CupertinoActivityIndicator(),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        );
      },
    );
  }
}
