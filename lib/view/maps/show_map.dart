// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, unused_local_variable, prefer_const_constructors_in_immutables, avoid_print

import 'dart:async';

import 'package:coffi_shop/controll/coffie_shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class ShowMap extends StatelessWidget {
  ShowMap(this.cubit,
      {this.latit = 30.033333,
      this.longit = 31.233334,
      this.zoom = 14.4746,
      this.mapType = MapType.normal,
      super.key});
  final double latit;
  final double longit;
  final double zoom;
  final MapType mapType;
  final CoffieShopCubit cubit;
  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController>? _controllerMap =
        Completer<GoogleMapController>();

    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(latit, longit),
      zoom: zoom,
    );
    List<Marker> markrs = [
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(cubit.currentLatitude, cubit.currentLngitude),
      ),
    ];

    return GoogleMap(
      onTap: (LatLng latLng) async {
        List<Placemark> placemarks =
            await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
        cubit.getCurrentLocation(
            latLng.latitude, latLng.longitude, placemarks[0].street);
        
      },
      markers: markrs.toSet(),
      mapType: mapType,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controllerMap.complete(controller);
      },
    );
  }
}
