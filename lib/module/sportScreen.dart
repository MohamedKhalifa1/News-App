
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/component.dart';
import '../cubit/cubit.dart';
import '../cubit/newsAppCubitState.dart';

class SportScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppCubitState>(builder: (context,state){
      var list =NewsAppCubit().get(context).sports;
      return  ListView.separated( physics: BouncingScrollPhysics(), itemBuilder: (context,index)=>biludArticleItem(list[index],context), separatorBuilder: (context,index)=>Container(
        height: 1,
        color: Colors.black,
      ), itemCount: list.length,);

    }, listener: (context,state){});
  }
}