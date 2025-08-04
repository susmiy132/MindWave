// // lib/features/meditation/presentation/view_model/meditation_bloc.dart

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mindwave/features/meditation/domain/use_case/create_meditation_usecase.dart';
// import 'package:mindwave/features/meditation/domain/use_case/delete_meditation_usecase.dart';
// import 'package:mindwave/features/meditation/domain/use_case/get_all_medittion_usecase.dart';
// import 'package:mindwave/features/meditation/domain/entity/meditation_entity.dart';
// import 'meditation_event.dart';
// import 'meditation_state.dart';

// class MeditationViewModel extends Bloc<MeditationEvent, MeditationState> {
//   final GetAllMeditationUsecase getAllUsecase;
//   final CreateMeditationUsecase createUsecase;
//   final DeleteMeditationUsecase deleteUsecase;

//   MeditationViewModel({
//     required this.getAllUsecase,
//     required this.createUsecase,
//     required this.deleteUsecase,
//   }) : super(MeditationInitial()) {
//     on<LoadMeditationsEvent>(_onLoadMeditations);
//     on<AddMeditationEvent>(_onAddMeditation);
//     on<DeleteMeditationEvent>(_onDeleteMeditation);
//   }

//   Future<void> _onLoadMeditations(
//     LoadMeditationsEvent event,
//     Emitter<MeditationState> emit,
//   ) async {
//     emit(MeditationLoading());
//     try {
//       final meditations = await getAllUsecase();
//       emit(MeditationLoaded(meditations));
//     } catch (e) {
//       emit(MeditationError("Failed to load meditations: ${e.toString()}"));
//     }
//   }

//   Future<void> _onAddMeditation(
//     AddMeditationEvent event,
//     Emitter<MeditationState> emit,
//   ) async {
//     try {
//       await createUsecase(event.meditation);
//       final meditations = await getAllUsecase();
//       emit(MeditationLoaded(meditations));
//     } catch (e) {
//       emit(MeditationError("Failed to add meditation: ${e.toString()}"));
//     }
//   }

//   Future<void> _onDeleteMeditation(
//     DeleteMeditationEvent event,
//     Emitter<MeditationState> emit,
//   ) async {
//     try {
//       await deleteUsecase(event.id);
//       final meditations = await getAllUsecase();
//       emit(MeditationLoaded(meditations));
//     } catch (e) {
//       emit(MeditationError("Failed to delete meditation: ${e.toString()}"));
//     }
//   }
// }
