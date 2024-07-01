import 'package:apod/core/routes/routes.dart';
import 'package:apod/features/gallery/domain/usecases/get_gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../viewmodel/apod_bloc.dart';

class GalleryScreen extends StatelessWidget {
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
              Navigator.pushNamed(context, '/favorite');
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
      body: BlocProvider(
        create: (_) => getIt<ApodViewModel>()..add(GetGalleryEvent(page: 1)),
        child: ApodList(),
      ),
    );
  }
}

class ApodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApodViewModel, ApodState>(
      builder: (context, state) {
        if (state is LoadingGetApodState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SuccessGetApodState) {
          return ListView.builder(
            itemCount: state.apodEntities.length,
            itemBuilder: (context, index) {
              final apod = state.apodEntities[index];
              return ListTile(
                leading: Image.network(apod.url ?? ''),
                title: Text(apod.title),
                subtitle: Text(apod.date),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.apod,
                    arguments: apod,
                  );
                },
              );
            },
          );
        } else if (state is FailedGetApodState) {
          return Center(child: Text(state.toString()));
        } else {
          return Center(child: Text('No data available'));
        }
      },
    );
  }
}