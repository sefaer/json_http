

import 'package:flutter_json_http/models/Model.dart';

class Araba {
    String araba_adi;
    int kurulus_tarihi;
    List<Model> model;
    String ulke;

    Araba({this.araba_adi, this.kurulus_tarihi, this.model, this.ulke});

    factory Araba.fromJson(Map<String, dynamic> json) {
        return Araba(
            araba_adi: json['araba_adi'], 
            kurulus_tarihi: json['kurulus_tarihi'], 
            model: json['model'] != null ? (json['model'] as List).map((i) => Model.fromJson(i)).toList() : null, 
            ulke: json['ulke'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['araba_adi'] = this.araba_adi;
        data['kurulus_tarihi'] = this.kurulus_tarihi;
        data['ulke'] = this.ulke;
        if (this.model != null) {
            data['model'] = this.model.map((v) => v.toJson()).toList();
        }
        return data;
    }
}