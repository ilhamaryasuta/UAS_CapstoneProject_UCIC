class UserModel {
  final String? id;
  final String? nama;
  final String? posisi;
  final int? gajipokok;
  final int? uangmakan;
  final int? izin;
  final String? rool;
  final String? email;
  final String? password;

  const UserModel({this.id, required this.nama, required this.posisi, required this.gajipokok, required this.uangmakan, required this.izin, required this.rool, this.email, this.password});

  toJson() {
    return {
      "nama": nama,
      "posisi": posisi,
      "gajipokok": gajipokok,
      "uangmakan": uangmakan,
      "izin": izin,
      "rool": "karyawan"
    };
  }

  Map<String, dynamic> add_data() {
    return {
      "nama": nama,
      "posisi": posisi,
      "gajipokok": gajipokok,
      "uangmakan": uangmakan,
      "izin": izin,
      "rool": "karyawan"
    };
  }
}
