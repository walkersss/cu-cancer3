import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 2),
  ),
);

const painInputDecoration = InputDecoration(
  hintText: 'Location of Pain',
  helperText: 'Head, Lower back, Knee, Chest etc.',
  //counterText: '0 characters',
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 2),
  ),
);

const morePainInputDecoration = InputDecoration(
  hintText: 'Additional notes (Optional)',
  helperText: 'Can barely do activities etc.',
  //counterText: '0 characters',
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 2),
  ),
);

const List<String> scales = ['1', '2', '3', '4', '5'];
const List<String> locations = [
  'Head',
  'Shoulder',
  'Left Hand',
  'Right Hand',
  'Left Arm',
  'Right Arm',
  'Upper Body',
  'Lower Body',
  'Legs',
  'Feet',
];
