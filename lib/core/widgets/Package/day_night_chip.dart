import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayNightChip  extends StatelessWidget{

final int dayCount;
final int nightCount;
const DayNightChip({
  super.key,
  required this.dayCount,
  required this.nightCount,
});

@override
Widget build(BuildContext context){
  return Container(
    
  padding: const EdgeInsets.only(top: 6, bottom: 6, left: 11, right: 11),
  decoration: BoxDecoration(  
  borderRadius: BorderRadius.circular(10),
  border: Border.all(color: Color.fromRGBO(0, 99, 156, 1), width: 1.18,),
  ),
  
  child: Text("${nightCount}N/${dayCount}D",
  style: GoogleFonts.openSans(
  fontWeight: FontWeight.w700,
  height: 1.0
  ,
  fontSize: 14,
  color: Color.fromRGBO(0, 99, 156, 1),
  ),
  ),
  
  );
}


}