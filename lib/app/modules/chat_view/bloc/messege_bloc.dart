import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jee_chat/service/messegesend.service.dart';

part 'messege_event.dart';
part 'messege_state.dart';

class MessegeBloc extends Bloc<MessegeEvent, MessegeState> {
  final SendMessage messegeSend = SendMessage();

  MessegeBloc() : super(MessegeInitial()) {
    on<MessegeSends>((sendMessge));
  }
  void sendMessge(MessegeSends event, Emitter<MessegeState> emit) async {
    await messegeSend.senddToFirbase(
        event.doc_id, event.uId, event.type, event.content);
    return emit(SendMessege());
  }
}
