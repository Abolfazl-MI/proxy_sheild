// ignore_for_file: file_names

class ProxyModle {
  String? host;
  String? port;
  String? password;
  String? country;
  String? ping;
  ProxyModle({
    required this.host,
    required this.port,
    required this.password,
    required this.country,
    required this.ping,
  });

  factory ProxyModle.fromJson(Map<String, dynamic> json) => ProxyModle(
        country: json['country'] as String,
        host: Uri.parse(json['host']).toString(),
        password: Uri.parse(json['secret']).toString(),
        ping: json['ping'] as String,
        port: json['port'] as String,
      );

 
}
