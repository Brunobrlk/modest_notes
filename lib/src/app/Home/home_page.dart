import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modestnotes/src/controllers/controller.dart';
import 'package:modestnotes/src/models/categories.dart';
import 'package:modestnotes/src/models/note.dart';
import 'package:modestnotes/src/routes/routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        drawer: _buildDrawer(controller.allCategories),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Pasta Atual',
              style: GoogleFonts.getFont('Rubik', color: Colors.black),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.SEARCH),
            ),
          ],
        ),
        body: _reorderableListView(context, controller.allNotes),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            print('Esperando nova nota!');
            await Navigator.pushNamed(context, AppRoutes.WRITE, arguments: null);
            setState(() {
              print('Atualizando a lista...');
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.black54,
          ),
          backgroundColor: Colors.grey[300],
        ),
      ),
    );
  }

  Widget _buildDrawer(List<Categories> allCategories) {
    return Drawer(
      child: ListView.builder(
        itemCount: allCategories.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Column(
              children: [
                FlatButton(
                  // All notes
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.folder),
                        padding: EdgeInsets.only(right: 5),
                      ),
                      Expanded(
                        child: Text('All notes', style: GoogleFonts.getFont('Rubik')),
                      ),
                      Text('103')
                    ],
                  ),
                ),
                FlatButton(
                  // Non categorized notes
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.folder),
                        padding: EdgeInsets.only(right: 5),
                      ),
                      Expanded(
                        child: Text('Non Categorized',style: GoogleFonts.getFont('Rubik')),
                      ),
                      Text('8')
                    ],
                  ),
                ),
                Divider(),
              ],
            );
          } else if (allCategories.length + 1 == index) {
            return Column(
              children: [
                Divider(),
                FlatButton(
                  // Non categorized notes
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          Icons.edit,
                          color: Colors.grey,
                        ),
                        padding: EdgeInsets.only(right: 5),
                      ),
                      Text('Manage Categories', style: GoogleFonts.getFont('Rubik')),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return _buildFolders(index - 1, allCategories);
          }
        },
      ),
    );
  }

  Widget _buildFolders(int index, List<Categories> allCategories) {
    return FlatButton(
      padding: EdgeInsets.only(left: 16, right: 0),
      // Non categorized notes
      onPressed: () {},
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.library_books,
              color: Colors.grey,
            ),
            padding: EdgeInsets.only(right: 20),
          ),
          Expanded(
            child: Text('${allCategories[index].name}$index', style: GoogleFonts.getFont('Rubik')),
          ),
          Text('${allCategories[index].amount}', style: GoogleFonts.getFont('Rubik')),
          allCategories[index].isFavorit
              ? IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () {},
                  color: Colors.yellow[700],
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                )
              : IconButton(
                  icon: Icon(Icons.star_border),
                  onPressed: () {},
                  color: Colors.yellow[700],
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                )
        ],
      ),
    );
  }

  Widget _reorderableListView(BuildContext context, List<Note> allNotes) {
    _updateMyItems(int oldIndex, int newIndex){

      if(oldIndex<newIndex){
        newIndex-=1;
      }
      Note x = allNotes[oldIndex];
      allNotes.removeAt(oldIndex);
      allNotes.insert(newIndex, x);
    }
    return ReorderableListView(
      padding: EdgeInsets.all(10),
      children: [
        for (final note in allNotes)
          Container(
            margin: EdgeInsets.only(bottom:5),
            key: ValueKey(note),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.09, 0.55, 0.9],
                  colors: [
                    Colors.grey[400],
                    Colors.grey[300],
                    Colors.grey[400]
                  ],
                ),
                boxShadow: [
                BoxShadow(color: Colors.black54, blurRadius: 1)
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(2),
                  topRight: Radius.circular(2),
                  bottomLeft: Radius.circular(2),
                ),
              ),
              child: FlatButton(
                  onPressed: () async {
                    print(note.id);
                    await Navigator.pushNamed(context, AppRoutes.WRITE,
                        arguments: note);
                    setState(() {
                      print('Atualizando');
                    });
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                        '${note.title}',
                        maxLines: 1,
                        style: GoogleFonts.getFont('Rubik', fontSize: 20,color: Colors.black87)
                      ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        note.content,
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                        style: GoogleFonts.getFont('Rubik')
                      ),
                    ),
                    //trailing:
                  ),
              ),
            ),
            //Divider(),
      ], 
      onReorder: (oldIndex, newIndex){
        setState(() {
          _updateMyItems(oldIndex, newIndex);
        });
      }
    );
  }
}
