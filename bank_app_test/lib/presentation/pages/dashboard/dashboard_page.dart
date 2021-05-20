import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/di/get_it.dart';
import 'package:bank_app_test/domain/usecases/transaction_list.dart';
import 'package:bank_app_test/presentation/blocs/get_transaction/get_transaction_cubit.dart';
import 'package:bank_app_test/presentation/pages/dashboard/components/savings_account_card.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/main_ad_card.dart';
import 'components/main_app_bar.dart';
import 'components/visualize.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  late GetTransactionCubit _getTransactionsCubit;
  late TransactionList? transactionList;

  @override
  void initState() {
    super.initState();
    _getTransactionsCubit = getItInstance<GetTransactionCubit>();
    _getTransactionsCubit.loadTransaction();
  }

  @override
  void dispose() {
    super.dispose();
    _getTransactionsCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _getTransactionsCubit,
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColor.kPrimaryColor,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              left: Sizes.dimen_16,
              right: Sizes.dimen_16,
              top: Sizes.dimen_16,
            ),
            child: CustomScrollView(
              key: PageStorageKey<String>("main"),
              slivers: [
                SliverAppBar(
                  titleSpacing: 10,
                  title: MainAppBar(),
                  backgroundColor: Color(0xff343B57),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: Sizes.dimen_10),
                      MainAdCard(
                        title: "Welcome back",
                        content: "Animasahun Ibrahim Omotayo",
                      ),
                      SizedBox(height: Sizes.dimen_10),
                      SavingsAccountCard(),
                      SizedBox(height: Sizes.dimen_10),
                      BlocBuilder<GetTransactionCubit, GetTransactionState>(
                        builder: (context, state) {
                          if (state is GetTransactionsLoaded) {
                            return ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.dimen_10),
                                  color: AppColor.kwhiteColor,
                                ),
                                height: ScreenUtil.defaultHeight * 0.3,
                                child: Visualize(
                                  transactionLists: state.transactions,
                                ),
                              ),
                            );
                          }
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Sizes.dimen_10),
                              color: AppColor.kwhiteColor,
                            ),
                            height: ScreenUtil.defaultHeight * 0.3,
                          );
                        },
                      ),
                    ],
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
