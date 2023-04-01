import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/component/cubit.dart';
import 'package:news_app/shared/component/states.dart';

class BusinessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        if(cubit.business.isNotEmpty){
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildScreenItem(cubit.business[index], context),
              separatorBuilder: (context,index) => buildSeparatedItem(),
              itemCount: cubit.business.length,
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}