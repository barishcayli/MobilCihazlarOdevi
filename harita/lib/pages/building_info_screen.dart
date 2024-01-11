import 'package:flutter/material.dart';

class BinaBilgiEkrani extends StatelessWidget {
  final String binaAdi;
  final String hasarDurumu;

  const BinaBilgiEkrani({
    Key? key,
    required this.binaAdi,
    required this.hasarDurumu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bina Bilgisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bina Adı: $binaAdi',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Hasar Durumu: $hasarDurumu',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
