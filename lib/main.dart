import 'package:api_section/cubit/cubit.dart';
import 'package:api_section/cubit/newsAppCubitState.dart';
import 'package:api_section/layout/homeNewsPage.dart';

import 'package:api_section/network/remote/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
static final ValueNotifier<ThemeMode> themeNotifier=ValueNotifier(ThemeMode.light);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsAppCubit(),
      child: BlocConsumer<NewsAppCubit,NewsAppCubitState>(

        listener: (context,state){},
        builder: (context,state){
          var cubit =NewsAppCubit().get(context);
          return ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (_,ThemeMode currentMode,__){
            return MaterialApp(

              debugShowCheckedModeBanner: false,
              theme:ThemeData(
                canvasColor: Colors.white,
                  primarySwatch: Colors.lightBlue,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(

                    iconTheme: IconThemeData(
                        color: Colors.black
                    ),
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark
                    ),
                    titleSpacing: 20,
                    color: Colors.white,
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      elevation: 20,
                      showUnselectedLabels: true,
                      unselectedItemColor: Colors.grey,
                      selectedItemColor: Colors.lightBlue,
                      backgroundColor: Colors.white
                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )
                  ),


              ),

darkTheme:ThemeData(

  canvasColor: HexColor('242526'),
  primarySwatch: Colors.lightBlue,
  scaffoldBackgroundColor: HexColor('242526'),
  appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white
      ),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('242526'),
        statusBarIconBrightness: Brightness.light
      ),
      color:HexColor('242526'),
      titleSpacing: 20,

      titleTextStyle: TextStyle(

        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20
      ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

      backgroundColor: HexColor('242526'),
      elevation: 20,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.lightBlue,

  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      )
  ),


),
              themeMode: currentMode,

              home: HomeNewsPage(),
            );},
          );

        }

      ),
    );



  }
}
