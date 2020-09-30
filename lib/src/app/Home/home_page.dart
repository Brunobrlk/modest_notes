import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modestnotes/src/models/categories.dart';
import 'package:modestnotes/src/models/note.dart';
import 'package:modestnotes/src/routes/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> allNotes = [
    Note(title: 'My Dreams', content: 'Today is friday and i had a special dream with my favorit friends'),
    Note(title: 'Need to do', content: 'I need to do my homework, ...', isFixed: true),
    Note(title: 'Toughts', content: 'Any other thing, its not important for now, so, try to ignore this messages okay? all right, so lets get started to programming'),
  ];

  List<Categories> allCategories = [
    Categories(name: 'English', amount: 3, isFavorit: true),
    Categories(name: 'Spanish', amount: 120, isFavorit: true),
    Categories(name: 'Java', amount: 43, isFavorit: false),
    Categories(name: 'Frontend', amount: 25, isFavorit: false),
    Categories(name: 'Flutter', amount: 2, isFavorit: true),
  ];

  bool pinned = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: _buildDrawer(allCategories),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Text('Pasta Atual', style: GoogleFonts.getFont('Pacifico', color: Colors.black),),),
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.SEARCH),
            ),
          ],
        ),
        body: _buildNotes(allNotes),
      ),
    );
  }

  Widget _buildDrawer(List<Categories> allCategories) {
    return Drawer(
      child: ListView.builder(
        itemCount: allCategories.length+2,
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
                        child: Text('All notes'),
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
                        child: Text('Non Categorized'),
                      ),
                      Text('8')
                    ],
                  ),
                ),
                Divider(),
              ],
            );
          } else if (allCategories.length+1 == index) {
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
                      Text('Manage Categories'),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return _buildFolders(index-1, allCategories);
          }
        },
      ),
    );
  }

  Widget _buildFolders(int index, List<Categories> allCategories){
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
                    child: Text('${allCategories[index].name}$index'),
                  ),
                  Text('${allCategories[index].amount}'),
                  allCategories[index].isFavorit ? IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {},
                    color: Colors.yellow[700],
                    splashColor: Colors.white,
                    highlightColor: Colors.white,
                  ) : IconButton(
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
      itemCount: allNotes.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            FlatButton(
              onPressed: () { 
                print(index);
                Navigator.pushNamed(context, AppRoutes.WRITE, arguments: index);
              },
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'My Dream ${allNotes[index].title}',
                        style: GoogleFonts.getFont('Pacifico', fontSize: 20),
                      ),
                    ),
                     allNotes[index].isFixed ? Icon(Icons.fiber_pin) : Container(),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(allNotes[index].content, textAlign: TextAlign.justify,
                    maxLines: 3,
                  ) 
                ),
                //trailing:
              ),
            ),
            Divider(),
          ],
        );
      },
    );
  }

}
