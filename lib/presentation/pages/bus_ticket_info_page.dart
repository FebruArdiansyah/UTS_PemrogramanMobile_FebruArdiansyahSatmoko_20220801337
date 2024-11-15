import 'package:flutter/material.dart';

class BusTicketInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Tiket Bus & Travel'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tiket Bus & Travel: Perjalanan Mudik atau Liburan!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Pesan tiket bus dan travel dengan rute perjalanan ke berbagai kota. Nikmati kenyamanan dan harga terjangkau.',
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 30, thickness: 1.5),
            Text(
              'Daftar Tiket Bus & Travel:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            BusTicketListItem(
              title: 'Jakarta - Solo',
              price: 'Rp 100.000,-',
              schedule: [
                ScheduleInfo(departureTime: '08:00', arrivalTime: '14:00'),
                ScheduleInfo(departureTime: '18:00', arrivalTime: '00:00'),
              ],
            ),
            SizedBox(height: 10),
            BusTicketListItem(
              title: 'Jakarta - Yogyakarta (Travel)',
              price: 'Rp 200.000,-',
              schedule: [
                ScheduleInfo(departureTime: '07:00', arrivalTime: '15:00'),
                ScheduleInfo(departureTime: '19:00', arrivalTime: '03:00'),
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

class BusTicketListItem extends StatelessWidget {
  final String title;
  final String price;
  final List<ScheduleInfo> schedule;

  BusTicketListItem({required this.title, required this.price, required this.schedule});

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
              'Jadwal Keberangkatan:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: schedule
                  .map((schedule) => Text(
                        '- ${schedule.departureTime} - ${schedule.arrivalTime}',
                        style: TextStyle(fontSize: 14),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleInfo {
  final String departureTime;
  final String arrivalTime;

  ScheduleInfo({required this.departureTime, required this.arrivalTime});
}
