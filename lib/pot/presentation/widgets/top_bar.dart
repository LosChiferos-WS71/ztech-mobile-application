import 'package:flutter/material.dart';
import 'package:ztech_mobile_application/pot/application/user_service.dart';
import 'package:ztech_mobile_application/pot/domain/user.dart';
import 'package:ztech_mobile_application/pot/infrastructure/user_repository.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final UserService _userService = UserService(UserRepository());

  @override
  final Size preferredSize;

  TopBar({Key? key})
      : preferredSize =
            Size.fromHeight(80.0), // Ajustado para el contenido adicional
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: _userService.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data!.profileImageUrl),
                  radius: 25.0, // Tamaño del avatar
                ),
                SizedBox(width: 10), // Espacio entre el avatar y el texto
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data!.greeting,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text(
                        '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30))
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
            backgroundColor: Color(0xFF276749),
          );
        } else if (snapshot.hasError) {
          return AppBar(
            automaticallyImplyLeading: false,
            title: Text("Error loading user data",
                style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xFF276749),
          );
        }
        return AppBar(
          automaticallyImplyLeading: false,
          title: LinearProgressIndicator(color: Colors.white),
          backgroundColor: Color(0xFF276749),
        );
      },
    );
  }
}
