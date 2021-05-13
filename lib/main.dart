import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  List <LatLng> listLoc=[
    LatLng(51.5, -0.09),
    LatLng(51.4, -0.09),
    LatLng(51.3, -0.09),
  ];

  MyApp() ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: customMap()));
  }
  Widget customMap(){
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
        ),
        MarkerLayerOptions(
          markers: [
            for (LatLng each in listLoc)...[

              Marker(
                width: 80.0,
                height: 80.0,
                point: each,
                builder: (ctx) =>
                    Container(
                      child:Icon(Icons.location_on),
                    ),
              ),
            ]

          ],
        ),
      ],
    );
  }
}