import 'package:equatable/equatable.dart';

abstract class FormSubmissionStatus extends Equatable {
  const FormSubmissionStatus();
  @override
  List<Object> get props => [];
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class FormSubmissionSuccess extends FormSubmissionStatus {}

class FormSubmissionError extends FormSubmissionStatus {
  final String errorType;

  const FormSubmissionError({
    required this.errorType,
  });

  @override
  List<Object> get props => [errorType];
}
