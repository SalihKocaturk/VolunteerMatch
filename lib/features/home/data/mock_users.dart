import '../models/user_model.dart';

final List<UserModel> mockUsers = [
  UserModel(id: 'u1', name: 'Mina', score: 18200, level: 27),
  UserModel(id: 'u2', name: 'Veli', score: 17600, level: 26),
  UserModel(id: 'u3', name: 'Ceren', score: 17150, level: 25),
  UserModel(id: 'u4', name: 'Can', score: 16800, level: 24),
  UserModel(id: 'u5', name: 'Lale', score: 15800, level: 23),
  UserModel(id: 'u6', name: 'Deniz', score: 15100, level: 22),
  UserModel(
    id: 'u7',
    name: 'Salih Kocatürk',
    score: 13100,
    level: 20,
  ), // ✅ aktif kullanıcı
  UserModel(id: 'u8', name: 'Naz', score: 9800, level: 17),
  UserModel(id: 'u9', name: 'Efe', score: 8600, level: 15),
];
