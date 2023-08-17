import 'package:fitbasix_exercise/model/exercise_details_model/exercise_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/my_application.dart';
import '../../utils/theme.dart';
import '../../utils/widget_util.dart';

class ExerciseDetailScreen extends StatelessWidget {
  ExerciseDetailScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Exercise Details',
          style: AppTheme.ttlStyl14B,
        ),
      ),
      body: Obx(() {
        ExerciseDetailsModel exerciseData =
            app.appController.exerciseDetails.value;
        return exerciseData == null
            ? Center(child: WidgetUtil.loaderSpin())
            : SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display the exercise image
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          exerciseData.gifUrl.toString(),
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Exercise details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.fitness_center, color: Colors.blue),
                            SizedBox(width: 8),
                            Text(
                              exerciseData.name.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.category, color: Colors.green),
                            SizedBox(width: 8),
                            Text(
                              'Body Part: ${exerciseData.bodyPart.toString()}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.fitness_center, color: Colors.orange),
                            SizedBox(width: 8),
                            Text(
                              'Equipment: ${exerciseData.equipment.toString()}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.flag, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              'Target: ${exerciseData.target.toString()}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
