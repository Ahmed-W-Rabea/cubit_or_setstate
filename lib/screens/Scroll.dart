import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class ScrollTabBar extends StatefulWidget {
  const ScrollTabBar({super.key});

  @override
  State<ScrollTabBar> createState() => _ScrollTabBarState();
}

class _ScrollTabBarState extends State<ScrollTabBar>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 7,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: ButtonsTabBar(
        controller: tabController,
        unselectedBackgroundColor: Colors.white,
        borderWidth: 0.2,
        unselectedBorderColor: Colors.grey[600]!,
        radius: 100,
        onTap: (index) {
          setState(() {
            tabController!.index = index;
          });
        },
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.87, -0.49),
            end: Alignment(-0.87, 0.49),
            colors: [
              Color.fromARGB(255, 154, 190, 254),
              Color.fromARGB(255, 60, 83, 124),
            ],
          ),
        ),
        tabs: [
          Tab(
            child: SizedBox(
              width: 80,
              child: Text(
                'Healthy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      tabController!.index == 0 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Text(
                "Technology",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      tabController!.index == 1 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Text(
                "Finance",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      tabController!.index == 2 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Text(
                "Arts",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      tabController!.index == 3 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Text(
                "Sports",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      tabController!.index == 4 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Text(
                "Fashion",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      tabController!.index == 5 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 80,
              child: Text(
                "Food",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      tabController!.index == 6 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
