import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.primary, colors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: colors.onSecondaryFixedVariant,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.white),
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: onItemTapped,
          selectedIndex: selectedIndex,
          backgroundColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: <Widget>[
            NavigationDestination(
              icon: Icon(Icons.attach_money, color: colors.onPrimary),
              label: 'Cotação',
            ),
            NavigationDestination(
              icon: Icon(Icons.compare_arrows, color: colors.onPrimary),
              label: 'Troca',
            ),
            NavigationDestination(
              icon: Icon(Icons.playlist_add_check, color: colors.onPrimary),
              label: 'Histórico',
            ),
          ],
        ),
      ),
    );
  }
}