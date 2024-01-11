import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../pages/marker_service.dart';

class HaritaEkrani extends StatefulWidget {
  @override
  _HaritaEkraniState createState() => _HaritaEkraniState();
}

class _HaritaEkraniState extends State<HaritaEkrani> {
  final MapController mapController = MapController();
  final MarkerServisi markerServisi = MarkerServisi();
  final TextEditingController binaAdi = TextEditingController();

  @override
  void initState() {
    super.initState();
    markerServisi.loadMarkersFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasarlı yerler'),
      ),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: LatLng(38.329579, 38.447752),
          zoom: 17.0,
          onTap: (TapPosition tapPosition, LatLng point) =>
              _handleTap(tapPosition, point),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(markers: markerServisi.markers),
        ],
      ),
    );
  }

  void _handleTap(TapPosition tapPosition, LatLng tappedPoint) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bina Bilgisi'),
          content: Column(
            children: [
              TextFormField(
                controller: binaAdi,
                decoration: InputDecoration(labelText: 'Bina Adı'),
                onChanged: (value) {
                  // Bina adını al ve bir değişkene sakla
                },
              ),
              SizedBox(height: 10),
              _buildDamageTypeDropdown(),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                markerServisi.addMarker(tappedPoint, binaAdi.text);
              },
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDamageTypeDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hasar Durumu', style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: markerServisi.selectedDamageType,
          onChanged: (String? newValue) {
            setState(() {
              markerServisi.selectedDamageType = newValue ?? '';
            });
          },
          items: <String>['', 'Hafif Hasarlı', 'Orta Hasarlı', 'Ağır Hasarlı']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bir hasar durumu seçin';
            }
            return null;
          },
        ),
      ],
    );
  }
}
