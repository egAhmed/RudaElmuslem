/// Compare app version with GitHub releases version

import 'dart:convert';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';

import '../models/github_releases_model.dart';

class AppUpdateChecker {
  /// Check if installed app has lower version number than remote version
  /// Will return `false` if device running lower than unsupported version.
  static Future<bool> updatesAvailable() async {
    final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo _androidInfo = await _deviceInfo.androidInfo;

    int _deviceSdk = _androidInfo.version.sdkInt!;
    const int _minSdk = 20;
    if (_deviceSdk < _minSdk) return false;

    final PackageInfo _packageInfo = await PackageInfo.fromPlatform();

    // var response = await http.get(Uri.parse(
    //     'https://api.github.com/repos/iqfareez/app_waktu_solat_malaysia/releases/latest'));

    // var remoteRelease = GithubReleasesModel.fromJson(jsonDecode(response.body));

    //var remoteVersion = remoteRelease.tagName!.split('+');
   // int remoteBuildNumber = int.parse(remoteVersion.last);
    int appBuildNumber = int.parse(_packageInfo.buildNumber);

    return (appBuildNumber < 1);//remoteBuildNumber
  }
}
