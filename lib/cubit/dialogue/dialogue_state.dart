// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dialogue_cubit.dart';

class DialogueState extends Equatable {
  final int dialogueId;
  const DialogueState({
    required this.dialogueId,
  });

  factory DialogueState.initial() => const DialogueState(dialogueId: 101);

  @override
  List<Object> get props => [dialogueId];

  DialogueState copyWith({
    int? dialogueId,
  }) {
    return DialogueState(
      dialogueId: dialogueId ?? this.dialogueId,
    );
  }

  @override
  bool get stringify => true;
}
