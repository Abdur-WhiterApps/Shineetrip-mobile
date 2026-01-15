import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmenityLabelChip extends StatelessWidget {

final IconData icon;
final String labelText;


const AmenityLabelChip({
super.key,

required this.icon,
required this.labelText,



});



  @override
  Widget build(BuildContext context) {
    
    return  Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8,left: 16, right: 16),
     decoration: BoxDecoration(
      
      color: Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(23),
      border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.1), ),
     ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
     Container(
       decoration: BoxDecoration(
         color: Colors.white,
     
       ),
       child:Icon(icon, size: 18, ),),
         const SizedBox(width: 7),
         Text(
           labelText,
       
           style: GoogleFonts.openSans(
                   height: 1.66,
             fontSize: 12,
             fontWeight: FontWeight.w500,
             color: Color.fromRGBO(51, 51, 51, 1),
           ),
           maxLines: 1,
           overflow: TextOverflow.ellipsis,
         ),
       ],
     ),
    );
  }
}

