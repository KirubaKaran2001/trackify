// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackify/constants/card_constants.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 80,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              color: Color(0xff16797a),
              CupertinoIcons.house_alt_fill,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bookmark_fill,
              color: Color(0xff16797a),
            ),
            label: 'bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bell,
              color: Color(0xff16797a),
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.settings,
              color: Color(0xff16797a),
            ),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        debugPrint(MediaQuery.of(context).size.width.toString());

        return CupertinoPageScaffold(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2,
                    sigmaY: 2,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff16797a),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Color(0xff69c6c9),
                                child: Icon(
                                  Icons.qr_code_outlined,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              const Text(
                                'Your Location ',
                                style: TextStyle(color: Color(0xff42c5c9)),
                              ),
                              CircleAvatar(
                                backgroundColor: const Color(0xff69c6c8),
                                child: Image.asset(
                                  'assets/icon.png',
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            ' Riga Lativa',
                            style: TextStyle(color: Color(0xffc5ffff)),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'Track Your Parcels',
                            style: TextStyle(
                                color: Color(0xFFedffff),
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const Text(
                            'Please enter your tracking number \n or scan Qr',
                            style: TextStyle(
                              color: Color(0xff95edf1),
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BackdropFilter(
                                filter: ImageFilter.blur(),
                                child: SizedBox(
                                  width: (MediaQuery.of(context).size.width >
                                          500)
                                      ? MediaQuery.of(context).size.width * 0.9
                                      : MediaQuery.of(context).size.width * 0.7,
                                  child: CupertinoTextField(
                                    prefix: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Enter Track Number',
                                        style:
                                            TextStyle(color: Color(0xffebffff)),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff69c6c7),
                                      border: Border.all(
                                        color: const Color(0xff69c6c7),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              const CircleAvatar(
                                minRadius: 30,
                                backgroundColor: Color(0xff68c6c9),
                                child: Icon(
                                  CupertinoIcons.qrcode_viewfinder,
                                  color: Color(0xffebffff),
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'My service',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 15,
                              color: const Color.fromARGB(0, 0, 0, 0)
                                  .withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CardWidget(
                            icon: Icons.calculate,
                            text: 'Calculate your Shipment',
                            callback: () {},
                          ),
                          CardWidget(
                            icon: Icons.calculate,
                            text: 'Pay for Parcel',
                            callback: () {},
                          ),
                          CardWidget(
                            icon: Icons.track_changes_rounded,
                            text: 'Track your Parcels',
                            callback: () {
                              Navigator.pushNamed(context, '/tracking');
                            },
                          ),
                          CardWidget(
                            icon: Icons.workspaces_outlined,
                            text: 'Shipment throughout the world',
                            callback: () {},
                          ),
                          CardWidget(
                            icon: Icons.timelapse,
                            text: 'Reaches before you Think',
                            callback: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
