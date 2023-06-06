import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/utils/color_utils.dart';


void main() {
  test('hexStringToColor should convert a hexadecimal color string to a Color object', () {
    // Arrange
    final hexColor = '#FF0000';
    final expectedColor = Color(0xFFFF0000);

    // Act
    final result = hexStringToColor(hexColor);

    // Assert
    expect(result, equals(expectedColor));
  });
}
