import 'package:apod/core/colors/colors.dart';
import 'package:apod/core/enums/media_type.dart';
import 'package:apod/features/gallery/domain/entities/apod_entity.dart';
import 'package:apod/features/gallery/presentation/widgets/youtube_player_widget.dart';
import 'package:flutter/material.dart';

class ApodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    final ApodEntity apod = arguments as ApodEntity;

    String _formatDate(String date) {
      // Parse the input date string to DateTime
      DateTime dateTime = DateTime.parse(date);

      // List of month names
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

      // Get the month name from the list
      String month = months[dateTime.month - 1];

      // Construct the desired output format
      String formattedDate = "$month ${dateTime.day}, ${dateTime.year}";

      return formattedDate;
    }

    return SafeArea(
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
        body: SingleChildScrollView(
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
                        onTap: () {},
                        child: Icon(
                          Icons.star_outline_outlined,
                          color: AppColors.white,
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
    );
  }
}
