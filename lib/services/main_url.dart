class MainUrl {
  String mainUrl = 'http://sipera.ketapangkab.go.id/api';
  static String _token = '951|vTS0ve9DJDFCd9bMsWSYjvpnvKRCbJtvScCQUKmF';

  void setToken(String data) {
    _token = data;
  }

  String getToken() {
    return _token;
  }
}
