import 'package:get/get.dart';
import 'package:task_board/moduls/home/bindings/home_binding.dart';
import 'package:task_board/moduls/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  var strings;

  AppPages({this.strings});

  getRoutes(){
     return [
       GetPage(
         name: Routes.HOME,
         page: () => HomePage(),
         binding: HomeBinding(),
       ),

     ];
   }
}
