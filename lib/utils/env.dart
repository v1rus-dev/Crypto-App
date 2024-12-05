
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'CRYPTO_COMPARE_KEY')
  static const String cryptoCompareApiKey = _Env.cryptoCompareApiKey;
}