import 'package:fitbasix_exercise/utils/strings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../core/binding/app_binding.dart';
import '../screen/all_exercide/all_exercises.dart';
import '../screen/exercise_details/exercise_details.dart';
import '../screen/splash/splashscreen.dart';

class MyRoutes {
  static var routes = [
    GetPage(name: "/", page: () => const Splashscreen(), binding: AppBinding()),
    GetPage(
        name: Exercise_SCREEN,
        page: () =>  ExerciseListScreen(),
        binding: AppBinding()),

        GetPage(
        name: Exercise_Derails_SCREEN,
        page: () =>  ExerciseDetailScreen(),
        binding: AppBinding()),
  ];
}
