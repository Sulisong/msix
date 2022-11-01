import 'dart:io';
import 'package:cli_util/cli_logging.dart';
import 'package:get_it/get_it.dart';
import 'package:msix/src/extensions.dart';
import 'configuration.dart';

/// Use the makeappx.exe tool to generate manifest file
class MakeAppx {
  final Logger _logger = GetIt.I<Logger>();
  final Configuration _config = GetIt.I<Configuration>();

  Future<void> pack() async {
    _logger.trace('packing');

    String makeAppxPath =
        '${_config.msixToolkitPath}/Redist.${_config.architecture}/makeappx.exe';

    ProcessResult makeAppxProcess = await Process.run(makeAppxPath, [
      'pack',
      '/v',
      '/o',
      '/d',
      _config.buildFilesFolder,
      '/p',
      _config.msixPath
    ]);

    makeAppxProcess.exitOnError();
  }
}
