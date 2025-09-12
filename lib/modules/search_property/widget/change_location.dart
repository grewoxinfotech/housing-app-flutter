import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/utils/dummy_data.dart';
import 'package:housing_flutter_app/modules/search_property/view/search_screen.dart';

import 'alphabet_search.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({super.key});

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        title: buildCommonText(
          'Change',
          20,
          FontWeight.w600,
          ColorRes.textColor,
          1,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildFilterHeadingPadding('Popular cities'),
              SizedBox(height: 7),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height-150,
              //     child: CityAlphabetList(letterCity: letterAlphabate,)),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
