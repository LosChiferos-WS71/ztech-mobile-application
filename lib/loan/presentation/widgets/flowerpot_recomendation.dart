import 'package:flutter/material.dart';

class RecommendationComponent extends StatelessWidget {
  const RecommendationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("I recommend:",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const SizedBox(height: 10),
          recommendationItem(
              Icons.notifications_active,
              "Control the temperature, humidity and amount of sunlight in your plants.",
              Colors.red),
          recommendationItem(
              Icons.warning,
              "At 3pm you have to remove your plant2 from the sun.",
              Colors.orange),
          recommendationItem(
              Icons.info,
              "Remember to buy organic fertilizer for your plant and save the eggshells to provide calcium to them.",
              Colors.green),
        ],
      ),
    );
  }

  Widget recommendationItem(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 40),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
