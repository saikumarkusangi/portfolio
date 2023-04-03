// To parse this JSON data, do
//
//     final certificatesModel = certificatesModelFromJson(jsonString);

import 'dart:convert';

List<CertificatesModel> certificatesModelFromJson(String str) => List<CertificatesModel>.from(json.decode(str).map((x) => CertificatesModel.fromJson(x)));

String certificatesModelToJson(List<CertificatesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CertificatesModel {
    CertificatesModel({
        required this.certificates,
        required this.resume,
    });

    String certificates;
    String resume;

    factory CertificatesModel.fromJson(Map<String, dynamic> json) => CertificatesModel(
        certificates: json["certificates"],
        resume: json["Resume"],
    );

    Map<String, dynamic> toJson() => {
        "certificates": certificates,
        "resume": resume,
    };
}
