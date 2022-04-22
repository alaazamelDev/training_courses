import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/widgets.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  // selected days count
  int _daysDropdownValue = 2;
  // selected time
  int _timeDropdownValue = 0;
  // selected hours count
  int _hoursDropdownValue = 2;
  // selected halls
  int _hallsDropdownValue = 0;

  late DropdownDatePicker _picker;

  // controller for presenter name
  final TextEditingController presenterController = TextEditingController();

  List<Map> supervisorsList = [
    {
      'name': 'Bio club',
      'is_selected': false,
    },
    {
      'name': 'Geo club',
      'is_selected': false,
    },
    {
      'name': 'Economy club',
      'is_selected': true,
    },
    {
      'name': 'Art club',
      'is_selected': true,
    },
  ];

  List<Map> requirmentsList = [
    {
      'name': 'Internet',
      'is_selected': true,
    },
    {
      'name': 'Computer',
      'is_selected': false,
    },
    {
      'name': 'Other',
      'is_selected': false,
    },
  ];

  void daysDropdownCallback(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        _daysDropdownValue = selectedValue;
      });
    }
  }

  void timeDropdownCallback(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        _timeDropdownValue = selectedValue;
      });
    }
  }

  void hoursDropdownCallback(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        _hoursDropdownValue = selectedValue;
      });
    }
  }

  void hallsDropdownCallback(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        _hallsDropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime tomorrow = now.add(const Duration(days: 1));
    final DateTime lastDate = now.add(const Duration(days: 5));

    _picker = DropdownDatePicker(
      textStyle: const TextStyle(fontSize: 12),
      initialDate: NullableValidDate(
        year: tomorrow.year,
        month: tomorrow.month,
        day: tomorrow.day,
      ),
      firstDate: ValidDate(
        year: tomorrow.year,
        month: tomorrow.month,
        day: tomorrow.day,
      ),
      lastDate: ValidDate(
        day: lastDate.day,
        month: lastDate.month,
        year: lastDate.year,
      ),
    );
    return Scaffold(
      backgroundColor: kPrimaryColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 0,
        leading: const SizedBox(),
        actions: const [
          AppBarBackButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.89,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultHorizontalPadding,
                  vertical: kDefaultVerticalPadding,
                ),
                child: Text(
                  'Request to present a\ntraining course',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: kCourseTitleFontSize,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: AlignmentDirectional.centerStart,
                        margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.075,
                        ),
                        height: double.infinity,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Date
                            _FieldWidget(
                              icon: Icons.description_outlined,
                              field: _picker,
                            ),

                            // Time
                            _FieldWidget(
                              icon: Icons.schedule_rounded,
                              field: DropdownButton(
                                hint: const Text('Time'),
                                value: _timeDropdownValue,
                                onChanged: timeDropdownCallback,
                                items: [
                                  for (var i = 0; i < 5; i++)
                                    DropdownMenuItem<int>(
                                      child: Text(
                                        '${10 + i} : ${30 + i}',
                                      ),
                                      value: i,
                                    ),
                                ],
                              ),
                            ),

                            // Days
                            _FieldWidget(
                              icon: Icons.schedule_rounded,
                              field: DropdownButton(
                                hint: const Text('Days'),
                                value: _daysDropdownValue,
                                onChanged: daysDropdownCallback,
                                items: const [
                                  DropdownMenuItem<int>(
                                    child: Text('Two days'),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Three days'),
                                    value: 3,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Four days'),
                                    value: 4,
                                  ),
                                ],
                              ),
                            ),

                            // Hours
                            _FieldWidget(
                              icon: Icons.schedule_rounded,
                              field: DropdownButton(
                                hint: const Text('Hours per day'),
                                value: _hoursDropdownValue,
                                onChanged: hoursDropdownCallback,
                                items: const [
                                  DropdownMenuItem<int>(
                                    child: Text('Two hours'),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Three hours'),
                                    value: 3,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Four hours'),
                                    value: 4,
                                  ),
                                ],
                              ),
                            ),
                            // Halls
                            _FieldWidget(
                              icon: Icons.schedule_rounded,
                              field: DropdownButton(
                                hint: const Text('Hall'),
                                value: _hallsDropdownValue,
                                onChanged: hallsDropdownCallback,
                                items: const [
                                  DropdownMenuItem<int>(
                                    child: Text('West hall'),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('East hall'),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text('North hall'),
                                    value: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        alignment: AlignmentDirectional.centerStart,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Title of the training course',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: kLabelFontSize,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.45,
                              alignment: AlignmentDirectional.center,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextFormField(
                                controller: presenterController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Course title',
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Under supervision of',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: kLabelFontSize,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.45,
                              alignment: AlignmentDirectional.center,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: DropdownButton<Map>(
                                underline: const SizedBox(),
                                isExpanded: true,
                                items: supervisorsList
                                    .map<DropdownMenuItem<Map>>((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: _SupervisorListItem(item: item),
                                  );
                                }).toList(),
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Training course topics',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: kLabelFontSize,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(8),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                expands: true,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'requirments',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: kTextFontSize * 0.8,
                              ),
                            ),
                            Wrap(
                              children: [
                                for (var item in requirmentsList)
                                  _RequirementItem(
                                    item: item,
                                    onChanged: (isSelected) {
                                      setState(() {
                                        item['is_selected'] = isSelected;
                                      });
                                    },
                                  ),
                                const SizedBox(height: 4),
                                if (requirmentsList[2]['is_selected'])
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    alignment: AlignmentDirectional.center,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'requirment',
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 24,
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/course_details',
                          arguments: {
                            'date': _picker.getDate(),
                            'time': _timeDropdownValue,
                            'days': _daysDropdownValue,
                            'hours': _hoursDropdownValue,
                            'halls': _hallsDropdownValue,
                          },
                        );
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.amber),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 24,
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SupervisorListItem extends StatefulWidget {
  const _SupervisorListItem({
    Key? key,
    this.item,
  }) : super(key: key);
  final dynamic item;

  @override
  State<_SupervisorListItem> createState() => _SupervisorListItemState();
}

class _SupervisorListItemState extends State<_SupervisorListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.item['is_selected'],
          onChanged: (value) {
            setState(() {
              widget.item['is_selected'] = value;
            });
          },
        ),
        const SizedBox(width: 8),
        Text(widget.item['name']),
      ],
    );
  }
}

class _RequirementItem extends StatelessWidget {
  const _RequirementItem({
    Key? key,
    required this.item,
    required this.onChanged,
  }) : super(key: key);
  final Map item;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.green,
          value: item['is_selected'],
          onChanged: onChanged,
        ),
        const SizedBox(width: 4),
        Text(
          item['name'],
          style: const TextStyle(color: kSecondaryColor),
        ),
      ],
    );
  }
}

class _FieldWidget extends StatelessWidget {
  const _FieldWidget({
    Key? key,
    required this.icon,
    required this.field,
  }) : super(key: key);

  final IconData icon;
  final Widget field;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: kDefaultHorizontalPadding * 0.5,
        bottom: kDefaultVerticalPadding * 0.25,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.teal,
          ),
          SizedBox(width: kDefaultHorizontalPadding * 0.5),
          field,
        ],
      ),
    );
  }
}
