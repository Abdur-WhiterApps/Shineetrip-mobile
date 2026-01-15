import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialVistLabelChip extends StatelessWidget{

final String labelText;
final IconData icon;


const SpecialVistLabelChip({
super.key, 
required this.labelText,
required this.icon,
     });
     
       @override
       Widget build(BuildContext context) {
         
         return Container(
     
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            
            color: Color.fromRGBO(252,252,252,1),
            border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.05),width: 1),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.25,left: 1.5),
                child: Icon(
                  
                  icon, size: 18, color: Color.fromRGBO(0, 0, 0, 0.5),),
              ),
              const SizedBox(width: 7),
              Text(
                labelText,
                
         
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(34, 194, 94, 1),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
         );
       }


}