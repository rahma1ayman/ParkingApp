import 'package:flutter/material.dart';

import '../helper/notifications.dart';

class CustomContainer extends StatefulWidget {
  final String text;
  final Icon icon;
  final int index;
  const CustomContainer(
      {super.key, required this.text, required this.icon, required this.index});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  late bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.fill),
            border: Border.all(width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.icon,
                    const SizedBox(height: 8),
                    Text(widget.text),
                  ],
                ),
                const Spacer(),
                Switch(
                  focusColor: Colors.blueAccent,
                  activeColor: Colors.blueAccent,
                  hoverColor: Colors.white,
                  inactiveTrackColor: Colors.white,
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                      if (widget.text == 'Fire Alarm' && _switchValue) {
                        LocalNotificationService.showBasicNotification();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
