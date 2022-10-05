import 'package:api_section/cubit/newsAppCubitState.dart';
import 'package:api_section/module/businessScreen.dart';
import 'package:api_section/module/healthScreen.dart';
import 'package:api_section/module/scienceScreen.dart';
import 'package:api_section/module/sportScreen.dart';
import 'package:api_section/module/technologyScreen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../network/remote/dioHelper.dart';

class NewsAppCubit extends Cubit<NewsAppCubitState>{
  NewsAppCubit():super(IntialNewsAppState());
  NewsAppCubit get(context)=>BlocProvider.of(context);
  var currentIndex=0;
  List<dynamic>sports=[];
  List<dynamic>business=[];
  List<dynamic>science=[];
  List<dynamic>health=[];
  List<dynamic>technology=[];
  List<dynamic>search=[];
  List<BottomNavigationBarItem> bottomNavigationBarItem=[
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.health_and_safety),label: 'Health'),
    BottomNavigationBarItem(icon: Icon(Icons.computer),label: 'Technology'),

  ];
  List<Widget> newsAppScreen=[
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),
    HealthScreen(),
    TechnologyScreen(),
  ];
  void getCurrentIndex(int value){
    currentIndex=value;
    emit(GetCurrentIndexState());
  }
  void getSportNews(){
    emit(GetSportsLoadingState());
    DioHelper.getData('v2/top-headlines', {
      'country':'eg',
      'category':'sports',
      'apiKey':'dcbe8b63d13347f8a50c49dfe38081eb',
    })?.then((value) {

      sports=value.data['articles'];

      emit(GetSportsSuccesState());
    }).catchError((erorr){
      print(erorr.toString());
      emit(GetSportsErrorState());
    });
  }
  void getBusinessNews(){
    emit(GetBusinessLoadingState());
    DioHelper.getData('v2/top-headlines', {
      'country':'eg',
      'category':'business',
      'apiKey':'dcbe8b63d13347f8a50c49dfe38081eb',
    })?.then((value) {


      business=value.data['articles'];

      emit(GetBusinessSuccesState());
    }).catchError((erorr){

      emit(GetBusinessErrorState());
    });
  }
  void getScinceNews(){
    emit(GetScinceLoadingState());
    DioHelper.getData('v2/top-headlines', {
      'country':'eg',
      'category':'science',
      'apiKey':'dcbe8b63d13347f8a50c49dfe38081eb',
    })?.then((value) {


      science=value.data['articles'];

      emit(GetScinceSuccesState());
    }).catchError((erorr){
      print(erorr.toString());
      emit(GetScinceErrorState());
    });
  }
  void getHealthNews(){
    emit(GetHealthLoadingState());
    DioHelper.getData('v2/top-headlines', {
      'country':'eg',
      'category':'health',
      'apiKey':'dcbe8b63d13347f8a50c49dfe38081eb',
    })?.then((value) {


      health=value.data['articles'];

      emit(GetHealthSuccesState());
    }).catchError((erorr){
      print(erorr.toString());
      emit(GetHealthErrorState());
    });
  }
  void getTechnologyNews(){
    emit(GetTechnologyLoadingState());
    DioHelper.getData('v2/top-headlines', {
      'country':'eg',
      'category':'technology',
      'apiKey':'dcbe8b63d13347f8a50c49dfe38081eb',
    })?.then((value) {


      technology=value.data['articles'];

      emit(GetTechnologySuccesState());
    }).catchError((erorr){
      print(erorr.toString());
      emit(GetTechnologyErrorState());
    });
  }
  void getSearch(String value){
    emit(GetSearchLoadingState());

    DioHelper.getData('v2/everything', {
      'q':'$value',
      'apiKey':'dcbe8b63d13347f8a50c49dfe38081eb',
    })?.then((value) {
      search=value.data['articles'];
      emit(GetSearchSuccesState());
    }).catchError((erorr){
      print(erorr.toString());
      emit(GetSearchErrorState());
    });
  }
  var isLight=false;

  void changeMode(){
    isLight=!isLight;
    print(isLight);
    emit(ChangeModeState());
  }

}