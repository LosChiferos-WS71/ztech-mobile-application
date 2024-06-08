import 'package:flutter/material.dart';

class RecommendationComponent extends StatelessWidget {
  const RecommendationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("I recommend:",
              style: TextStyle(
                  fontSize: screenWidth * 0.05, // Adjust font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          SizedBox(height: 10),
          recommendationItem(
              Icons.notifications_active,
              "Control the temperature, humidity and amount of sunlight in your plants.",
              Colors.red, screenWidth),
          recommendationItem(
              Icons.warning,
              "At 3pm you have to remove your plant from the sun.",
              Colors.orange, screenWidth),
          recommendationItem(
              Icons.info,
              "Remember to buy organic fertilizer for your plant and save the eggshells to provide calcium to them.",
              Colors.green, screenWidth),
        ],
      ),
    );
  }

  Widget recommendationItem(IconData icon, String text, Color iconColor, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: screenWidth * 0.08), // Adjust icon size
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: screenWidth * 0.04, // Adjust text size
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
