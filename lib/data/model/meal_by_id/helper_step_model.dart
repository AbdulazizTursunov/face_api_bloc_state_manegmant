class Method {
  Method({
    required this.step1,
    required this.step2,
    required this.step3,
    required this.step4,
    required this.step5,
    required this.step6,
    required this.step7,
  });

  factory Method.fromJson(Map<String, dynamic> json) => Method(
      step1: json['step 1'] as String? ?? '',
      step2: json['step 2'] as String? ?? '',
      step3: json['step 3'] as String? ?? '',
      step4: json['step 4'] as String? ?? '',
      step5: json['step 5'] as String? ?? '',
      step6: json['step 6'] as String? ?? '',
      step7: json['step 7'] as String? ?? '');

  Map<String,dynamic> toJson () =>{
    'step1':step1,
    'step2':step2,
    'step3':step3,
    'step4':step4,
    'step5':step5,
    'step6':step6,
    'step7':step7,
  };

  final String step1;
  final String step2;
  final String step3;
  final String step4;
  final String step5;
  final String step6;
  final String step7;

  Method copyWith({
    String? step1,
    String? step2,
    String? step3,
    String? step4,
    String? step5,
    String? step6,
    String? step7,
  }) =>
      Method(
        step1: step1 ?? this.step1,
        step2: step2 ?? this.step2,
        step3: step3 ?? this.step3,
        step4: step4 ?? this.step4,
        step5: step5 ?? this.step5,
        step6: step6 ?? this.step6,
        step7: step7 ?? this.step7,
      );
}
