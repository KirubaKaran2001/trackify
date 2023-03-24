// ignore_for_file: library_private_types_in_public_api

import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  List<Step> stepList() => [
        const Step(
            title: Text('Account'),
            content: Center(
              child: Text('Account'),
            )),
        const Step(
            title: Text('Address'),
            content: Center(
              child: Text('Address'),
            )),
        const Step(
            title: Text('Confirm'),
            content: Center(
              child: Text('Confirm'),
            ))
      ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  CupertinoIcons.arrow_left,
                  size: 24.0,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.4),
                const Text(
                  'Tracking',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff16797a),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'RU 653 567 789',
                            style: TextStyle(
                              color: Color(0xffe1f3f5),
                              // fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.bookmark,
                            color: Color(0xffe1f3f5),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 2,
                      color: Color(0xff56b1b1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'From \n krasnoyarsk \n Russia ',
                            style: TextStyle(
                              color: Color(0xffaceaed),
                            ),
                          ),
                          Icon(
                            CupertinoIcons.arrow_right,
                            color: Color(0xffe1f3f5),
                          ),
                          Text(
                            'to \n Riga Latvia',
                            style: TextStyle(
                              color: Color(0xffaceaed),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Parcel Status',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildStepper(StepperType.vertical)
              ],
            ),
          ),
        ],
      ),
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    return CupertinoStepper(
      type: type,
      steps: [
        _buildStep(
          title: const Text(
            'Parcel Delivered',
            style: TextStyle(color: Color.fromARGB(255, 16, 15, 15)),
          ),
          subtitle: const Text('Riga ,Latvia'),
        ),
        _buildStep(
          title: const Text(
            'Parcel on The Way',
            style: TextStyle(color: Color.fromARGB(255, 16, 15, 15)),
          ),
          subtitle: const Text('Riga ,Latvia'),
        ),
        _buildStep(
          title: const Text(
            'Arrived at Destination',
            style: TextStyle(color: Color.fromARGB(255, 16, 15, 15)),
          ),
          subtitle: const Text('Riga ,Latvia'),
        ),
        _buildStep(
          title: const Text(
            'Sent from Krasnoyarsk',
            style: TextStyle(color: Color.fromARGB(255, 16, 15, 15)),
          ),
          subtitle: const Text('Krasnoyarsk ,Russia'),
        ),
        _buildStep(
          title: const Text(
            'parcel picked up',
            style: TextStyle(color: Color.fromARGB(255, 16, 15, 15)),
          ),
          subtitle: const Text('Krasnoyarsk ,Russia'),
        ),
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    required Widget subtitle,
  }) {
    return Step(
      title: title,
      subtitle: subtitle,
      state: StepState.disabled,
      content: const Text(''),
    );
  }
}
