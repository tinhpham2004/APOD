import 'package:apod/core/colors/colors.dart';
import 'package:apod/features/gallery/presentation/viewmodel/apod_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../domain/entities/apod_entity.dart';
import '../widgets/date_picker.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  ApodEntity apodEntity = ApodEntity.empty();

  final apodBloc = getIt<ApodViewModel>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: BlocProvider(
        create: (context) => apodBloc,
        child: BlocConsumer<ApodViewModel, ApodState>(
          listener: (context, state) {
            if (state is GetCalendarState) {
              Navigator.of(context).pushNamed(
                '/apod',
                arguments: state.apodEntity,
              );
            } else if (state is FailedGetApodState) {
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