import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../models/user_list_state.dart';
import '../user_filter.dart';

class UserListNotifier extends Notifier<UserListState> {
  @override
  UserListState build() {
    // DEMO
    final demo = [
      User(
        id: "1",
        name: "Talya Kuvvet",
        email: "talya@mail.com",
        photoUrl: "https://randomuser.me/api/portraits/women/65.jpg",
        isApplicant: true,
      ),
      User(
        id: "2",
        name: "Mert Özkan",
        email: "mert@mail.com",
        photoUrl: "https://randomuser.me/api/portraits/men/31.jpg",
      ),
      User(
        id: "3",
        name: "Elif Arslan",
        email: "elif@mail.com",
        photoUrl: "https://randomuser.me/api/portraits/women/33.jpg",
        isOldWorker: true,
      ),
      User(
        id: "4",
        name: "Ahmet Kaya",
        email: "ahmet@mail.com",
        photoUrl: "https://randomuser.me/api/portraits/men/90.jpg",
      ),
    ];

    return UserListState(allUsers: demo);
  }

  void setSearch(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void setFilter(UserFilter filter) {
    state = state.copyWith(filter: filter);
  }

  List<User> get filtered {
    List<User> list = state.allUsers;

    switch (state.filter) {
      case UserFilter.applicants:
        list = list.where((u) => u.isApplicant).toList();
        break;
      case UserFilter.oldWorkers:
        list = list.where((u) => u.isOldWorker).toList();
        break;
      case UserFilter.all:
      default:
        break;
    }

    if (state.searchQuery.isNotEmpty) {
      final q = state.searchQuery.toLowerCase();
      list = list.where((u) => u.name.toLowerCase().contains(q)).toList();
    }

    return list;
  }
}
