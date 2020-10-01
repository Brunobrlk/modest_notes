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
        body: _buildNotes(controller.allNotes),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.WRITE);
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

  

  Widget _buildNotes(List<Note> allNotes) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: allNotes.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FlatButton(
                  onPressed: () async {
                    print(index);
                    Navigator.pushNamed(context, AppRoutes.WRITE,
                        arguments: index);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Expanded(
                      child: Text(
                        '${allNotes[index].title}',
                        maxLines: 1,
                        style: GoogleFonts.getFont('Rubik', fontSize: 20,color: Colors.black87)
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        allNotes[index].content,
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                        style: GoogleFonts.getFont('Rubik')
                      ),
                    ),
                    //trailing:
                  ),
                ),
              ),
            ),
            //Divider(),
            SizedBox(height: 10,),
          ],
        );
      },
    );
  }
}
