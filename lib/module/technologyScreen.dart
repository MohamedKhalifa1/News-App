import 'package:api_section/component/component.dart';
import 'package:api_section/cubit/cubit.dart';
import 'package:api_section/cubit/newsAppCubitState.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechnologyScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppCubitState>(builder: (context,state){
      var list =NewsAppCubit().get(context).technology;
      return  ListView.separated(physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=>biludArticleItem(list[index],context), separatorBuilder: (context,index)=>Container(
        height: 1,
        color: Colors.black,
        ), itemCount: list.length,);

    }, listener: (context,state){});
  }
}