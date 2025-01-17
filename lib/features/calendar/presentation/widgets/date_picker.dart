import 'package:apod/core/colors/colors.dart';
import 'package:flutter/material.dart';
import '../viewModel/calendar_bloc.dart';

class DatePicker extends StatefulWidget {
  final CalendarViewModel calendarBloc;
  DatePicker({required this.calendarBloc});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  late FixedExtentScrollController _dayController;
  late FixedExtentScrollController _monthController;
  late FixedExtentScrollController _yearController;

  static const int _dayCount = 31;
  static const int _monthCount = 12;
  static const int _yearStart = 1996;
  late final int _yearRange = DateTime.now().year - _yearStart + 1;
  static const int _middleCushion =
      10000; // Large number to simulate infinite scroll

  @override
  void initState() {
    super.initState();
    _dayController = FixedExtentScrollController(
        initialItem: _middleCushion ~/ 2 + DateTime.now().day - 10);
    _monthController = FixedExtentScrollController(
        initialItem: _middleCushion ~/ 2 + DateTime.now().month - 9);
    _yearController = FixedExtentScrollController(
        initialItem:
            _middleCushion ~/ 2 + (DateTime.now().year - _yearStart + 17));
  }

  @override
  void dispose() {
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _onDayChanged(int index) {
    int newDay = (index % _dayCount) + 1;
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month, newDay);
    });
  }

  void _onMonthChanged(int index) {
    int newMonth = (index % _monthCount) + 1;
    setState(() {
      selectedDate = DateTime(selectedDate.year, newMonth, selectedDate.day);
    });
  }

  void _onYearChanged(int index) {
    int newYear = _yearStart + (index % _yearRange);
    setState(() {
      selectedDate = DateTime(newYear, selectedDate.month, selectedDate.day);
    });
  }

  String _formatMonth(int data) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    String month = months[data - 1];
    return month;
  }

  bool isValidDate(DateTime date) {
    final DateTime startDate = DateTime(1995, 6, 16);
    final DateTime endDate = DateTime.now();

    if (!_isValidDateComponents(date.year, date.month, date.day)) {
      return false;
    }

    if (date.isAfter(startDate) && date.isBefore(endDate)) {
      return true;
    } else {
      return false;
    }
  }

  bool _isValidDateComponents(int year, int month, int day) {
    if (month < 1 || month > 12) {
      return false;
    }

    final List<int> daysInMonth = [
      31,
      (isLeapYear(year) ? 29 : 28),
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];

    if (day < 1 || day > daysInMonth[month - 1]) {
      return false;
    }

    return true;
  }

  bool isLeapYear(int year) {
    if (year % 4 != 0) {
      return false;
    } else if (year % 100 != 0) {
      return true;
    } else if (year % 400 != 0) {
      return false;
    } else {
      return true;
    }
  }

  void showInvalidDateSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Invalid date selected. Please choose a valid date.'),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isValidDate(selectedDate))
          widget.calendarBloc.add(GetCalendarEvent(date: selectedDate));
        else
          showInvalidDateSnackbar(context);
      },
      child: Container(
        height: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListWheelScrollView.useDelegate(
                controller: _monthController,
                itemExtent: 50,
                diameterRatio: 1.25,
                physics: FixedExtentScrollPhysics(),
                onSelectedItemChanged: _onMonthChanged,
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    int month = (index % _monthCount) + 1;
                    return Center(
                      child: Text(
                        _formatMonth(month),
                        style: TextStyle(
                          fontSize: 24,
                          color: selectedDate.month == month
                              ? AppColors.selected
                              : AppColors.text,
                        ),
                      ),
                    );
                  },
                  childCount: _middleCushion,
                ),
              ),
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                controller: _dayController,
                itemExtent: 50,
                diameterRatio: 1.25,
                physics: FixedExtentScrollPhysics(),
                onSelectedItemChanged: _onDayChanged,
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    int day = (index % _dayCount) + 1;
                    return Center(
                      child: Text(
                        '$day',
                        style: TextStyle(
                          fontSize: 24,
                          color: selectedDate.day == day
                              ? AppColors.selected
                              : AppColors.text,
                        ),
                      ),
                    );
                  },
                  childCount: _middleCushion,
                ),
              ),
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                controller: _yearController,
                itemExtent: 50,
                diameterRatio: 1.25,
                physics: FixedExtentScrollPhysics(),
                onSelectedItemChanged: _onYearChanged,
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    int year = _yearStart + (index % _yearRange);
                    return Center(
                      child: Text(
                        '$year',
                        style: TextStyle(
                          fontSize: 24,
                          color: selectedDate.year == year
                              ? AppColors.selected
                              : AppColors.text,
                        ),
                      ),
                    );
                  },
                  childCount: _middleCushion,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
