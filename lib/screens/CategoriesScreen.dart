import 'package:cached_network_image/cached_network_image.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../i18n/strings.g.dart';
import '../models/Categories.dart';
import '../models/ScreenArguements.dart';
import '../providers/CategoriesModel.dart';
import '../screens/CategoriesMediaScreen.dart';
import '../screens/NoitemScreen.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = "/categories";
  CategoriesScreen();

  @override
  CategoriesScreenRouteState createState() => new CategoriesScreenRouteState();
}

class CategoriesScreenRouteState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          CategoriesModel(Provider.of<AppStateManager>(context, listen: false)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.categories),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[300]!,
                  Colors.purple[100]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 12),
          child: CategoriesPageBody(),
        ),
      ),
    );
  }
}

class CategoriesPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoriesModel categoriesModel = Provider.of<CategoriesModel>(context);
    List<Categories>? items = categoriesModel.categories;
    if (categoriesModel.isLoading) {
      return Center(
          child: CupertinoActivityIndicator(
        radius: 20,
      ));
    } else if (categoriesModel.isError) {
      return NoitemScreen(
          title: t.oops,
          message: t.dataloaderror,
          onClick: () {
            categoriesModel.loadItems();
          });
    } else
      return GridView.builder(
        itemCount: categoriesModel.categories!.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(3),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1),
        itemBuilder: (BuildContext context, int index) {
          return ItemTile(
            index: index,
            categories: items![index],
          );
        },
      );
  }
}

class ItemTile extends StatelessWidget {
  final Categories categories;
  final int index;

  const ItemTile({
    Key? key,
    required this.index,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: InkWell(
        child: Container(
          height: 200.0,
          width: 120.0,
          child: Column(
            children: <Widget>[
              Container(
                height: 120,
                //margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: categories.thumbnailUrl!,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) => Center(
                        child: Icon(
                      Icons.error,
                      color: Colors.grey,
                    )),
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Container(
                alignment: Alignment.center,
                child: Text(
                  categories.title!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 3.0),
              Container(
                alignment: Alignment.center,
                child: Text(
                  categories.mediaCount.toString() + " " + t.messages,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    color: Colors.blueGrey[300],
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            CategoriesMediaScreen.routeName,
            arguments: ScreenArguements(position: 0, items: categories),
          );
        },
      ),
    );
  }
}
