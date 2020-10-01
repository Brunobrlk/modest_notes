import 'package:modestnotes/src/models/categories.dart';
import 'package:modestnotes/src/models/note.dart';

class Controller {
  List<Note> allNotes = [
    Note(
        title: 'My Dreams',
        content:
            'Today is friday and i had a special dream with my favorit friends'),
    Note(
        title: 'Need to do',
        content: 'I need to do my homework, i need to finish this notess',
        isFixed: true),
    Note(
        title: 'Toughts',
        content:
            'Any other thing, its not important for now, so, try to ignore this messages okay? all right, so lets get started to programming'),
            Note(
        title: 'My Dreams',
        content:
            'Today is friday and i had a special dream with my favorit friends'),
    Note(
        title: 'Need to do',
        content: 'I need to do my homework, i need to finish this notess',
        isFixed: true),
    Note(
        title: 'Toughts',
        content:
            'Any other thing, its not important for now, so, try to ignore this messages okay? all right, so lets get started to programming'),
            Note(
        title: 'My Dreams',
        content:
            'Today is friday and i had a special dream with my favorit friends'),
    Note(
        title: 'Need to do',
        content: 'I need to do my homework, i need to finish this notess',
        isFixed: true),
    Note(
        title: 'Toughts',
        content:
            'Any other thing, its not important for now, so, try to ignore this messages okay? all right, so lets get started to programming'),
            Note(
        title: 'My Dreams',
        content:
            'Today is friday and i had a special dream with my favorit friends'),
    Note(
        title: 'Need to do',
        content: 'I need to do my homework, i need to finish this notess',
        isFixed: true),
    Note(
        title: 'Toughts',
        content:
            'Any other thing, its not important for now, so, try to ignore this messages okay? all right, so lets get started to programming'),
  ];

  List<Categories> allCategories = [
    Categories(name: 'English', amount: 3, isFavorit: true),
    Categories(name: 'Spanish', amount: 120, isFavorit: true),
    Categories(name: 'Java', amount: 43, isFavorit: false),
    Categories(name: 'Frontend', amount: 25, isFavorit: false),
    Categories(name: 'Flutter', amount: 2, isFavorit: true),
  ];

  addNote(Note note){
    allNotes.add(note);
  }
  removeNote(Note note){
    allNotes.remove(note);
  }
  updateNote(String title, String content, int index){
    allNotes[index].title = title;
    allNotes[index].content = content;
  }
}
