
class Model {
    bool benzinli;
    int fiyat;
    String model_adi;

    Model({this.benzinli, this.fiyat, this.model_adi});

    factory Model.fromJson(Map<String, dynamic> json) {
        return Model(
            benzinli: json['benzinli'], 
            fiyat: json['fiyat'], 
            model_adi: json['model_adi'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['benzinli'] = this.benzinli;
        data['fiyat'] = this.fiyat;
        data['model_adi'] = this.model_adi;
        return data;
    }
}