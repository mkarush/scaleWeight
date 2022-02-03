import 'package:bloc_scale_weight/bloc/label_bloc/label_bloc.dart';
import 'package:bloc_scale_weight/bloc/weight_bloc/weight_bloc.dart';
import 'package:bloc_scale_weight/theme/constants.dart';
import 'package:bloc_scale_weight/theme/styling.dart';
import 'package:bloc_scale_weight/widgets/dropdown_label.dart';
import 'package:bloc_scale_weight/widgets/svg_widget.dart';
import 'package:bloc_scale_weight/widgets/text_widget.dart';
import 'package:bloc_scale_weight/widgets/textform_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final LabelBloc labelBloc = BlocProvider.of<LabelBloc>(context);
    final WeightBloc weightBloc = BlocProvider.of<WeightBloc>(context);

    // Getting height of screen
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //Listening to both bloc weight and labels which can change weight and label values
      body:
          BlocBuilder<WeightBloc, WeightState>(builder: (context, weightState) {
        return BlocBuilder<LabelBloc, LabelState>(builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScopeNode currentScope = FocusScope.of(context);
              if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: bubbleDiameter / 1,
                      height: screenHeight / 2,
                      decoration: bubbleBoxDecoration,
                      child:
                          Stack(alignment: Alignment.center, children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Calling TextWidget which takes text, style. Creating stateless widget for better performance and reuse code
                            TextWidget(
                                text: state.labelValue,
                                textStyle: labelTextStyle),
                            TextWidget(
                                text: weightState.weightValue,
                                textStyle: weightTextStyle),
                            TextWidget(
                                text: Constant.myLabelUnit,
                                textStyle: unitTextStyle),
                          ],
                        ),
                        Positioned(
                          bottom: screenHeight / 64,
                          width: bubbleDiameter / 1,
                          //Calling SvgWidget which takes file and create svg. Creating stateless widget for better performance and reuse code
                          child: SvgWidget(
                            file: Constant.myBackgroundGraph,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 2,
                    width: double.infinity,
                    child: Column(
                      children: [
                        //Calling DropDownLabel which takes list, value and changed function. For future we can resue this widget for repurpose
                        // label values update is handle in label_bloc. Which has 1 event update value which changes values
                        DropDownLabel(
                          label: state.labelValue,
                          userHintText: "Select a Label",
                          myLabelList: Constant.myLabelsList,
                          onChanged: (String? newValue) {
                            labelBloc.add(
                                LabelValueChangedEvent(labelValue: newValue!));
                          },
                        ),
                        //Calling TextFormWeight which takes value and changed function. For future we can resue this widget for repurpose
                        //weight values update is handle in weight_bloc. Which has 1 event update value which changes values and in future we can create various events
                        // Textform hold logic where it only allowed numbers and length is 3 currently. We can update constants
                        TextFormWeight(
                            onChanged: (String? newValue) {
                              weightBloc.add(WeightValueUpdatedEvent(
                                  weightValue: newValue!));
                            },
                            labelUserText: 'Enter your Weight',
                            maxAllowedLength: Constant.maxAllowWeightLength,
                            initialValue: weightState.weightValue),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
      }),
    );
  }
}
