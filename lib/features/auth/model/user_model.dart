import 'dart:convert';

class userModel {
  final String id;
  final String email;
  final String name;
  userModel({
    required this.id,
    required this.email,
    required this.name,
  });

  userModel copyWith({
    String? id,
    String? email,
    String? name,
  }) {
    return userModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
    };
  }

  factory userModel.fromMap(Map<String, dynamic> map) {
    return userModel(
      id: map['id'] ?? "",
      email: map['email'] ?? "",
      name: map['name'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory userModel.fromJson(String source) => userModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'userModel(id: $id, email: $email, name: $name)';

  @override
  bool operator ==(covariant userModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ name.hashCode;
  }
