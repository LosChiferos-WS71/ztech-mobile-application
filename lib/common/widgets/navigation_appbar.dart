import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        // Notificar al widget padre
        onDestinationSelected(index);
        // Navegar a la nueva pantalla
        _navigateToScreen(index, context);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.local_florist),
          label: 'Flowerpots',
        ),
        NavigationDestination(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        NavigationDestination(
          icon: Icon(Icons.nature),
          label: 'Plants',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  void _navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, 'home');
        break;
      case 1:
        Navigator.pushNamed(context, 'choose-plant');
        break;
      case 2:
        Navigator.pushNamed(context, 'home');
        break;
      case 3:
        Navigator.pushNamed(context, 'home');
        break;
      default:
        Navigator.pushNamed(context, '/');
    }
  }
}
