import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_list_state.dart';
import '../notifiers/user_list_notifier.dart';

final userListProvider = NotifierProvider<UserListNotifier, UserListState>(
  () => UserListNotifier(),
);
