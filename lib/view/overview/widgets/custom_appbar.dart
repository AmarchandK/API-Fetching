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
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        CupertinoIcons.back,
                        size: 35,
                      )),
                ),
              )),
          placeholder: (context, url) => SizedBox(
            height: heightSize(context) - 400,
            child: const CupertinoActivityIndicator(),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        );
      },
    );
  }
}
