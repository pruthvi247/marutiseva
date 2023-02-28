import 'package:flutter/material.dart';

const String routeHome = 'home';
const String routeAbout = 'about';
const String routeContacts = 'contact';
const String routeServices = 'services';

const kTextColor = Color(0xFF707070);
const kTextLightColor = Color(0xFF555555);

const kDefaultPadding = 20.0;
const TextStyle kPageTitleStyle = TextStyle(fontSize: 20.0);
final kDefaultShadow = BoxShadow(
  offset: const Offset(0, 50),
  blurRadius: 50,
  color: const Color(0xFF0700B1).withOpacity(0.15),
);

final kDefaultCardShadow = BoxShadow(
  offset: const Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.1),
);

// TextField dedign
const kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

const kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);

const String ramalingamText =
    'In public recongnition of the valuable services to the community rendered in the field of child welfare our director was honurned by her excellency the president of india, Shrimati Pratibha Devisingh patil, with National Award for child welfare,2009 pm 14th november 2010';
