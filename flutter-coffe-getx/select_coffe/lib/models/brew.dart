class Brew {
  final String name;
  final String sugars;
  final int strength;

  Brew({required this.name,required this.sugars,required this.strength});

  factory Brew.fromFirestore(Map<String, dynamic> firestore){
    return Brew(
      name: firestore['name'] ?? '',
      sugars: firestore['sugars'] ?? '0',
      strength: firestore['strength'] ?? '0'
    
    );
  }
}