import 'package:app/pages/models/model01_breakfast.dart';
import 'package:app/pages/models/model02_lunch.dart';
import 'package:app/pages/models/model03_salad.dart';
import 'package:app/pages/models/model04_sauces.dart';
import 'package:app/pages/models/model05_sweets.dart';
import 'package:app/pages/models/model06_drinks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsView extends StatefulWidget {
  final int itemNumber, categoryNumber;

  const DetailsView(
      {super.key, required this.itemNumber, this.categoryNumber = 0});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final List<List> _modelList = [
    breakfast,
    lunch,
    salad,
    sauces,
    sweets,
    drinks
  ];

  late List<bool> _checkedStatesIngredients;
  late List<bool> _checkedStatesSteps;

  @override
  void initState() {
    super.initState();
    _checkedStatesIngredients = List.generate(
      _modelList[widget.categoryNumber][widget.itemNumber]['ingredients']
          .length,
      (_) => false,
    );
    _checkedStatesSteps = List.generate(
      _modelList[widget.categoryNumber][widget.itemNumber]['steps'].length,
      (_) => false,
    );
  }

  late double ingredientsHeight = _modelList[widget.categoryNumber]
              [widget.itemNumber]['ingredients_count']
          .toDouble() *
      86;
  late double stepsHeight = _modelList[widget.categoryNumber][widget.itemNumber]
              ['steps_count']
          .toDouble() *
      86;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            ///Container 01 - image
            SliverAppBar(
              title: Text(_modelList[widget.categoryNumber][widget.itemNumber]
                  ['title_ar']),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  _modelList[widget.categoryNumber][widget.itemNumber]['image'],
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.primary,
              expandedHeight: MediaQuery.of(context).size.height * 0.60,
            ),

            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                    padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                    child: const Row(
                      children: [
                        Text(
                          'المقــادير',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'font'),
                        ),
                        Expanded(
                            child: Divider(
                          color: Color(0xFFA9A9A9),
                          endIndent: 20,
                          indent: 20,
                        )),
                      ],
                    )),
                SizedBox(
                  height: ingredientsHeight,
                  child: Center(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _modelList[widget.categoryNumber]
                              [widget.itemNumber]['ingredients']
                          .length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Theme.of(context).colorScheme.surface,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    offset: const Offset(0, 4),
                                    blurRadius: 4),
                              ],
                            ),
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              tristate: true,
                              title: Text(_modelList[widget.categoryNumber]
                                      [widget.itemNumber]['ingredients'][index]
                                  ['item']),
                              subtitle: Text(
                                _modelList[widget.categoryNumber]
                                        [widget.itemNumber]['ingredients']
                                    [index]['quantity'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withOpacity(0.75)),
                              ),
                              value: _checkedStatesIngredients[index],
                              onChanged: (value) {
                                setState(() {
                                  _checkedStatesIngredients[index] =
                                      value ?? false;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 8.h)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                    padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                    child: const Row(
                      children: [
                        Text(
                          'طريقة العمل',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'font'),
                        ),
                        Expanded(
                            child: Divider(
                          color: Color(0xFFA9A9A9),
                          endIndent: 20,
                          indent: 20,
                        )),
                      ],
                    )),
                SizedBox(
                  height: stepsHeight,
                  child: Center(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _modelList[widget.categoryNumber]
                              [widget.itemNumber]['steps']
                          .length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Theme.of(context).colorScheme.surface,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    offset: const Offset(0, 4),
                                    blurRadius: 4),
                              ],
                            ),
                            child: CheckboxListTile(
                              controlAffinity:
                                  ListTileControlAffinity.leading,
                              tristate: true,
                              title: Text(_modelList[widget.categoryNumber]
                                      [widget.itemNumber]['steps'][index]
                                ),
                              value: _checkedStatesSteps[index],
                              onChanged: (value) {
                                setState(() {
                                  _checkedStatesSteps[index] = value ?? false;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 8.h)
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}