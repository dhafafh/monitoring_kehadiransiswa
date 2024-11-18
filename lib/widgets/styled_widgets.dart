import 'package:flutter/material.dart';

class StyledWidgets {
  static const TextStyle listTileTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    backgroundColor: Colors.teal,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
