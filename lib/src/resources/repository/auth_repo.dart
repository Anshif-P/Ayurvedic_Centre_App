import 'package:noviindus_machine_task/src/resources/remote/api_services.dart';
import 'package:noviindus_machine_task/src/util/app_url/app_url.dart';
import 'package:noviindus_machine_task/src/util/typedef/type_def.dart';

class AuthenticationRepo {
  EitherResponse loginFnc(Map<String, dynamic> map) async =>
      ApiService.postApi(Urls().baseUrl + Urls().login, map);
}
