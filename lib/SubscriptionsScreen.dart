import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';  // Import the Google Fonts package

class SubscriptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,  // Set the entire screen to RTL
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "الاشتراكات",
            style: GoogleFonts.cairo(),  // Apply Cairo font to the title
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Text(
            "الاشتراكات - قيد التطوير",
            style: GoogleFonts.cairo(  // Apply Cairo font to the body text
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
