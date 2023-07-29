import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gptsample/widgets/common_widgets.dart';
import 'package:gptsample/widgets/train_list_button.dart';

class TrainingListTablet extends StatelessWidget {
  const TrainingListTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          verticalSpace(16),
          Container(
            width: 251,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50)),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), border: InputBorder.none),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(
                top: 16.0, bottom: 16.0), // Set the desired top padding
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Title',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'File Type',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Status',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Updated On',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.separated(
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(top: 16.0), // Set the desired top padding
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'https://example.com',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 24,
                          height: 31.12,
                          child: SvgPicture.asset(
                            'assets/images/Icons/Group-11.svg',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 68,
                          height: 32,
                          margin: const EdgeInsets.only(right: 20),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(175, 213, 190, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Trained',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(flex: 1, child: Text('2023-6-6 16:19')),
                    const Expanded(flex: 1, child: TrainListButton())
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.1), width: 1),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
