import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/cubit.dart';
import 'package:news_app/shared/component/states.dart';

import '../../modules/search/search.dart';
class HomeLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${cubit.screenTitles[cubit.indexScreen]}'
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    cubit.changeMode();
                  },
                  icon: const Icon(Icons.brightness_4),
              ),
              IconButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                    cubit.search=[];
                  },
                  icon: const Icon(Icons.search),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 20,
            currentIndex: cubit.indexScreen,
            onTap: (index){
              cubit.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.business, size: 20,), label: 'Business'),
              BottomNavigationBarItem(icon: Icon(Icons.sports_baseball, size: 20,), label: 'Sports'),
              BottomNavigationBarItem(icon: Icon(Icons.science, size: 20,), label: 'Science'),
            ],
          ),
          body: cubit.screens[cubit.indexScreen],
        );
      },
    );
  }
}

