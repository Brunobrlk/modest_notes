import 'package:modestnotes/src/models/categories.dart';
import 'package:modestnotes/src/models/note.dart';

class Controller {
  List<Note> allNotes = [
    Note(
      id: 0,
      title: 'Get Started',
      category: 'NonCategorized',
      content:
          'Para adicionar novas notas, clique no botão \'+\' no canto inferior direito, para salva-las apenas retorne a página de notas anterior',
    ),
    Note(
      id: 1,
      title: 'Get Started 2',
      category: 'NonCategorized',
      content:
          'Pressione por alguns segundos e arraste alguma anotação para movê-las e organizar de acordo com suas prioridades da maneira que preferir',
    ),
    Note(
      id: 2,
      title: 'Get Started 3',
      category: 'NonCategorized',
      content:
          'Agrupe em pastas suas anotações, gerencie-as, veja todas as notas, notas somente de uma pasta e é isso, prático e rápido',
    ),

  ];

  List<Categories> allCategories = [
    Categories(name: 'English', isFavorit: true),
    Categories(name: 'Spanish', isFavorit: true),
    Categories(name: 'Java', isFavorit: false),
    Categories(name: 'Frontend', isFavorit: false),
    Categories(name: 'Flutter', isFavorit: true),
  ];

  static String currentCategory='allNotes';
  getCurrentCategory(){
    return currentCategory;
  }

  changeCurrentCategory(String newCurrentCategory){
    currentCategory=newCurrentCategory;
  }

  addNote(Note note) {
    print('entrou controller');
    if (note.id == null) {
      note.id = allNotes.length;
      print(note.id);
    }
    allNotes.add(note);
  }

  removeNote(Note note) {
    allNotes.remove(note);
    print('removeu');
  }

  updateNote(String title, String content, int index) {
    if (index >= 0) {
      print('index: $index');
      allNotes[index].title = title;
      allNotes[index].content = content;
    }
  }

  changeCategory(String name){
  }
}
