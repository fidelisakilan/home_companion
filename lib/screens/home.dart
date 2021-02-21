import 'package:flutter/material.dart';
import 'package:home_companion/screens/barGraph.dart';
import 'package:home_companion/screens/guage.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'piechart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232F4D),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Feather.user,
            ),
            onPressed: () {},
          ),
        ],
        title: Text('DASHBOARD'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(
            height: 30,
          ),
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff232F4D),
            ),
            accountName: Text("Guest"),
            accountEmail: Text("private session"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Center(
                child: Text(
                  "G",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w100),
                ),
              ),
            ),
          ),
          ListTile(
            leading:
                Icon(MaterialCommunityIcons.account_badge_horizontal_outline),
            onTap: () {},
            title: Text("Badge"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(MaterialCommunityIcons.timetable),
            onTap: () {},
            title: Text("TimeTable"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(MaterialCommunityIcons.information_outline),
            title: Text("About Us"),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationVersion: '1.0',
                applicationIcon: FlutterLogo(),
                applicationName: 'Home Companion',
                applicationLegalese: 'Made with ❤️ Team Ecoville',
              );
            },
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(MaterialCommunityIcons.logout),
            onTap: () {},
            title: Text("Sign Out"),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      )),
      body: BodyHome(),
    );
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Positioned(
                  top: 20,
                  left: 20,
                  child: MeterCircle(
                    circleIcon: Icon(
                      Feather.wind,
                    ),
                    circleColor: Colors.yellow,
                    circlePercent: Text('60'),
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                  );
                },
                child: HomeStats(),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: MeterCircle(
                  circleIcon: Icon(
                    Feather.cloud,
                  ),
                  circleColor: Colors.green,
                  circlePercent: Text('90'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '1300 units',
                    style: TextStyle(
                      color: Color(0xfff7b295),
                    ),
                  ),
                  Text('Energy'),
                ],
              ),
              VerticalDivider(
                color: Colors.red,
                thickness: 1.0,
              ),
              Column(
                children: [
                  Text(
                    '35 C',
                    style: TextStyle(
                      color: Color(0xffbf6b82),
                    ),
                  ),
                  Text('Temperature'),
                ],
              ),
              VerticalDivider(
                color: Colors.white,
              ),
              Column(
                children: [
                  Text(
                    '150 litres',
                    style: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                  Text('Water'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: BarChartSample1()),
        ],
      ),
    );
  }
}
