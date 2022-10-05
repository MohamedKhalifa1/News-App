import 'package:api_section/cubit/cubit.dart';
import 'package:api_section/cubit/newsAppCubitState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/component.dart';

class SearchScreen extends StatelessWidget{
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsAppCubit,NewsAppCubitState>(
     listener: (context,state){},
     builder: (context,state){
       var list=NewsAppCubit().get(context).search;
       var cubit=NewsAppCubit().get(context);

     return  Scaffold(
         appBar: AppBar(),
         body: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: TextField(
                 keyboardType:TextInputType.text,



                 onChanged: (String value){
                   cubit.getSearch(value);


                },

                 // validator: (String ?value){
                 //   searchController.text=value.toString();
                 //
                 //   if(value!.isEmpty){
                 //     return 'Search must not be empty';
                 //   }else{
                 //     return null;
                 //   }
                 // },

                 decoration: InputDecoration(

border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: BorderSide(color: Colors.grey)
),
                     hintText: 'Search',

                     prefixIcon: Icon(Icons.search)
                 ),
               ),
             ),
             Expanded(child: ArticleBulder(list,context))       ]
         ),

       );
     },

   );
  }

}