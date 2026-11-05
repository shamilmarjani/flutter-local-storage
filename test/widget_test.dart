// Test dasar untuk halaman kartu profil.

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kartu_profil_digital/main.dart';
import 'package:kartu_profil_digital/services/pref_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('halaman profil menampilkan kartu profil', (
    WidgetTester tester,
  ) async {
    // Berikan preferensi mock agar PrefService bisa diinisialisasi di test.
    SharedPreferences.setMockInitialValues({});
    final prefs = await PrefService.init();

    await tester.pumpWidget(MyApp(prefs: prefs));
    await tester.pump();

    // Judul app bar dan data profil bawaan tampil.
    expect(find.text('Kartu Profil Digital'), findsOneWidget);
    expect(find.text('Budi Santoso'), findsOneWidget);
    expect(find.text('AI Engineer'), findsOneWidget);
  });
}
