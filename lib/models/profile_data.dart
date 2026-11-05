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
}