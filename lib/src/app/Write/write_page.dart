import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modestnotes/src/controllers/controller.dart';
import 'package:provider/provider.dart';

class WritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    Controller controller = Provider.of<Controller>(context, listen: false);
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    titleController.text = controller.allNotes[args].title;
    contentController.text = controller.allNotes[args].content;
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
                colors:[ Colors.grey[400], Colors.grey[300], Colors.grey[400]],
              ),
              boxShadow: [
                BoxShadow(color: Colors.black54, blurRadius: 3)
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    iconSize: 30,
                    alignment: Alignment.centerLeft,
                    icon: Icon(Icons.arrow_back,color: Colors.black54,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.bookmark_border,color: Colors.black54,),
                  onPressed: () {},
                ),
                PopupMenuButton(
                  icon: Icon(Icons.flag_outlined, size: 30,color: Colors.black54,),
                  padding: EdgeInsets.zero,
                  onSelected: (value) {},
                  itemBuilder: (context) => <PopupMenuItem>[
                    CheckedPopupMenuItem(
                      value: 'Primeiro',
                      checked: false,
                      child: Text('Primeiro'),
                    ),
                    CheckedPopupMenuItem(
                      value: 'Segundo',
                      enabled: false,
                      checked: false,
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
                  icon: Icon(Icons.delete,color: Colors.black54,),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) =>AlertDialog(
                       title: Text('Are you right?'),
                       content: Text('If you delete this note, you\'ll lose it forever'),
                       actions: [
                         FlatButton(
                           child: Text('Confirm'),
                           onPressed: (){},
                         ),
                         FlatButton(
                           child: Text('Cancel'),
                           onPressed: (){
                             Navigator.pop(context);
                           },
                         ),
                       ],
                     )
                    );
                     
                  },
                ),
              ],
            ),
          ),
          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              autofocus: true,
              controller: titleController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onSubmitted: (text) {},
              onChanged: (value) {},
              textInputAction: TextInputAction.next,
              style: GoogleFonts.getFont('Rubik',
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
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
              style: GoogleFonts.getFont('Rubik', fontSize: 15, fontWeight: FontWeight.w500),
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
