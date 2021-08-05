import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color bgcolor = Colors.white;
Color textColor = Color(0xffA69CB7);

TextStyle textStyle(double size, [Color color, FontWeight fw]) {
  return GoogleFonts.montserrat(fontSize: size, color: color, fontWeight: fw);
}

CollectionReference<Map<String, dynamic>> userCollection =
    FirebaseFirestore.instance.collection('users');

CollectionReference<Map<String, dynamic>> folderCollection =
    FirebaseFirestore.instance.collection('folders');
