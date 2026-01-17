import 'package:flutter_bloc/flutter_bloc.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<LoadBookingDetails>((event, emit) {
      emit(BookingLoaded());
    });

    on<SubmitBooking>((event, emit) async {
      emit(BookingSubmitting());
      await Future.delayed(const Duration(seconds: 1));
      emit(BookingSuccess());
    });
  }
}
