import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color greenCA = const Color(0xff219653);
Color greenCB = const Color(0xff27AE60);
Color greenCC = const Color(0xff6FCF97);
Color greyC = const Color(0xff828282);
Color blackC = Colors.black;
Color whiteC = Colors.white;

FontWeight bold = FontWeight.w700;
FontWeight semiBold = FontWeight.w600;
FontWeight light = FontWeight.w300;
FontWeight medium = FontWeight.w500;

TextStyle greenTextStyle = GoogleFonts.poppins(
  color: greenCA,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: greyC,
);
TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackC,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteC,
);

TextStyle noStyle = GoogleFonts.poppins();

BoxDecoration cardShadow() {
  return BoxDecoration(
    color: whiteC,
    borderRadius: BorderRadius.circular(13),
    border:
        Border.all(color: const Color(0xffC4C4C4).withOpacity(0.25), width: 1),
    boxShadow: [
      BoxShadow(
        color: blackC.withOpacity(0.1),
        offset: const Offset(0, 4),
        blurRadius: 4,
        spreadRadius: 0,
      )
    ],
  );
}

ButtonStyle buttonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 15),
    ),
    backgroundColor: MaterialStateProperty.all(greenCB),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
