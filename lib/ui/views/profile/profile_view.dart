import 'package:car_park_manager/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: ListView(
            padding: EdgeInsets.only(left: 30, right: 30),
            children: [
              Center(
                heightFactor: 2,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 80.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: viewModel.image == null
                            ? const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              )
                            : CircleAvatar(
                                radius: 80,
                                backgroundImage: FileImage(viewModel.image!),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 10.0,
                      child: InkWell(
                        onTap: () {
                          viewModel.showUpdateStatusBottomSheet();
                        },
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // viewModel.imageProfile(),
              verticalSpaceSmall,
              viewModel.nameTextField(),
              verticalSpaceSmall,
              viewModel.jobTextField(),
              verticalSpaceSmall,
              viewModel.locationTextField(),
              verticalSpaceSmall,
              viewModel.departmentTextField(),
            ],
          )),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
