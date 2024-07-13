import 'package:flutter/material.dart';
import 'package:news_app/Categoriy%20Screen/Category_item_widget.dart';
import 'package:news_app/Search/Search_Screen.dart';
import '../Categoriy Screen/Category_GridView.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = 'Categories Screen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  @override
  Widget build(BuildContext context) {
    List<Category> CategoryListView = [
      Category(
        id: 'sports',
        title: AppLocalizations.of(context)!.sports,
        Url: 'assets/images/sports.png',
      ),
      Category(
        id: 'technology',
        title:  AppLocalizations.of(context)!.technology,
        Url: 'assets/images/tec.png',
      ),
      Category(
        id: 'health',
        title:  AppLocalizations.of(context)!.health,
        Url: 'assets/images/health.png',
      ),
      Category(
        id: 'business',
        title:  AppLocalizations.of(context)!.business,
        Url: 'assets/images/business.png',
      ),
      Category(
        id: 'entertainment',
        title:  AppLocalizations.of(context)!.entertainment,
        Url: 'assets/images/entertainment.png',
      ),
      Category(
        id: 'science',
        title:  AppLocalizations.of(context)!.science,
        Url: 'assets/images/science.png',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: selectedCategory != null
            ? AppBar(
                backgroundColor: Colors.white,
                forceMaterialTransparency: true,
                centerTitle: true,
                title: Text(
                  '${selectedCategory!.title}',
                  style: Theme.of(context).textTheme.bodyLarge
                )
            ,actions: [
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SearchScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Icon(Icons.search,size: 28,color: Theme.of(context).primaryColor.withOpacity(0.7) ,),
                ),
              )
        ],
        )
            : AppBar(
                backgroundColor: Colors.white,
                forceMaterialTransparency: true,
                title: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.categorieTitle,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                  ],
                )),
        body: selectedCategory == null
            ? Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 3),
                        child: GridView.builder(
                          padding:
                              EdgeInsets.symmetric(horizontal: 35, vertical: 4),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 7 / 8),
                          itemBuilder: (context, index) => CategorieGridView(
                            index: index,
                            category: CategoryListView[index],
                            OnClickItem: OnClick,
                          ),
                          itemCount: CategoryListView.length,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : CategorieItemScreen(selectedCategory!),
      ),
    );
  }

  Category? selectedCategory = null;
  void OnClick(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
