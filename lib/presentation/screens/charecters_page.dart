import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty_app/data/models/charecter_model.dart';
import 'package:rick_morty_app/presentation/blocs/chars_bloc/chars_bloc.dart';
import 'package:rick_morty_app/presentation/screens/chars_details_page.dart';
import 'package:rick_morty_app/presentation/theme/app_colors.dart';
import 'package:rick_morty_app/resources/resources.dart';
import 'package:rick_morty_app/widgets/grid_view_widget.dart';
import 'package:rick_morty_app/widgets/list_view_widget.dart';

class CharectersPage extends StatefulWidget {
  const CharectersPage({super.key});

  @override
  State<CharectersPage> createState() => _CharectersPageState();
}

class _CharectersPageState extends State<CharectersPage> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<CharsBloc>(context).add(
      GetCharsList(),
    );
    super.initState();
  }

  bool isGridView = false;
  int charsCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (val) {
                BlocProvider.of<CharsBloc>(context).add(
                  GetCharsList(name: val),
                );
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: SvgPicture.asset(AppSvgs.search),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(AppSvgs.filter),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog.adaptive(
                        content: Column(
                          children: [
                            Text(
                              'СТАТУС',
                              style: TextStyle(
                                color: Color(0xFF5B6975),
                                fontSize: 10,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 1.60,
                                letterSpacing: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                hintText: 'Найти персонажа',
                hintStyle: const TextStyle(
                  color: Color(0XFF5B6975),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                  letterSpacing: 0.44,
                ),
                fillColor: AppColors.darkTextFillColor,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.darkTextFillColor,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              controller: controller,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'ВСЕГО ПЕРСОНАЖЕЙ: 200',
                  style: TextStyle(
                    color: Color(0XFF5B6975),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    height: 1.60,
                    letterSpacing: 1.50,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      isGridView = !isGridView;
                      setState(() {});
                    },
                    icon: SvgPicture.asset(
                      isGridView ? AppSvgs.list : AppSvgs.grid,
                    )),
              ],
            ),
            BlocBuilder<CharsBloc, CharsState>(
              builder: (context, state) {
                if (state is CharsSuccess) {
                  return isGridView
                      ? Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: state.model.results?.length ?? 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                            ),
                            itemBuilder: (context, index) => GridViewWidget(
                              character: state.model.results![index],
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.model.results?.length ?? 0,
                            itemBuilder: (context, index) => ListViewWidget(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CharsDetailsPage(
                                      data: state.model.results?[index] ??
                                          MyCharacter(),
                                    ),
                                  ),
                                );
                              },
                              character:
                                  state.model.results?[index] ?? MyCharacter(),
                            ),
                          ),
                        );
                }
                if (state is CharsError) {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset(
                          AppPngs.charsNotFound,
                          width: 260,
                        ),
                        const SizedBox(height: 28),
                        const Text(
                          'Персонаж с таким именем не найден',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0XFF5B6975),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
