import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';

import '../../utils/my_application.dart';
import '../../utils/strings.dart';
import '../../utils/theme.dart';
import '../../utils/widget_util.dart';

class ExerciseListScreen extends StatefulWidget {
  @override
  State<ExerciseListScreen> createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Fitbasix Exercise',
            style: AppTheme.ttlStyl14B,
          ),
        ),
        body: views()
        // view()
        );
  }

  Widget views() {
    return Obx(
      () {
        final exerciseList = app.appController.exerciseList;

        if (exerciseList.isEmpty) {
          return Center(child: WidgetUtil.loaderSpin());
        }

        return Column(
          children: [
            Expanded(
              child: PaginationView(
                preloadedItems: exerciseList,
                itemBuilder:
                    (BuildContext context, dynamic exercise, int index) {
                  if (index == exerciseList.length) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return InkWell(
                      onTap: () async {
                        await app.appController
                            .getExerciseDetails(exercise.id.toString());
                        Get.toNamed(Exercise_Derails_SCREEN);
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Text(
                            WidgetUtil().toTitleCase(exercise.name.toString()),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.heartPulse,
                                size: 20,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                WidgetUtil()
                                    .toTitleCase(exercise.target.toString()),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              exercise.gifUrl.toString(),
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FontAwesomeIcons.dumbbell,
                                size: 20,
                                color: Colors.green,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                WidgetUtil()
                                    .toTitleCase(exercise.bodyPart.toString()),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
                paginationViewType: PaginationViewType.listView,
                pageFetch: pageFetch,
                onError: onError,
                onEmpty: onEmpty(),
              ),
            ),
          ],
        );
      },
    );
  }

  bool isLoading = false; // Track loading state

  Future<List<dynamic>> pageFetch(int offset) async {
    await Future.delayed(const Duration(seconds: 2));
    // Calculating the start and end index of the page
    final itemsPerPage = 10; // Adjusting the number of items per page as needed
    final startIndex = offset * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    if (endIndex >= app.appController.exerciseList.length) {
      return [];
    } else {
      return app.appController.exerciseList.sublist(startIndex, endIndex);
    }
  }

  Widget onError(dynamic error) {
    return Center(
      child: Text('Error: $error'),
    );
  }

  Widget onEmpty() {
    return const Center(
      child: Text('No items available.'),
    );
  }
}
