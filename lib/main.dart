import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';  // Import Google Fonts package
import 'LoginScreen.dart';
import 'OffersScreen.dart';
import 'RestaurantsScreen.dart';
import 'SubscriptionsScreen.dart';
import 'hotels.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiba Rose House',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.cairo().fontFamily,  // Use Cairo font
      ),
      home: MainScreen(),
    );
  }
}

// Main Screen
class MainScreen extends StatelessWidget {
  // Header with Image and Title
  Widget buildHeader(BuildContext context) {
    return Stack(
      children: [
        // Main image
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              // Image at the Top
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  'assets/images/oo.jpg',
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 10),
              // Title with Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 8),
                  Text(
                    "Tiba Rose House",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        // Login Button at top left
        Positioned(
          top: 20,
          left: 16,
          child: ElevatedButton(
            onPressed: () {
              // Navigate to the Login Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text("تسجيل الدخول"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
        ),
      ],
    );
  }

  // Categories (Clickable Grid)
  Widget buildCategories(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.restaurant_rounded, "label": "Food & Beverage", "screen": RestaurantsScreen()},
      {"icon": Icons.hotel, "label": "Hotels", "screen": HotelsScreen()},

      {"icon": Icons.subscriptions, "label": "Subscriptions", "screen": SubscriptionsScreen()},
      {"icon": Icons.local_offer, "label": "Offers", "screen": OffersScreen()},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3.5,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to specific screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => categories[index]["screen"],
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categories[index]["icon"], color: Colors.black54),
                SizedBox(width: 8),
                Text(
                  categories[index]["label"],
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildHeader(context),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: buildCategories(context),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
