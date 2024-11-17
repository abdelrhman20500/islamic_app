import 'package:flutter/material.dart';

import '../../../../../models/details_sceen_args.dart';
import '../../../../uitls/app_assets.dart';
import '../../../../uitls/app_colors.dart';
import '../../../../uitls/app_theme.dart';
import '../../../../uitls/constant.dart';
import '../../../details/details_screen.dart';

class AhadethTab extends StatelessWidget {
/// list to make ahadeth list.
 List<String> ahadethName = List.generate(50, (index) {
   return "${index+1} حديث رقم ";
 });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(AppAssets.ahadethTabLogo)),
        const Divider(
          color: AppColors.accent,
          thickness: 3,
        ),
        Text("SuraName",textAlign: TextAlign.center,style: AppTheme.appBarTitleTextStyle.copyWith(
            fontSize: 25, fontWeight: FontWeight.w600),),
        const Divider(
          color: AppColors.accent,
          thickness: 3,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: 114,
              itemBuilder: (context , index){
                return TextButton(onPressed: (){
                  Navigator.pushNamed(context, DetailsScreen.routeName,
                      arguments: DetailsScreenArgs(
                          suraOrHadethName: ahadethName[index],
                          fileName: "h${index+1}.txt",
                          isQuranFile: false));
                },
                  child:  Text(ahadethName[index],textAlign: TextAlign.center,
                    style: AppTheme.quranTabTitleTextStyle,),
                );
              }
          ),
        ),
      ],
    );
  }
}

