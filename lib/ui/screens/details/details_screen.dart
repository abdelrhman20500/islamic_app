import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/details_sceen_args.dart';
import '../../uitls/app_assets.dart';
import '../../uitls/app_colors.dart';
import '../../uitls/app_theme.dart';

class DetailsScreen extends StatefulWidget {
    DetailsScreen({Key? key}) : super(key: key);
 static const String routeName = "DetailsScreen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
   late DetailsScreenArgs arguments;
   int ayaCount=0;
   String fileContent="";

  @override
  Widget build(BuildContext context) {
    arguments= ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if(fileContent.isEmpty){
      readFile();
    }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(
              AppAssets.background),fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(arguments.suraOrHadethName, style:AppTheme.appBarTitleTextStyle ),
        ),
        body: fileContent.isEmpty ? const Center(child: CircularProgressIndicator()):
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Text(fileContent,textDirection:TextDirection.rtl,textAlign: TextAlign.center,
                style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.accent),),
            ),
          ),
        ),
      ),
    );
  }

  void readFile() async{
    /// to read text file in flutter.
    String file = await rootBundle.loadString(arguments.isQuranFile ?
    "assets/files/quran/${arguments.fileName}":"assets/files/ahadeth/${arguments.fileName}");
    // print(file);
    fileContent= file;
    /// to divide aya to line and replacement by (numbers),
    List<String> fileLines =file.split("\n");
    for(int i=0; i<fileLines.length ;i++ ){
      fileLines[i] += arguments.isQuranFile ?"(${i+1})": " ";
    }
    /// to collect aya another,
   fileContent = fileLines.join();
    setState(() {});
  }
}
