import 'package:flutter/material.dart';

import '../../../../uitls/app_assets.dart';
import '../../../../uitls/app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});


  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter=0;
  double angle=0;
  List<String> name=[
    "سبحان اللة",
    "الحمد للة",
    "اللة اكبر"
  ];
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment:Alignment.center ,
            children:
            [
              Container(
                  margin: const EdgeInsets.only(top: 0.1),
                  child: Transform.rotate(
                      angle: angle,
                      child: Theme(
                          data: ThemeData(
                            splashColor:Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: InkWell(
                              onTap: ()
                              {
                                buildClickImage();
                              },
                              child: Image.asset(AppAssets.bodySebha, height: size.height*0.20,))))),
              Container(
                  margin: const EdgeInsets.only(bottom: 150, left: 40),
                  child: Image.asset(AppAssets.headSebha,height: size.height*0.10,)),
            ],
          ),
          const Text("عدد التسبيحات", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
          const SizedBox(height: 12),
          Container(
            height:70,
            width: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("$counter", textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.primary,
            ),
            child: Text(name[currentIndex], style:
            const TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),),
          ),
        ],
      ),
    );
  }

  void buildClickImage()
  {
    angle +=3;
    counter++;
    if(counter ==33){
      counter =0;
      currentIndex++;
      if(currentIndex >2)currentIndex=0;
    }
    setState(() {});
  }
}
