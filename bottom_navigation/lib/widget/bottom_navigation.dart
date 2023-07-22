import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

// Importing the file that defines the tab items.
import '../constants/navbar_items_list.dart';

// Importing the screen widget
import '../views/home.dart';
import '../views/notification.dart';
import '../views/report.dart';
import '../views/search.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  // This stores the index of the currently selected tab.
  int selectedPos = 0; 
  // The height of the circular navigation bar.
  double bottomNavBarHeight = 60; 

  // Controller for the circular bottom navigation.
  late CircularBottomNavigationController navigationController; 

  // Initializing the navigation controller with the selected position.
  @override
  void initState() {
    super.initState();
    navigationController = CircularBottomNavigationController(selectedPos); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            // The main content area that displays the selected screen widget.
            child: _bodyContainer(), 
          ),
          // The circular bottom navigation bar.
          Align(alignment: Alignment.bottomCenter, child: _bottomNav()) 
        ],
      ),
    );
  }

  // Switches between different screen widgets based on the selected tab.
  Widget _bodyContainer() {
    Widget screenWidget;
    switch (selectedPos) {
      case 0:
        // Display the Home screen widget when selectedPos is 0.
        screenWidget = const HomeScreen(); 
        break;
      case 1:
        // Display the Search screen widget when selectedPos is 1.
        screenWidget = const SearchScreen(); 
        break;
      case 2:
        // Display the Reports screen widget when selectedPos is 2.
        screenWidget = const ReportsScreen(); 
        break;
      case 3:
        // Display the Notifications screen widget when selectedPos is 3.
        screenWidget = const NotificationsScreen(); 
        break;
      default:
        // If selectedPos doesn't match any case, display the Home screen widget by default.
        screenWidget = const HomeScreen(); 
        break;
    }

    return GestureDetector(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: screenWidget, // The selected screen widget is displayed here.
      ),
      onTap: () {
        // This function is called when the content area is tapped.
        // It handles the navigation when tapping the content area.
        if (navigationController.value == tabItems.length - 1) {
          // If the current tab is the last one, reset to the first tab.
          navigationController.value = 0;
        } else {
          // Otherwise, move to the next tab.
          navigationController.value = navigationController.value! + 1;
        }
      },
    );
  }

  // Creates the circular bottom navigation bar widget.
  Widget _bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: navigationController, 
      // Pass the navigation controller to the circular bottom navigation widget.
      selectedPos: selectedPos, 
      // Pass the selected position to highlight the current tab.
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        // This function is called when a new tab is selected.
        setState(() {
          // Update the selectedPos to reflect the new tab index.
          this.selectedPos = selectedPos ?? 0; 
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose the navigation controller when the widget is removed.
    navigationController.dispose(); 
  }
}
