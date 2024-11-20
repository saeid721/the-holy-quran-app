part of 'cubit.dart';

class ParaRepository {
  Future<Para?> juzFetchApi(num juzNumber) =>
      JuzDataProvider.juzFetchApi(juzNumber);

  Future<Para?> paraFetchHive(num juzNumber) =>
      JuzDataProvider.juzFetchHive(juzNumber);
}
