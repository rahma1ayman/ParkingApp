import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  final List<bool> _switchValues = [false, false, false, false];
  List<String> switchesName = [
    'ُEntry Gate',
    'Exit Gate',
    'Fire Alarm',
    'Water'
  ];
  List<Widget> icons = [
    const Icon(Icons.door_front_door_rounded),
    const Icon(Icons.door_back_door_rounded),
    const Icon(Icons.fireplace_rounded),
    const Icon(Icons.water_drop_outlined)
  ];
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return GridView.builder(
      padding: const EdgeInsets.only(top: 100, left: 8, right: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 60.0,
        childAspectRatio: 1.0, // Square items
      ),
      itemCount: _switchValues.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icons[index],
              Text(switchesName[index],
                  style: const TextStyle(color: Colors.black)),
              Switch(
                focusColor: Colors.blue,
                activeColor: Colors.blue,
                value: _switchValues[index],
                onChanged: (value) {
                  setState(() {
                    _switchValues[index] = value;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
