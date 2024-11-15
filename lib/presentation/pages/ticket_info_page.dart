import 'package:flutter/material.dart';

class TicketInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Tiket Pesawat'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tiket Pesawat: Pilih Penerbangan Anda!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Temukan berbagai pilihan tiket pesawat untuk destinasi favorit Anda, dengan harga terjangkau dan berbagai pilihan kelas penerbangan.',
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 30, thickness: 1.5),
            Text(
              'Daftar Tiket Pesawat:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TicketListItem(title: 'Tiket Pesawat Jakarta - Bali', price: 'Rp 800.000,-'),
            TicketListItem(title: 'Tiket Pesawat Jakarta - Palembang', price: 'Rp 500.000,-'),
            TicketListItem(title: 'Tiket Pesawat Jakarta - Manado', price: 'Rp 3.000.000,-'),
            TicketListItem(title: 'Tiket Pesawat Jakarta - Papua', price: 'Rp 5.000.000,-'),
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

class TicketListItem extends StatelessWidget {
  final String title;
  final String price;

  TicketListItem({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            price,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
