import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RestaurantsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      "name": "مطعم بيونيا",
      "photos": [
        "assets/images/b1.jpg",
        "assets/images/b2.jpg",
        "assets/images/b3.jpg",
        "assets/images/b4.jpg",
        "assets/images/b5.jpg",
        "assets/images/b6.jpg",
      ],
      "location": "https://www.google.com/maps?q=30.0444,31.2357",
      "menu": "https://example.com/menu1.jpg",
    },
    {
      "name": "مطعم marvel",
      "photos": [
        "assets/images/m1.jpg",
        "assets/images/m2.jpg",
      ],
      "location": "https://www.google.com/maps?q=30.0330,31.2330",
      "menu": "https://example.com/menu2.jpg",
    },
    {
      "name": "مطعم جاردينيا",
      "photos": [
        "assets/images/g1.jpg",
        "assets/images/g2.jpg",
        "assets/images/g4.jpg",
        "assets/images/3.jpg",
        "assets/images/g5.jpg",
      ],
      "location": "https://www.google.com/maps?q=30.0330,31.2330",
      "menu": "https://example.com/menu2.jpg",
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
      length: 2, // Two tabs: Food and Beverage
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Food & Beverage",
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
              indicatorColor: Colors.purple,
              tabs: [
                Tab(
                  text: "الطعام",
                  icon: Icon(Icons.restaurant),

                ),
                Tab(
                  text: "المشروبات",
                  icon: Icon(Icons.local_cafe),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Food Tab
              _buildFoodTab(),

              // Beverage Tab (Placeholder content for now)
              _buildBeverageTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodTab() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade200, Colors.deepOrange.shade400],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(restaurants.length, (index) {
              final restaurant = restaurants[index];
              return Card(
                elevation: 6,
                margin: EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.orange.shade50],
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
                          restaurant["name"],
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        CarouselSlider(
                          items: restaurant["photos"].map<Widget>((photo) {
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
                            height: 160,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.85,
                            aspectRatio: 16 / 9,
                            enableInfiniteScroll: true,
                            autoPlayInterval: Duration(seconds: 3),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                _launchURL(restaurant["location"]);
                              },
                              icon: Icon(Icons.location_on, color: Colors.black),
                              label: Text(
                                "موقع المطعم",
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
                                _launchURL(restaurant["menu"]);
                              },
                              icon: Icon(Icons.menu_book, color: Colors.black),
                              label: Text(
                                "قائمة الطعام",
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
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildBeverageTab() {
    return Center(
      child: Text(
        "صفحة المشروبات قيد الإنشاء",
        style: GoogleFonts.cairo(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}

