import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen/business.dart';
import 'package:news_app/modules/science_screen/science.dart';
import 'package:news_app/modules/sport_screen/sports.dart';
import 'package:news_app/shared/component/states.dart';
import 'package:news_app/shared/network/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppCubit extends Cubit <AppStates>{
  AppCubit():super(InitialAppState());
  static AppCubit get (context) => BlocProvider.of(context);

  var dio = Dio();

  List <dynamic> business = [];
  Future getBusinessData() async {
    emit(GetBusinessDataLoading());
    var url = 'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=a62bfa5ef6e34805b809f60710ab999d';
    return await dio.get(url).then((value){
      business = value.data['articles'];
      emit(GetBusinessDataSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GetBusinessDataError(error.toString()));
    });
  }

  List <dynamic> sports = [];
  Future getSportsData() async {
    emit(GetSportsDataLoading());
    var url = 'https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=a62bfa5ef6e34805b809f60710ab999d';
    return await dio.get(url).then((value){
      sports = value.data['articles'];
      emit(GetSportsDataSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GetSportsDataError(error));
    });
  }

  List <dynamic> science = [];
  getScienceData() async {
    emit(GetScienceDataLoading());
    var url = 'https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=a62bfa5ef6e34805b809f60710ab999d';
    return await dio.get(url).then((value){
      science = value.data['articles'];
      emit(GetScienceDataSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GetScienceDataError(error));
    });
  }

  List screenTitles = [
    'Business News',
    'Sports News',
    'Science News',
  ];
  List screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  int indexScreen = 0 ;
  changeIndex(int index){
    indexScreen = index;
    emit(ChangeIndexScreen());
  }

  bool isDark = false;
  changeMode({bool? fromShared}){
    if (fromShared != null){
      isDark = fromShared;
      emit(ChangeAppMode());
    }else {
      isDark = !isDark;
      CacheHelper.savePref(key: 'isDark', value: isDark).then((value){
        emit(ChangeAppMode());
      });
    }
  }

  List <dynamic> search = [];
  void getSearch(String value) async {
    emit(SearchLoading());
    search = [];
    var url = 'https://newsapi.org/v2/everything?q=$value&apiKey=a62bfa5ef6e34805b809f60710ab999d';
    await dio.get(url).then((value){
      search = value.data['articles'];
      emit(SearchSuccess());
    }).catchError((error){
      print(error.toString());
      emit(SearchError(error));
    });
  }

}