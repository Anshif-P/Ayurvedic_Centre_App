import 'package:noviindus_machine_task/src/resources/remote/api_services.dart';
import 'package:noviindus_machine_task/src/util/app_url/app_url.dart';
import 'package:noviindus_machine_task/src/util/typedef/type_def.dart';

class PatientRepository {
  EitherResponse getPatients(String token) async =>
      ApiService.getApi(Urls().baseUrl + Urls().getPatients, token);
}
