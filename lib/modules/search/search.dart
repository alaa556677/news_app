import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/component/cubit.dart';
import 'package:news_app/shared/component/states.dart';

class SearchScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Search',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[350],
                    ),
                    child: TextFormField(
                      onChanged: (value){
                        cubit.getSearch(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search, color: AppCubit.get(context).isDark? Colors.white : Colors.black,),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index) => buildScreenItem(cubit.search[index], context),
                    separatorBuilder: (context,index)=> buildSeparatedItem(),
                    itemCount: cubit.search.length
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}