part of 'cubit.dart';

class JuzDataProvider {
  static final cache = Hive.box('data');
  static Dio ins = Dio();

  static Future<Para?> juzFetchApi(num juzNumber) async {
    try {
      final resp = await ins.get(
        'http://api.alquran.cloud/v1/juz/$juzNumber/quran-uthmani',
      );
      final Map<String, dynamic> raw = resp.data['data'];
      final Para juz = Para.fromMap(raw);

      await cache.put(
        'juz$juzNumber',
        juz,
      );

      return juz;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<Para?> juzFetchHive(num juzNumber) async {
    try {
      final data = await cache.get('juz$juzNumber');
      if (data == null) return null;

      final Para? juz = data;
      return juz;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
