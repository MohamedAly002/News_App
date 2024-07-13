import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Categoriy%20Screen/Source_Tab_Item.dart';
import 'package:news_app/News/News_List.dart';

import '../Model/Source.dart';

class CategoryWidget extends StatefulWidget {
  List<Source> sources;

  CategoryWidget(this.sources);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int selectedtabbar = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
          length: widget.sources.length,
          child: Column(
            children: [
              TabBar(
                onTap: (index) {
                  setState(() {
                    selectedtabbar = index;
                  });
                },
                tabs: widget.sources
                    .map((source) => SourceTab(source,
                        widget.sources.indexOf(source) == selectedtabbar))
                    .toList(),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabAlignment: TabAlignment.center,
              ),
              Expanded(child: NewsList(widget.sources[selectedtabbar]))
            ],
          )),
    );
  }
}
