import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BookNowButton extends StatelessWidget{

final VoidCallback onPressed;
const BookNowButton({
  super.key,
  required this.onPressed,});

  @override
  Widget build(BuildContext context){


return ElevatedButton(onPressed: onPressed,
style: ElevatedButton.styleFrom( 

backgroundColor: Color.fromRGBO(0, 0, 0, 1),
padding: const EdgeInsets.only(top:9,bottom:9),


shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8),)

), child: Text("Book Now", style: GoogleFonts.inter(
  color: Color.fromRGBO(255, 255, 255, 1),
  fontSize: 18,
  height: 1,
  fontWeight: FontWeight.w600
) ,));

  }


}