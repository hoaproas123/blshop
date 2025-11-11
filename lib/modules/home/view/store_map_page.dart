
import 'package:blshop/modules/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreMapPage extends GetView<HomeController> {
  const StoreMapPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoadingMap.value == true ?
      GoogleMap(
          onMapCreated: (_controller) => controller.onMapCreated(_controller),
          initialCameraPosition: CameraPosition(
            target: controller.pointPosition.value,
            zoom: 100.0,
          ),
      )
          :
        GoogleMap(
        onMapCreated: (_controller) => controller.onMapCreated(_controller),
        initialCameraPosition: CameraPosition(
          target: controller.pointPosition.value,
          zoom: 15.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('my_marker'),
            position: controller.pointPosition.value,
            infoWindow: InfoWindow(title: controller.listStoreAddressModel[controller.selectStore_index.value].name),
          ),
        },
        myLocationEnabled: true,
      );
    },);
  }
}
