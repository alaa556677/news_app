import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/component/cubit.dart';
import 'package:news_app/shared/component/states.dart';

class SportsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        if(cubit.sports.isNotEmpty){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildScreenItem(cubit.sports[index], context),
              separatorBuilder: (context,index) => buildSeparatedItem(),
              itemCount: cubit.sports.length,
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}