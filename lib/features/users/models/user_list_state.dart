import '../models/user.dart';
import '../user_filter.dart';

class UserListState {
  final List<User> allUsers;
  final String searchQuery;
  final UserFilter filter;

  UserListState({
    required this.allUsers,
    this.searchQuery = "",
    this.filter = UserFilter.all,
  });

  UserListState copyWith({
    List<User>? allUsers,
    String? searchQuery,
    UserFilter? filter,
  }) {
    return UserListState(
      allUsers: allUsers ?? this.allUsers,
      searchQuery: searchQuery ?? this.searchQuery,
      filter: filter ?? this.filter,
    );
  }
}
