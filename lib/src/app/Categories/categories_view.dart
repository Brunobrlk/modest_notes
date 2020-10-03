import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modestnotes/src/controllers/controller.dart';
import 'package:modestnotes/src/models/categories.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              print('old: $oldIndex new: $newIndex');
              print('${controller.allCategories[oldIndex]}');
              print('${controller.allCategories[newIndex]}');
              Categories x = controller.allCategories[oldIndex];
              controller.allCategories.removeAt(oldIndex);
              controller.allCategories.insert(newIndex, x);
            });
          },
          header: Container(
            margin: EdgeInsets.all(0),
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 0.35, 0.8],
                colors: [Colors.grey[400], Colors.grey[300], Colors.grey[400]],
              ),
              boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 3)],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 30,
                  alignment: Alignment.centerLeft,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Categories',
                  style: GoogleFonts.getFont('Rubik',
                      color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ),
          children: [
            for (final category in controller.allCategories)
              InkWell(
                key: ValueKey(category),
                onTap: () {
                  print('taped');
                },
                child: ListTile(
                  title: Text('${category.name}'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  leading: Icon(Icons.folder),
                ),
              )
          ],
        ),
      ),
    );
  }
}
