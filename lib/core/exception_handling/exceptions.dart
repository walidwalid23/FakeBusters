import 'network_error_model.dart';

class ServerException implements Exception{
  final NetworkErrorModel networkErrorModel;

  const ServerException({
    required this.networkErrorModel});
}


class LocalDatabaseException implements Exception{
  final String errorMessage;

  LocalDatabaseException(this.errorMessage);


}