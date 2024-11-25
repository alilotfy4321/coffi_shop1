abstract class ApiConsumer {
  Future<dynamic>get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    bool isFormData=false,
  });
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    bool isFormData=false,
  });
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    bool isFormData=false,
  });
Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    bool isFormData=false,
  });
}
