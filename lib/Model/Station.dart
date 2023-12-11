import 'dart:convert';


class Station {
  int? id;
  String? nomstation;
  Station({
    this.id,
    this.nomstation,
  });
  Station.em(){}

  Station copyWith({
    int? id,
    String? nomstation,
  }) {
    return Station(
      id: id ?? this.id,
      nomstation: nomstation ?? this.nomstation,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(nomstation != null){
      result.addAll({'nomstation': nomstation});
    }
  
    return result;
  }

  factory Station.fromMap(Map<String, dynamic> map) {
    return Station(
      id: map['id']?.toInt(),
      nomstation: map['nomstation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Station.fromJson(String source) => Station.fromMap(json.decode(source));

  @override
  String toString() => 'Station(id: $id, nomstation: $nomstation)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Station &&
      other.id == id &&
      other.nomstation == nomstation;
  }

  @override
  int get hashCode => id.hashCode ^ nomstation.hashCode;
}
