import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../event/enums/activity_filter_type.dart';

class ActivityFilterNotifier extends StateNotifier<Set<ActivityFilterType>> {
  ActivityFilterNotifier() : super({ActivityFilterType.all});

  void toggleFilter(ActivityFilterType type) {
    // "All" seçilirse diğerlerini temizle
    if (type == ActivityFilterType.all) {
      state = {ActivityFilterType.all};
      return;
    }

    // Diğer bir seçim yapılırsa "All" kalksın
    final newState = {...state};
    if (newState.contains(ActivityFilterType.all)) {
      newState.remove(ActivityFilterType.all);
    }

    // Seçimi aç/kapat
    if (newState.contains(type)) {
      newState.remove(type);
      if (newState.isEmpty) newState.add(ActivityFilterType.all);
    } else {
      newState.add(type);
    }

    state = newState;
  }

  bool isSelected(ActivityFilterType type) => state.contains(type);
}

final activityFilterProvider =
    StateNotifierProvider<ActivityFilterNotifier, Set<ActivityFilterType>>(
      (ref) => ActivityFilterNotifier(),
    );
