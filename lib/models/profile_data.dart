import 'dart:convert';

class ProfileData {
  final String name;
  final String title;
  final String bio;

  const ProfileData({
    required this.name,
    required this.title,
    required this.bio,
  });

  /// Data bawaan saat belum ada data tersimpan.
  static const defaultData = ProfileData(
    name: 'Budi Santoso',
    title: 'AI Engineer',
    bio: 'Suka mengembangkan aplikasi berbasis AI dan Machine Learning. Memiliki pengalaman dalam pengolahan data dan pengembangan model prediktif.',
  );

  Map<String, dynamic> toMap() => {
      'name': name,
      'title': title,
      'bio': bio,
    };

  factory ProfileData.fromMap(Map<String, dynamic> map) => ProfileData(
      name: map['name'] as String? ?? defaultData.name,
      title: map['title'] as String? ?? defaultData.title,
      bio: map['bio'] as String? ?? defaultData.bio,
    );

  String toJson() => jsonEncode(toMap());

  factory ProfileData.fromJson(String source) =>
    ProfileData.fromMap(jsonDecode(source) as Map<String, dynamic>);
}