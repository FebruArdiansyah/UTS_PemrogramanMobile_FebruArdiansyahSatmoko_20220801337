import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utspemob/presentation/controller/home_controller.dart';

void main() {
  runApp(TravelAgentApp());
}

class TravelAgentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  // Use GetMaterialApp from GetX package
      title: 'Agen Travel',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());  // Use GetX to inject the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agen Travel'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kategori
              Text(
                'Kategori',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GridView.builder(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: homeController.categories.length,
                itemBuilder: (context, index) {
                  final category = homeController.categories[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate using the controller
                      homeController.navigateToCategory(category['title'], context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: category['color'],
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category['icon'], color: Colors.white, size: 36),
                          SizedBox(height: 10),
                          Text(
                            category['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              
              // Rekomendasi Section (improved layout)
              Text(
                'Informasi untuk Anda',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: homeController.recommendations.map((rec) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          rec,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
