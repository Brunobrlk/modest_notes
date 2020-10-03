import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modestnotes/src/controllers/controller.dart';
import 'package:modestnotes/src/models/note.dart';
import 'package:modestnotes/src/routes/routes.dart';
import 'package:provider/provider.dart';

class WritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Note args = ModalRoute.of(context).settings.arguments;
    Controller controller = Provider.of<Controller>(context, listen: false);
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    bool newNote=true;
    if (args != null) {
      titleController.text = args.title;
      contentController.text = args.content;
      newNote=false;
    }
    

    return Scaffold(
      body: ListView(
        children: [
          Container(
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
              children: [
                Expanded(
                  child: IconButton(
                    iconSize: 30,
                    alignment: Alignment.centerLeft,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      if(newNote && (titleController.text!='' || contentController.text!='')){
                        controller.addNote(Note(title: titleController.text, content: contentController.text));
                        Navigator.pop(context);
                      }else{
                        controller.updateNote(titleController.text, contentController.text, controller.allNotes.indexOf(args));
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Colors.black54,
                  ),
                  onPressed: () {},
                ),
                PopupMenuButton(
                  icon: Icon(
                    Icons.flag_outlined,
                    size: 30,
                    color: Colors.black54,
                  ),
                  padding: EdgeInsets.zero,
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (context) => <PopupMenuItem>[
                    CheckedPopupMenuItem(
                      value: 'Primeiro',
                      checked: false,
                      child: Text('Primeiro'),
                    ),
                    CheckedPopupMenuItem(
                      value: 'Segundo',
                      enabled: true,
                      checked: true,
                      child: Text('Segundo'),
                    ),
                    CheckedPopupMenuItem(
                        value: 'Terceiro',
                        checked: true,
                        child: Text('Terceiro')),
                  ],
                ),
                IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Are you right?'),
                        content: Text(
                            'If you delete this note, you\'ll lose it forever'),
                        actions: [
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text('Confirm'),
                            onPressed: () {
                              controller.removeNote(args);
                              Navigator.popUntil(context, ModalRoute.withName(AppRoutes.HOME));
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              autofocus: false,
              controller: titleController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onSubmitted: (text) {},
              onChanged: (value) {},
              textInputAction: TextInputAction.next,
              style: GoogleFonts.getFont('Rubik',
                  fontSize: 22, fontWeight: FontWeight.w700),
              decoration: InputDecoration.collapsed(
                hintText: 'Enter a title',
                hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 22,
                    fontFamily: 'ZillaSlab',
                    fontWeight: FontWeight.w700),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 40),
            child: TextField(
              controller: contentController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (value) {},
              style: GoogleFonts.getFont('Rubik',
                  fontSize: 15, fontWeight: FontWeight.w500),
              decoration: InputDecoration.collapsed(
                hintText: 'Start typing...',
                hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
