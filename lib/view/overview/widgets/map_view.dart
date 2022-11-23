import 'package:deep_nucleus/constants/sizes.dart';
import 'package:deep_nucleus/controller/overview_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapView extends StatelessWidget {
  const MapView({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final OverViewProvider provider;

  @override
  Widget build(BuildContext context) {
    return Consumer<OverViewProvider>(builder: (context, controller, _) {
      return SizedBox(
        width: widthSize(context),
        height: heightSize(context) - 550,
        child: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: provider.location, zoom: 10),
          onMapCreated: (controller) => provider.addMarker(),
          markers: provider.markers.values.toSet(),
        ),
      );
    });
  }
}
