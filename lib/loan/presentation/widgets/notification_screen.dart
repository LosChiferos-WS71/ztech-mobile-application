import 'package:flutter/material.dart';
import '../../../common/widgets/diagonal_background_painter.dart';
import '../../../common/widgets/navigation_appbar.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  int _selectedIndex = 0; // Dejarlo en 0 para que muestre la primera vista

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<NotificationItem> notifications = [
    //NotificationItem(
    //  title: 'Remember to water your :Plant1:',
    //  message: 'You have received a new message',
    //  date: 'Today',
    //),
    //NotificationItem(
    //  title: 'Remember to water your :Plant2:',
    //  message: 'Don\'t forget to attend the meeting at 3 PM',
    //  date: 'Yesterday',
    //),
    //NotificationItem(
    //  title: 'Remember to water your :Plant3:',
    //  message: 'You are invited to the company party this Friday',
    //  date: '2 days ago',
    //),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF276749),
      ),
      body: CustomPaint(
        painter: DiagonalBackgroundPainter(),

        child: notifications.isNotEmpty
            ? ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationCard(
              notification: notifications[index],
            );
          },
        )
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/empty-notification-image.png', // Agrega la imagen
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20),
              Text(
                'You don\'t have notifications',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String date;

  NotificationItem({
    required this.title,
    required this.message,
    required this.date,
  });
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          notification.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              notification.date,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        onTap: () {

        },
      ),
    );
  }
}
