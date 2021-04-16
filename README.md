# TASK BOARD


## Installation

Set 1.22.2 flutter version

```bash
flutter pub get
```

## Usage

### show creating text field

```dart
    creating.value=true; #hide text field
```

### add new task to list

```dart
listTasks.add(new Task(
      title: titleTextEditingControllerCreateTask.text,
      done: false
    )); # added to list new Task
    await storage.write(
        "tasks",
        Task().getListToJson(listTasks)
        ); # write to phone storage new list tasks
    creating.value=false; #hide text field
    titleTextEditingControllerCreateTask.text=""; #clear text field
    Get.appUpdate(); # update state app
```

### update task

```dart
int index = listTasks.indexWhere((element) => element==task); # get index task in list
    Task updateTask = listTasks[index]; # get updated task from list
    print(updateTask.title);
    updateTask.done=value; # change value checker
    listTasks[index]=updateTask; #update task in list
    await storage.write("tasks", Task().getListToJson(listTasks)); #write change to phone storage
    print(storage.read("tasks"));
    Get.appUpdate(); # update app state
```

### remove task from list

```dart
listTasks.remove(task); # remove task from list
    await storage.write("tasks", Task().getListToJson(listTasks)); # write change to phone storage
```

### Get list task from phone storage

```dart
 var tasks=  storage.read("tasks"); # write list from phone storage
    print(tasks);
    if(tasks!=null){
      listTasks.addAll(Task().getListFromJson(tasks)); # set listTasks list from phone storage
    }
    load.value=true;
```


## License
[MIT](https://choosealicense.com/licenses/mit/)