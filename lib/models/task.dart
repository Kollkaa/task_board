
class Task {
  String title;
  bool done;

  Task({this.title, this.done});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    title: json["title"],
    done: json["done"]=="true",
  );

  Map<String, dynamic> toJson() => {
    "title":title,
    "done":done.toString(),
  };

  List <Task> getListFromJson(list){
    List<Task> tasks = List<Task>.from(list.map((i)=>Task.fromJson(i)).toList());
    return tasks;
  }
  List<dynamic>  getListToJson( list ){
    List<dynamic> cities = list.map((i)=>i.toJson()).toList();
    return cities;
  }
}