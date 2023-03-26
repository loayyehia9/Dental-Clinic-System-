import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dark_theme_provider.dart';
import '../screens/main_screen.dart';
import '../services/utils.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerListTile(
            title: "Dashboard",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            },
            icon: Icons.dashboard_outlined,
          ),
          SwitchListTile(
            title: const Text('Theme'),
            secondary: Icon(themeState.getDarkTheme
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            value: theme,
            onChanged: (value) {
              setState(() {
                themeState.setDarkTheme = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = theme == true ? Colors.white : Colors.black;

    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        size: 18,
      ),
      title: Text(
        title,
      ),
    );
  }
}
