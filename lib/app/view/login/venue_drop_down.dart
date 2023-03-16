import 'package:flutter/material.dart';
import 'package:park_proj/app/utils/my_strings.dart';
import 'package:park_proj/app/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class VenueDropdown extends StatelessWidget {
  const VenueDropdown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel=Provider.of<LoginViewModel>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.75,
      child: DropdownButton(
        elevation: 0,
        isExpanded: true,
        hint: Text( viewModel.venueController.text!=''?
        viewModel.venueController.text:venue),
        items: viewModel.venueList.map((e){
          return DropdownMenuItem<String>(
            value:e.venueId.toString() ,
            child: Text(e.venueName!),
          );
        }).toList(),
        onChanged: (value) {
         viewModel.setDropdownValue(value!);
        },
      ),
    );
  }
}
