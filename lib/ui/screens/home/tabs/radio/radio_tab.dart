import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../cubit/cubit.dart';
import '../../../../../cubit/cubit_states.dart';
import 'package:audioplayers/audioplayers.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> RadioCubit(),
      child: BlocBuilder<RadioCubit, RadioStates>(
        builder: (context, state) {
          /// provide cubit
          var cubit =context.read<RadioCubit>();
          if(state is InitialRadio){
            return const Center(child: CircularProgressIndicator());
          }if(state is SuccessRadio){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.16,),
                Image.asset("assets/images/radio.png"),
                SizedBox(height: MediaQuery.of(context).size.height*0.066,),
                Text(cubit.radioModel!.radios![cubit.curIndex].name!,
                textAlign: TextAlign.center, style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.w600),),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: ()
                    {
                      cubit.previousRadio();
                      print(cubit.previousRadio());
                    },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                    IconButton(onPressed: () async{
                      await cubit.player.play(
                          UrlSource(cubit.radioModel!.radios![cubit.curIndex].url!));

                    },
                        icon: const Icon(Icons.play_arrow, size: 42,)),
                    IconButton(onPressed: ()
                    {
                      cubit.nextRadio();
                      print(cubit.nextRadio());
                    },
                        icon: const Icon(Icons.arrow_forward_ios_outlined)),
                  ],
                )
              ],
            );
          }
          return Container();
        }
      ),
    );
  }
}
