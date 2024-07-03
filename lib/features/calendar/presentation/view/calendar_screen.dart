import 'package:apod/features/calendar/presentation/viewModel/calendar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../gallery/domain/entities/apod_entity.dart';
import '../widgets/date_picker.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final calendarBloc = getIt<CalendarViewModel>();
  ApodEntity apodEntity = ApodEntity.empty();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: BlocProvider(
        create: (context) => calendarBloc,
        child: BlocConsumer<CalendarViewModel, CalendarState>(
          listener: (context, state) {
            if (state is GetCalendarState) {
              Navigator.of(context).pushNamed(
                '/apod',
                arguments: state.apodEntity,
              );
            } else if (state is FailedGetCalendarState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error')),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DatePicker(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
