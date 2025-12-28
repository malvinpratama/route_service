import 'package:shared/shared.dart';

import './service_locator.config.dart';

final sl = GetIt.instance; 

@InjectableInit()
Future<void> configureDependencies() async => sl.init();