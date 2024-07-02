import 'package:apod/core/routes/routes.dart';
import 'package:apod/features/gallery/domain/entities/apod_entity.dart';
import 'package:apod/features/gallery/domain/usecases/get_gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../viewmodel/apod_bloc.dart';

class GalleryScreen extends StatefulWidget {
  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<ApodEntity> apodEntity = [];

  final apodBloc = getIt<ApodViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Navigate to the favorite page
            },
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Show date picker
            },
          ),
        ],
      ),
      body: BlocProvider<ApodViewModel>(
        create: (context) {
          apodBloc.add(GetGalleryEvent());
          return apodBloc;
        },
        child: BlocConsumer<ApodViewModel, ApodState>(
          listener: (context, state) {
            if (state is SuccessGetApodState) {
              setState(() {
                apodEntity = state.apodEntities;
              });
            }
            if (state is FailedGetApodState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Erorr')),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingGetApodState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetGalleryState) {
              return ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: state.apodEntities.length,
                itemBuilder: (context, index) {
                  final apod = state.apodEntities[index];
                  return ListTile(
                    leading: apod.url != null ? Image.network(apod.url!) : null,
                    title: Text(apod.title),
                    subtitle: Text(apod.date),
                    onTap: () {},
                  );
                },
              );
            } else if (state is FailedGetApodState) {
              return Center(child: Text('Error'));
            } else {
              return Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
