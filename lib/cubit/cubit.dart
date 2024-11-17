
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/api_manager.dart';

import '../models/radio.dart';
import 'cubit_states.dart';

class RadioCubit extends Cubit<RadioStates>{
  late ApiManager apiManager;
  late RadioModel? radioModel;
  final player = AudioPlayer();
  int curIndex =0;
  RadioCubit() : super(InitialRadio()){
   apiManager = ApiManager();


   getRadio();
  }
  void getRadio()async{
    var radios= await apiManager.getRadio();
    radioModel= radios;
    emit(SuccessRadio());
  }
  nextRadio(){
    if(curIndex<radioModel!.radios!.length){
      curIndex++;
      emit(SuccessRadio());
    }
    player.stop();
  }
  previousRadio(){
    if(curIndex>0){
      curIndex--;
      emit(SuccessRadio());
    }
    player.stop();
  }
}

