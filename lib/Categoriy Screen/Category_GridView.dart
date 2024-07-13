import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorieGridView extends StatelessWidget {
Category category;
int index;
Function OnClickItem;

CategorieGridView({required this.category,required this.index,required this.OnClickItem});

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap:(){
          OnClickItem(category);
        } ,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF212121),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft:Radius.circular(index%2==0||index==0? 25:0),
              bottomRight:Radius.circular(index%2==0||index==0? 0:25),
            )
          ),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(category.Url),
                )),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(category.title,style: TextStyle(fontSize: 18,color:Colors.white),),
                ),
              ],
            ),
          ),

    ),
      );
  }
}

class Category{
String id;
String Url;
String title;
Category({required this.id,required this.title,required this.Url});
}

