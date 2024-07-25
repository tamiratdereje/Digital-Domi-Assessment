import 'package:digital_domi_assessment/constants/map_configs.dart';
import 'package:digital_domi_assessment/utils/widget_to_map_icon.dart';
import 'package:digital_domi_assessment/widgets/markers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeViewController extends GetxController with StateMixin {
  final Rx<bool> isLoading = false.obs;
  late GoogleMapController mapController;
  Rx<LatLng> center = Rx<LatLng>(LatLng(MapConfig.initLat, MapConfig.initLng));
  RxSet<Marker> markers = RxSet<Marker>({});
  RxSet<Polygon> polygons = RxSet<Polygon>({});
  final String imageUrl = 'https://picsum.photos/seed/picsum/200/300';

  @override
  void onInit() {
    super.onInit();
    setCustomMarker();
  }

  Future<void> setCustomMarker() async {
    final customMarker = await CustomMarker(
            imageUrl: 'https://picsum.photos/seed/picsum/200/300')
        .toBitmapDescriptor(
      logicalSize: const Size(60, 60),
      imageSize: const Size(120, 120),
    );

    markers.add(
      Marker(
        markerId: const MarkerId('customMarker'),
        position: center.value,
        icon: customMarker,
      ),
    );
    update();
  }

  void handleTap(LatLng point) {
    debugPrint("New polygon point: ${point.toString()}");
    polygons({});
    polygons.add(
      Polygon(
        polygonId: PolygonId(point.toString()),
        points: _generatePolygonPoints(point),
        strokeColor: Colors.red,
        fillColor: Colors.yellow,
      ),
    );
    update();
  }

  List<LatLng> _generatePolygonPoints(LatLng center) {
    double offset = 0.0001;
    return [
      LatLng(center.latitude + offset, center.longitude + offset),
      LatLng(center.latitude + offset, center.longitude - offset),
      LatLng(center.latitude - offset, center.longitude - offset),
      LatLng(center.latitude - offset, center.longitude + offset),
    ];
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MapConfig.mapStyle);
    mapController = controller;
  }
}
