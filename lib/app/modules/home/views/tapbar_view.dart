import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:totask/app/data/utils/assets.dart';
import 'package:totask/app/modules/home/views/home_view.dart';

class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 6,
          child: Column(
            children: [
              ButtonsTabBar(
                backgroundColor: Colors.grey,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                unselectedBackgroundColor: Colors.white,
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(
                    color: Colors.blue[600], fontWeight: FontWeight.bold),
                borderWidth: 0,
                unselectedBorderColor: Colors.grey,
                radius: 100,
                tabs: [
                  Tab(
                    text: "car",
                  ),
                  Tab(
                    text: "transit",
                  ),
                  Tab(
                    text: "4",
                  ),
                  Tab(
                    text:"oi",
                  ),
                  Tab(
                    text: "hello",
                  ),
                  Tab(
                    text: "4",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    HomeView(),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                    Center(
                      child: Icon(Icons.directions_car),
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
