import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import '../../config/colors.dart';


class TermsAndConditions extends StatefulWidget {
  static String route = '/terms_and_conditions';
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: HexColor(MMfxColor.backgroundColor),
            body: Container(
              padding: EdgeInsets.all(15.5),
              child: Column(
                children: [
                  //header row
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Terms and Conditions',
                          style: TextStyle(
                              color: HexColor(MMfxColor.primary),
                              fontFamily: 'Poppins-SemiBold',
                              fontSize: 16),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10.5),
                            child: IconsButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                text: '',
                                iconData: Icons.close,
                                iconColor: HexColor(MMfxColor.primary)))
                      ],
                    ),
                  ),

                  //text
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.5),
                    child: Text(
                      'An Intellectual Property Clause eill inform uses that the contents, logo and other visual media you created is your property and is property',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
