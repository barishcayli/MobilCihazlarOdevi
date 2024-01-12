import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harita/pages/building_info_screen.dart';
import 'package:latlong2/latlong.dart';

class MarkerServisi {
  final List<Marker> markers = [];
  String selectedDamageType = '';

  void loadMarkersFromFirestore() {
    FirebaseFirestore.instance
        .collection('binalar')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var data = doc.data();
        var position = LatLng(data['konum'].latitude, data['konum'].longitude);
        var markerColor;
        switch (data['hasarDurumu']) {
          case 'Hafif Hasarlı':
            markerColor = Colors.green;
            break;
          case 'Orta Hasarlı':
            markerColor = Colors.yellow;
            break;
          case 'Ağır Hasarlı':
            markerColor = Colors.red;
            break;
          default:
            markerColor = Colors.grey;
        }

        var newMarker = Marker(
          width: 80.0,
          height: 80.0,
          point: position,
          builder: (ctx) => GestureDetector(
            onTap: () {
              Navigator.push(
                ctx,
                MaterialPageRoute(
                  builder: (ctx) => BinaBilgiEkrani(
                    binaAdi: data['binaAdi'],
                    hasarDurumu: data['hasarDurumu'],
                  ),
                ),
              );
            },
            child: Icon(
              Icons.location_on,
              color: markerColor,
              size: 40.0,
            ),
          ),
        );

        markers.add(newMarker);
      });
    });
  }

  void addMarker(LatLng position, String binaAdi) {
    String selectedType =
        selectedDamageType.isNotEmpty ? selectedDamageType : 'Bilinmiyor';

    Color markerColor;
    switch (selectedType) {
      case 'Hafif Hasarlı':
        markerColor = Colors.green;
        break;
      case 'Orta Hasarlı':
        markerColor = Colors.yellow;
        break;
      case 'Ağır Hasarlı':
        markerColor = Colors.red;
        break;
      default:
        markerColor = Colors.grey;
    }

    var newMarker = Marker(
      width: 80.0,
      height: 80.0,
      point: position,
      builder: (ctx) => GestureDetector(
        onTap: () {
          Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (ctx) => BinaBilgiEkrani(
                binaAdi: binaAdi,
                hasarDurumu: selectedType,
              ),
            ),
          );
        },
        child: Icon(
          Icons.location_on,
          color: markerColor,
          size: 40.0,
        ),
      ),
    );

    markers.add(newMarker);

    FirebaseFirestore.instance.collection('binalar').add({
      'binaAdi': binaAdi,
      'hasarDurumu': selectedType,
      'konum': GeoPoint(position.latitude, position.longitude),
    });

   
   
  }
}
