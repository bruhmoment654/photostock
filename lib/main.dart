import 'package:photostock/config/environment/environment.dart';
import 'package:photostock/runner.dart';

import 'config/environment/build_type.dart';

void main() {
  run(const Environment(buildType: BuildType.dev)).ignore();
}
