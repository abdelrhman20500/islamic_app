import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/ui/screens/home/tabs/Settings/settings_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islamic_app/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:provider/provider.dart';
import '../../../provider/setting_provider.dart';
import '../../uitls/app_assets.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

   static String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int currentIndex =0 ;
   List<Widget>tabs =[
      const QuranTab(),
      AhadethTab(),
      const SebhaTab(),
      const RadioTab(),
      const SettingsTab(),
   ];

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of(context);
    return Container(
        decoration:  BoxDecoration(
          image: DecorationImage(image: AssetImage(
           settingProvider.isDarkMode()?AppAssets.darkBackground:
           AppAssets.background),fit: BoxFit.fill)),
        child: Scaffold(
          // backgroundColor: AppColors.transparent,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: buildBottomNavigation(),
        )
    );
  }

  Widget buildBottomNavigation() {
    return Theme(
          data: Theme.of(context).copyWith(canvasColor:Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index){
              currentIndex =index;
              setState(() {});
            },
            items:  [
              const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)), label:  "Quran"),
              const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhadeth)), label:  "Ahadeth"),
              const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)), label:  "Sebha"),
              const BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)), label:  "Radio"),
              BottomNavigationBarItem(icon: const Icon(Icons.settings), label:  AppLocalizations.of(context)!.settings),
            ],
          ),
        );
  }
}
