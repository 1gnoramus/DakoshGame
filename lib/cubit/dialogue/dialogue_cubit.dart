import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dialogue_state.dart';

class DialogueCubit extends Cubit<DialogueState> {
  DialogueCubit() : super(DialogueState.initial());

  void increaseDialogueId() {
    emit(state.copyWith(dialogueId: state.dialogueId + 1));
  }
}
