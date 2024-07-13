import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/Source.dart';

class SourceTab extends StatelessWidget {
  Source source;
  bool selected;
  SourceTab(this.source, this.selected);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8,bottom: 8),
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selected ? Theme.of(context).primaryColor: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color:Theme.of(context).primaryColor,width: 1),
      ),
      child: Text(source.name ?? '',
      style: selected?Theme.of(context).textTheme.titleSmall:Theme.of(context).textTheme.headlineSmall),
    );
  }
}
