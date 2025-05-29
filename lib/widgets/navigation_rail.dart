import 'package:flutter/material.dart';

class CNavigationRail extends StatefulWidget {
  const CNavigationRail({super.key});

  @override
  State<CNavigationRail> createState() => _CNavigationRailState();
}

class _CNavigationRailState extends State<CNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: 0,
      labelType: NavigationRailLabelType.all,
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.dns),
          label: Text('Servers'),
        )
      ]
    );
  }
}
