import 'dart:convert';

class Voyager {
  int? id;
  String? depart;
  String? arrive;
  int? duree;
  Voyager({
    this.id,
    this.depart,
    this.arrive,
    this.duree,
  });
  Voyager.em(){}

  Voyager copyWith({
    int? id,
    String? depart,
    String? arrive,
    int? duree,
  }) {
    return Voyager(
      id: id ?? this.id,
      depart: depart ?? this.depart,
      arrive: arrive ?? this.arrive,
      duree: duree ?? this.duree,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(depart != null){
      result.addAll({'depart': depart});
    }
    if(arrive != null){
      result.addAll({'arrive': arrive});
    }
    if(duree != null){
      result.addAll({'duree': duree});
    }
  
    return result;
  }

  factory Voyager.fromMap(Map<String, dynamic> map) {
    return Voyager(
      id: map['id']?.toInt(),
      depart: map['depart'],
      arrive: map['arrive'],
      duree: map['duree']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Voyager.fromJson(String source) => Voyager.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Voyager(id: $id, depart: $depart, arrive: $arrive, duree: $duree)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Voyager &&
      other.id == id &&
      other.depart == depart &&
      other.arrive == arrive &&
      other.duree == duree;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      depart.hashCode ^
      arrive.hashCode ^
      duree.hashCode;
  }
}
