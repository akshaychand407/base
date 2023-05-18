import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/size_config.dart';
import 'app_colors.dart';

TextStyle ktsLargeBoldTextStyle = GoogleFonts.poppins(
  fontSize: 4 * SizeConfig.textMultiplier!,
  fontWeight: FontWeight.w900,
);
TextStyle ktsNormalTextStyle = GoogleFonts.poppins(
  fontSize: 1.5 * SizeConfig.textMultiplier!,
);
TextStyle ktsWhiteTextStyle = GoogleFonts.poppins(color: kcWhite);
TextStyle alertTextStyle = GoogleFonts.poppins(
    color: Colors.white, fontSize: 1.4 * SizeConfig.textMultiplier!);
TextStyle ktsAlertButtonTextStyle = GoogleFonts.poppins(
  fontSize: 1.5 * SizeConfig.textMultiplier!,
  color: kcWhite,
);
