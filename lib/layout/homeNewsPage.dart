import 'package:api_section/cubit/cubit.dart';
import 'package:api_section/cubit/newsAppCubitState.dart';
import 'package:api_section/main.dart';
import 'package:api_section/search/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNewsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (context)=>NewsAppCubit()..getBusinessNews()..getScinceNews()..getSportNews()..getHealthNews()..getTechnologyNews(),
     child: BlocConsumer<NewsAppCubit,NewsAppCubitState>(
       listener: (context,state){},
       builder:(context,state) {
         NewsAppCubit cubit=NewsAppCubit().get(context);
         return  Scaffold(


           appBar: AppBar(
             title: Text('News App'),
             actions: [
               IconButton(onPressed: (){
Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchScreen()) );
               }, icon: Icon(Icons.search),),
               IconButton(onPressed: (){

MyApp.themeNotifier.value=MyApp.themeNotifier.value==ThemeMode.light?ThemeMode.dark:ThemeMode.light;
               }, icon: Icon(MyApp.themeNotifier.value==ThemeMode.light?Icons.dark_mode:Icons.light_mode),),

             ],
           ),
           bottomNavigationBar: BottomNavigationBar(
             onTap: (value){
               cubit.getCurrentIndex(value);
             },
             currentIndex:cubit.currentIndex ,
             items: cubit.bottomNavigationBarItem
           ),
           body: cubit.newsAppScreen[cubit.currentIndex],

         );
       },

     ),
   );
  }
}