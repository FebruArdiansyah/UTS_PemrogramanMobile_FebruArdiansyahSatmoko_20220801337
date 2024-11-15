import 'package:flutter/material.dart';

class TrainTicketInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Tiket Kereta Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tiket Kereta Api: Perjalanan Nyaman!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Nikmati perjalanan kereta api yang nyaman dan aman menuju berbagai destinasi di seluruh Indonesia.',
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 30, thickness: 1.5),
            Text(
              'Daftar Tiket Kereta Api:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TrainTicketListItem(
              title: 'Jakarta - Bandung',
              price: 'Rp 150.000,-',
              routes: ['Stasiun Gambir', 'Stasiun Bekasi', 'Stasiun Bandung'],
            ),
            SizedBox(height: 10),
            TrainTicketListItem(
              title: 'Surabaya - Yogyakarta',
              price: 'Rp 200.000,-',
              routes: ['Stasiun Gubeng', 'Stasiun Solo Balapan', 'Stasiun Yogyakarta'],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrainTicketListItem extends StatelessWidget {
  final String title;
  final String price;
  final List<String> routes;

  TrainTicketListItem({required this.title, required this.price, required this.routes});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 10),
            Text(
              'Rute:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: routes.map((route) => Text('- $route', style: TextStyle(fontSize: 14))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
