import 'package:api_section/webViewScreen/webViewScreen.dart';
import 'package:flutter/material.dart';

Widget biludArticleItem(article,context)=>InkWell(
  onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(article['url'])));
  },
  child:   Container(

    padding: const EdgeInsets.all(20.0),

    child:   Row(



      children: [



        Container(



          width: 120,



          height: 120,



          decoration: BoxDecoration(



              borderRadius: BorderRadius.circular(10.0),



              image:article['urlToImage']!=null  ?DecorationImage(



                  fit: BoxFit.cover,



                  image: NetworkImage('${article['urlToImage']}',),



              )



          :DecorationImage(



                fit: BoxFit.cover,



                image: NetworkImage('https://th.bing.com/th/id/R.86312ed95dc0b39ab5a6bed92770ad9d?rik=qmoIvfWXlTUiTw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_427629.png&ehk=r6jARp6uTQRio1gKyDNlFOZ1WvEGRn3SCLxRtog2LFk%3d&risl=&pid=ImgRaw&r=0',),



              )

          )

        ),



        SizedBox(width: 20,),



        Expanded(



          child: Column(



            mainAxisAlignment: MainAxisAlignment.start,



            crossAxisAlignment: CrossAxisAlignment.start,



            children: [



              Text('${article['title']}',style: Theme.of(context).textTheme.bodyText1,



                maxLines: 3,



                overflow: TextOverflow.ellipsis,



              ),



              Text('${article['publishedAt']}',style: TextStyle(



                  color: Colors.grey



              ),)



            ],



          ),



        )



      ],



    ),

  ),
);
Widget ArticleBulder(list,context)=>  ListView.separated( physics: BouncingScrollPhysics(), itemBuilder: (context,index)=>biludArticleItem(list[index],context), separatorBuilder: (context,index)=>Container(
height: 1,
color: Colors.black,
), itemCount: list.length,);
