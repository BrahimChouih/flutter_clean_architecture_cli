import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String usecaseTemplate(String featureName, String usecaseName) => """
import 'package:dartz/dartz.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '/core/failure/failure.dart';

class ${usecaseName.moduleName}Usecase {
  final Base${featureName.moduleName}Repository repository;

  ${usecaseName.moduleName}Usecase(this.repository);

  Future<Either<Failure, ${usecaseName.moduleName}UsecaseOutput>> call({
    required ${usecaseName.moduleName}UsecaseInput ${usecaseName}UsecaseInput,
  }) async {
    return await repository.$usecaseName(
      ${usecaseName}UsecaseInput: ${usecaseName}UsecaseInput,
    );
  }
}


class ${usecaseName.moduleName}UsecaseInput {
  final int id;

  ${usecaseName.moduleName}UsecaseInput({required this.id});

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}

class ${usecaseName.moduleName}UsecaseOutput {
  int? id;

  ${usecaseName.moduleName}UsecaseOutput({this.id});

  ${usecaseName.moduleName}UsecaseOutput.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
}
""";
