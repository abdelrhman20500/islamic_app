import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/setting_provider.dart';
import '../../../../uitls/app_colors.dart';
class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});


  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitch = false;
  bool darkSwitch = false;
 late SettingProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(AppLocalizations.of(context)!.settings, style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.start),
          buildRowOption("العربية", arSwitch, (newValue){
            arSwitch =newValue ;
            if(arSwitch){
              provider.setCurrentProvider("ar");
            }else{
              provider.setCurrentProvider("en");
            }
          }),
          buildRowOption(AppLocalizations.of(context)!.darkMode, darkSwitch, (newValue){
            darkSwitch =newValue ;
            if(darkSwitch){
              provider.setCurrentMode(ThemeMode.dark);
            }else {
              provider.setCurrentMode(ThemeMode.light);
            }
          }),
        ],
      ),
    );
  }

  Widget buildRowOption(String title , bool switchValue, Function(bool) onChanged) {
    return Row(
        children: [
          const SizedBox(width: 16),
          Text(title, style: Theme.of(context).textTheme.bodySmall,),
          const Spacer(),
          Switch(value: switchValue, onChanged: onChanged, activeColor: AppColors.primary,)
        ],
      );
  }
}
