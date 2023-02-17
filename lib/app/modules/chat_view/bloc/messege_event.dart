part of 'messege_bloc.dart';

abstract class MessegeEvent extends Equatable {
  const MessegeEvent();

  @override
  List<Object> get props => [];
}

class MessegeSends extends MessegeEvent {
  final String doc_id;
  final String uId;
  final String type;
  final String content;

  MessegeSends(this.doc_id, this.uId, this.type, this.content);
}
