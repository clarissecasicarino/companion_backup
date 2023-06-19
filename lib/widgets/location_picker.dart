import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({Key? key}) : super(key: key);

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  Color fontColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          fontColor = Colors.black;
        });
      },
      onTapDown: (_) {
        setState(() {
          fontColor = const Color(0xFF0030FF); //
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const HeroIcon(
            HeroIcons.mapPin,
            color: Color(0xFF0030FF),
          ),
          const SizedBox(width: 1),
          SizedBox(
            width: 180,
            child: Text(
              "Hypermarket Mall of Asia something more",
              maxLines: 1,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: fontColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  fontFamily: 'HenrySans'),
            ),
          ),
        ],
      ),
    );
  }
}
