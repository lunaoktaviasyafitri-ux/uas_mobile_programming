import 'package:flutter/material.dart'; // Tambah ini
import 'package:flutter_test/flutter_test.dart';
import 'package:saku_mahasiswa/main.dart';

void main() {
  testWidgets('Cek apakah aplikasi Saku Mahasiswa berhasil terbuka',
      (WidgetTester tester) async {
    // 1. Jalankan aplikasi
    await tester.pumpWidget(const SakuMahasiswaApp());

    // 2. Tunggu sebentar sampai font dan grafik siap
    await tester.pump();

    // 3. Cek tulisan IPK (Gunakan findsOneWidget agar lebih siap)
    expect(find.text('IPK KUMULATIF'), findsOneWidget);

    // 4. Cek keberadaan tombol Tambah Nilai
    // Kita cari yang bertipe FloatingActionButton
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
