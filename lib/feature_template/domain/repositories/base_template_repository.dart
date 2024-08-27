import 'package:flutter_clean_architecture_cli/extension.dart';

String repositoryDomainTemplate(String featureName) => """
import 'package:dartz/dartz.dart';
import '/core/failure/failure.dart';
import '/core/pagination_controller/pagination_controller.dart';
import '../../data/models/${featureName}_model/${featureName}_model.dart';

abstract class Base${featureName.capitalize}Repository {
  Future<Either<Failure, List<${featureName.capitalize}Model>>> get${featureName.capitalize}s({
    PaginationOptions paginationOptions = const PaginationOptions(),
  });

  Future<Either<Failure, ${featureName.capitalize}Model?>> get${featureName.capitalize}({
    required int id,
  });

  Future<Either<Failure, ${featureName.capitalize}Model?>> create${featureName.capitalize}({
    required ${featureName.capitalize}Model $featureName,
    bool isUpdate = false,
  });
}
""";
