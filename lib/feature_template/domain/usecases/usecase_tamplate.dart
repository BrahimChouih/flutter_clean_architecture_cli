import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String usecaseTemplate(String featureName, String usecaseName) => """
import 'package:dartz/dartz.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '/core/failure/failure.dart';

class ${usecaseName.capitalize}Usecase {
  final Base${featureName.capitalize}Repository repository;

  ${usecaseName.capitalize}Usecase(this.repository);

  Future<Either<Failure, ${usecaseName.capitalize}UsecaseOutput>> call({
    required ${usecaseName.capitalize}UsecaseInput ${usecaseName}UsecaseInput,
  }) async {
    return await repository.$usecaseName(
      ${usecaseName}UsecaseInput: ${usecaseName}UsecaseInput,
    );
  }
}


class ${usecaseName.capitalize}UsecaseInput {
  final int id;

  ${usecaseName.capitalize}UsecaseInput({required this.id});

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}

class ${usecaseName.capitalize}UsecaseOutput {
  int? id;

  ${usecaseName.capitalize}UsecaseOutput({this.id});

  ${usecaseName.capitalize}UsecaseOutput.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
}
""";
