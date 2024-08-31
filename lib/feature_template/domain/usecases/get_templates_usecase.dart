import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

String getUsecaseTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';
import '../../domain/repositories/base_${featureName}_repository.dart';

import '/core/failure/failure.dart';

class Get${featureName.capitalize}sUsecase {
  final Base${featureName.capitalize}Repository repository;

  Get${featureName.capitalize}sUsecase(this.repository);

  Future<Either<Failure, List<${featureName.capitalize}Model>>> call({
    int? id,
    PaginationOptions paginationOptions = const PaginationOptions(),
  }) async {
    return await repository.get${featureName.capitalize}s(
      paginationOptions: paginationOptions,
    );
  }
}
""";
