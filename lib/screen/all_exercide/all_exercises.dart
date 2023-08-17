import 'package:fitbasix_exercise/core/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
        return app.appController.exerciseList.isEmpty
            ? Center(child: WidgetUtil.loaderSpin())
            : ListView.builder(
                itemCount: app.appController.exerciseList.length,
                itemBuilder: (context, index) {
                  final exercise = app.appController.exerciseList[index];
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
                          contentPadding: EdgeInsets.all(16),
                          title: Text(
                            WidgetUtil()
                                .toTitleCase(exercise.name.toString()),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.heartPulse,
                                size: 20,
                                color: Colors.red,
                              ),
                              SizedBox(width: 8),
                              Text(
                                WidgetUtil().toTitleCase(
                                    exercise.target.toString()),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600]),
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
                              Icon(
                                FontAwesomeIcons.dumbbell,
                                size: 20,
                                color: Colors.green,
                              ),
                              SizedBox(height: 4),
                              Text(
                                WidgetUtil().toTitleCase(
                                    exercise.bodyPart.toString()),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      )

                    

                      );
                });
      },
    );
  }
}
