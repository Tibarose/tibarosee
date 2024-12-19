import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HotelsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> hotels = [
    {
      "name": "فندق جراند تيباروز",
      "photos": [
        "assets/images/t1.jpg",
        "assets/images/t2.jpg",
        "assets/images/t3.jpg",
        "assets/images/t3.jpg",
      ],
      "price": "500 جنيه/الليلة",
      "location": "https://www.google.com/maps?q=30.0444,31.2357",
      "booking": "https://example.com/booking1",
    },
    {
      "name": "فندق تيباروز",
      "photos": [
        "assets/images/b1.jpg",
        "assets/images/b1.jpg",
        "assets/images/b1.jpg",
      ],
      "price": "600 جنيه/الليلة",
      "location": "https://www.google.com/maps?q=30.0355,31.2350",
      "booking": "https://example.com/booking2",
    },
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Hotel 1 and Hotel 2
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Hotels",
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            bottom: TabBar(
              indicatorColor: Colors.blue,
              tabs: [
                Tab(
                  text: "فندق جراند تيباروز",
                  icon: Icon(Icons.hotel),
                ),
                Tab(
                  text: "فندق تيباروز",
                  icon: Icon(Icons.hotel),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Hotel 1 Tab
              _buildHotelTab(0),

              // Hotel 2 Tab
              _buildHotelTab(1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHotelTab(int index) {
    final hotel = hotels[index];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade200, Colors.blue.shade400],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 6,
                margin: EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.blue.shade50],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          hotel["name"],
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        CarouselSlider(
                          items: hotel["photos"].map<Widget>((photo) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                photo,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            );
                          }).toList(),
                          options: CarouselOptions(
                            height: 250, // Increased height for larger carousel images
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9, // Increased the fraction to show more of the image
                            aspectRatio: 16 / 9,
                            enableInfiniteScroll: true,
                            autoPlayInterval: Duration(seconds: 3),
                          ),
                        ),

                        SizedBox(height: 8),
                        Text(
                          "السعر: ${hotel['price']}",
                          style: GoogleFonts.cairo(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                _launchURL(hotel["location"]);
                              },
                              icon: Icon(Icons.location_on, color: Colors.black),
                              label: Text(
                                "موقع الفندق",
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                _launchURL(hotel["booking"]);
                              },
                              icon: Icon(Icons.book_online, color: Colors.black),
                              label: Text(
                                "احجز الآن",
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
