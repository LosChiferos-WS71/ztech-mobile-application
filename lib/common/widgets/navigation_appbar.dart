import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeName = ModalRoute.of(context)?.settings.name;
    final index = _getIndexFromRouteName(routeName);
    if (index != null && index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  int? _getIndexFromRouteName(String? routeName) {
    final routes = {
      'flowerpots': 0,
      'addPot': 1,
      'home': 2,
      'profile': 3,
    };
    return routes[routeName];
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
        widget.onDestinationSelected(index);
        _navigateToScreen(index, context);
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.local_florist), label: 'Flowerpots'),
        NavigationDestination(icon: Icon(Icons.add), label: 'Add'),
        NavigationDestination(icon: Icon(Icons.nature), label: 'Plants'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  void _navigateToScreen(int index, BuildContext context) {
    final routes = ['flowerpots', 'addPot', 'home', 'profile'];
    if (ModalRoute.of(context)?.settings.name != routes[index]) {
      Navigator.pushNamed(context, routes[index]);
    }
  }
}
