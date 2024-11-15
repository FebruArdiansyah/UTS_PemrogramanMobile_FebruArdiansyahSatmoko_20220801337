import 'package:flutter/material.dart';

class HotelInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Hotel'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hotel: Liburan Nyaman di Kota Favorit!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Pesan hotel di destinasi favorit Anda dengan berbagai pilihan harga dan fasilitas, dari hotel bintang 3 hingga bintang 5. Temukan kenyamanan dan kemudahan menginap.',
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 30, thickness: 1.5),
            Text(
              'Daftar Hotel:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            HotelListItem(
              title: 'Hotel Pusat Kota',
              price: 'Rp 500.000,-/malam',
              rooms: [
                RoomInfo(roomType: 'Standard Room', availability: 'Available'),
                RoomInfo(roomType: 'Deluxe Room', availability: 'Limited'),
              ],
            ),
            SizedBox(height: 10),
            HotelListItem(
              title: 'Hotel Resort Bali',
              price: 'Rp 1.000.000,-/malam',
              rooms: [
                RoomInfo(roomType: 'Suite Room', availability: 'Available'),
                RoomInfo(roomType: 'Ocean View Room', availability: 'Sold Out'),
              ],
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

class HotelListItem extends StatelessWidget {
  final String title;
  final String price;
  final List<RoomInfo> rooms;

  HotelListItem({required this.title, required this.price, required this.rooms});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rooms.map((room) => RoomItem(room: room)).toList(),
        ),
      ],
    );
  }
}

class RoomItem extends StatelessWidget {
  final RoomInfo room;

  RoomItem({required this.room});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            room.roomType,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            room.availability,
            style: TextStyle(
              fontSize: 14,
              color: room.availability == 'Sold Out' ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class RoomInfo {
  final String roomType;
  final String availability;

  RoomInfo({required this.roomType, required this.availability});
}
