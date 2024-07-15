import 'package:flutter/material.dart';

import '../widgets/Custom_control_container.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Control Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomContainer(
            text: 'Entry Gate',
            icon: Icon(Icons.door_front_door_rounded),
            index: 0,
          ),
          CustomContainer(
            text: 'Fire Alarm',
            icon: Icon(Icons.fireplace_rounded),
            index: 1,
          ),
          CustomContainer(
            text: 'Water',
            icon: Icon(Icons.water_drop_outlined),
            index: 2,
          ),
        ],
      ),
    );
  }
}
