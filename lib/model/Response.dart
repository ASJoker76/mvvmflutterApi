import 'dart:ffi';

class Response {
  final String tanggal;
  final String keterangan;
  final bool isCuti;

  Response({required this.tanggal, required this.keterangan, required this.isCuti});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      tanggal: json['tanggal'],
      keterangan: json['keterangan'],
      isCuti: json['is_cuti'] ?? false,
    );
  }
}
