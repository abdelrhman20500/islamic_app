import 'package:flutter/material.dart';
import '../../../../../models/details_sceen_args.dart';
import '../../../../uitls/app_assets.dart';
import '../../../../uitls/app_colors.dart';
import '../../../../uitls/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../uitls/constant.dart';
import '../../../details/details_screen.dart';


class QuranTab extends StatelessWidget {
  const QuranTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(AppAssets.quranTabLogo)),
        const Divider(),
        Text(AppLocalizations.of(context)!.suraName,textAlign: TextAlign.center,style: AppTheme.appBarTitleTextStyle.copyWith(
            fontSize: 25, fontWeight: FontWeight.w600),),
        const Divider(),
       Expanded(
         flex: 7,
         child: ListView.builder(
             itemCount: 114,
             itemBuilder: (context , index){
               return TextButton(onPressed: (){
                 Navigator.pushNamed(context, DetailsScreen.routeName,
                 arguments: DetailsScreenArgs(
                     suraOrHadethName: Constant.SuraName[index],
                     fileName: "${index+1}.txt",
                     isQuranFile: true));
               },
                   child:  Text(Constant.SuraName[index],textAlign: TextAlign.center,
                     style: Theme.of(context).textTheme.displayMedium,),
               );
             }
         ),
       ),
      ],
    );
  }
}