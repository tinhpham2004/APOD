import 'package:apod/core/colors/colors.dart';
import 'package:apod/core/di/injection.dart';
import 'package:apod/core/enums/media_type.dart';
import 'package:apod/features/apod/domain/entities/apod_entity.dart';
import 'package:apod/features/apod/presentation/viewModel/apod_bloc.dart';
import 'package:apod/features/apod/presentation/widgets/youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApodScreen extends StatefulWidget {
  @override
  State<ApodScreen> createState() => _ApodScreenState();
}

class _ApodScreenState extends State<ApodScreen> {
  bool isFavourite = false;

  String _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    String month = months[dateTime.month - 1];
    String formattedDate = "$month ${dateTime.day}, ${dateTime.year}";

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final ApodEntity apod = arguments as ApodEntity;
    final apodBloc = getIt<ApodViewModel>();

    return BlocProvider<ApodViewModel>(
      create: (context) {
        apodBloc.add(InitApodEvent(apodEntity: apod));
        return apodBloc;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leadingWidth: 70.0,
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.selected,
                      size: 18,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: AppColors.selected,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
            title: Text(
              _formatDate(apod.date),
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ),
          body: BlocConsumer<ApodViewModel, ApodState>(
            listener: (context, state) {
              if (state is GetApodState) {
                setState(() {
                  isFavourite = state.isFavourite;
                });
              } else if (state is FailedApodState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erorr')),
                );
              }
            },
            builder: (context, state) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: apod.media_type == MediaType.IMAGE
                          ? Image.network(
                              apod.url,
                              height: 240,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : YoutubePlayerWidget(
                              url: apod.url,
                            ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: 250,
                          child: Text(
                            apod.title,
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              if (!isFavourite) {
                                apodBloc.add(AddApodEvent(apodEntity: apod));
                              } else {
                                apodBloc.add(RemoveApodEvent(apodEntity: apod));
                              }
                              setState(() {
                                isFavourite = !isFavourite;
                              });
                            },
                            child: Icon(
                              !isFavourite
                                  ? Icons.star_outline_outlined
                                  : Icons.star_purple500_outlined,
                              color: !isFavourite
                                  ? AppColors.white
                                  : AppColors.yellow,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        apod.explanation,
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
