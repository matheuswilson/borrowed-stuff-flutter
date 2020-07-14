import 'dart:convert';

class Stuff {
  int id;
  String description;
  String contactName;
  String phone;
  DateTime loanDate;
  String photoPath;

  Stuff({
    this.id,
    this.description,
    this.contactName,
    this.phone,
    this.loanDate,
    this.photoPath,
  });

  String get loadDateString =>
      '${loanDate.day.toString().padLeft(2, '0')}/${loanDate.month.toString().padLeft(2, '0')}';

  bool get photoExist => photoPath != null && photoPath.isNotEmpty;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'contactName': contactName,
      'phone': phone,
      'loanDate': loanDate?.millisecondsSinceEpoch,
      'photoPath': photoPath,
    };
  }

  static Stuff fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Stuff(
      id: map['id'],
      description: map['description'],
      contactName: map['contactName'],
      phone: map['phone'],
      loanDate: DateTime.fromMillisecondsSinceEpoch(map['loanDate']),
      photoPath: map['photoPath'],
    );
  }

  String toJson() => json.encode(toMap());

  static Stuff fromJson(String source) => fromMap(json.decode(source));

  Stuff copyWith({
    int id,
    String description,
    String contactName,
    String phone,
    DateTime loanDate,
    String photoPath,
  }) {
    return Stuff(
      id: id ?? this.id,
      description: description ?? this.description,
      contactName: contactName ?? this.contactName,
      phone: phone ?? this.phone,
      loanDate: loanDate ?? this.loanDate,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  @override
  String toString() {
    return 'Stuff(id: $id, description: $description, contactName: $contactName, phone: $phone, loanDate: $loanDate, photoPath: $photoPath)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Stuff &&
        o.id == id &&
        o.description == description &&
        o.contactName == contactName &&
        o.phone == phone &&
        o.loanDate == loanDate &&
        o.photoPath == photoPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        contactName.hashCode ^
        phone.hashCode ^
        loanDate.hashCode ^
        photoPath.hashCode;
  }
}
