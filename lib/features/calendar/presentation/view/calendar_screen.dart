import 'package:apod/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../gallery/domain/entities/apod_entity.dart';
import '../widgets/date_picker.dart';
import '../viewModel/calendar_bloc.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final calendarBloc = getIt<CalendarViewModel>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Calendar',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.star_outline_outlined,
              color: AppColors.white,
              size: 25,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 12.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.selected,
                  size: 25,
                ),
              ),
            ),
          ],
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
                    DatePicker(
                      calendarBloc: BlocProvider.of(context),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
