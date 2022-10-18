import 'package:driver/statics/colors.dart';
import 'package:flutter/material.dart';

TextStyle smallLight() => const TextStyle(
    color: CustomTheme.white, fontSize: 15, fontWeight: FontWeight.bold);
TextStyle mediumLight() => const TextStyle(
    color: CustomTheme.white, fontSize: 21, fontWeight: FontWeight.bold);
TextStyle bigLight() => const TextStyle(
    color: CustomTheme.white, fontSize: 27, fontWeight: FontWeight.bold);

TextStyle smallGrey() => const TextStyle(color: CustomTheme.grey, fontSize: 15);
TextStyle mediumGrey() =>
    const TextStyle(color: CustomTheme.grey, fontSize: 21);
TextStyle bigGrey() => const TextStyle(color: CustomTheme.grey, fontSize: 27);

TextStyle smallDark() =>
    const TextStyle(color: CustomTheme.black, fontSize: 15);
TextStyle mediumDark() => const TextStyle(
    color: CustomTheme.black, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle bigDark() => const TextStyle(
    color: CustomTheme.black, fontSize: 27, fontWeight: FontWeight.bold);
