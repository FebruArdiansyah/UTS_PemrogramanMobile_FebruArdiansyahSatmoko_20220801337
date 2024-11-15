import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:utspemob/presentation/pages/bus_ticket_info_page.dart';
import 'package:utspemob/presentation/pages/hotel_info_page.dart';
import 'package:utspemob/presentation/pages/ticket_info_page.dart';
import 'package:utspemob/presentation/pages/train_ticket_info_page.dart';

class HomeController extends GetxController {
  // Define the categories and recommendations as observable data
  final List<Map<String, dynamic>> categories = [
    {'title': 'Tiket Pesawat', 'icon': Icons.flight, 'color': Colors.lightBlue},
    {'title': 'Hotel', 'icon': Icons.hotel, 'color': Colors.indigo},
    {'title': 'Tiket Kereta Api', 'icon': Icons.train, 'color': Colors.orange},
    {'title': 'Tiket Bus & Travel', 'icon': Icons.directions_bus, 'color': Colors.green},
  ];

  final List<String> recommendations = [
    'Nikmati liburan Anda ke Bali dengan promo tiket pesawat diskon!',
    'Pesan hotel di pusat kota dengan fasilitas lengkap, mulai dari Rp500.000/malam.',
    'Dapatkan harga tiket kereta api terbaik untuk perjalanan jarak jauh.',
    'Jelajahi destinasi wisata dengan tiket bus & travel yang nyaman dan terjangkau.'
  ];

  // Navigation method
  void navigateToCategory(String title, BuildContext context) {
    if (title == 'Tiket Pesawat') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TicketInfoPage()),
      );
    } else if (title == 'Hotel') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HotelInfoPage()),
      );
    } else if (title == 'Tiket Kereta Api') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TrainTicketInfoPage()),
      );
    } else if (title == 'Tiket Bus & Travel') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BusTicketInfoPage()),
      );
    }
  }
}
