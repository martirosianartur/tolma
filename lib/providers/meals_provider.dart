import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tolma/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
