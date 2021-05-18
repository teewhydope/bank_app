import 'package:bank_app_test/common/constants/device_size/size_constants.dart';
import 'package:bank_app_test/common/screenutil/screenutil.dart';
import 'package:bank_app_test/di/get_it.dart';
import 'package:bank_app_test/domain/entities/transaction_list_entity.dart';
import 'package:bank_app_test/domain/usecases/transaction_list.dart';
import 'package:bank_app_test/presentation/blocs/get_transaction/get_transaction_cubit.dart';
import 'package:bank_app_test/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/more_app_bar.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
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
    return BlocProvider(
      create: (context) => _getTransactionsCubit,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.dimen_10,
              right: Sizes.dimen_10,
              top: Sizes.dimen_10,
            ),
            child: Container(
                height: ScreenUtil.screenHeight,
                child: Column(
                  children: [
                    MoreAppBar(),
                    Container(
                      height: ScreenUtil.defaultHeight * 0.04,
                      width: ScreenUtil.defaultWidth * 1,
                      decoration: BoxDecoration(
                          color: AppColor.kPrimaryColor,
                          borderRadius: BorderRadius.circular(Sizes.dimen_20)),
                      child: Center(
                          child: Text(
                        'All Transactions',
                        style: GoogleFonts.nunito(
                          fontSize: Sizes.dimen_20,
                          color: AppColor.kwhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                    BlocBuilder<GetTransactionCubit, GetTransactionState>(
                      builder: (context, state) {
                        if (state is GetTransactionsLoaded) {
                          return Expanded(
                            child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                itemCount: state.transactions.length,
                                itemBuilder: (context, index) {
                                  final TransactionListEntity transactionList =
                                      state.transactions.reversed
                                          .toList()[index];
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Container(
                                          width: ScreenUtil.defaultWidth * 0.3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              transactionList.type!.index
                                                          .toString() ==
                                                      '0'
                                                  ? Text(
                                                      'Credit',
                                                      style: GoogleFonts.nunito(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  : Text(
                                                      'Debit',
                                                      style: GoogleFonts.nunito(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                              SizedBox(height: Sizes.dimen_10),
                                              Text(
                                                  '₦${transactionList.amount.toString()}',
                                                  style: GoogleFonts.nunito(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Sizes.dimen_14,
                                                      color: transactionList
                                                                  .type!.index
                                                                  .toString() ==
                                                              '0'
                                                          ? Colors.green
                                                          : Colors.red))
                                            ],
                                          ),
                                        ),
                                        trailing: Text(transactionList.created
                                            .toString()
                                            .substring(0, 16)),
                                      ),
                                      Divider(),
                                    ],
                                  );
                                }),
                          );
                        } else if (state is GetTransactionsError) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                state.errorType.toString() == 'AppErrorType.api'
                                    ? 'Server Error'
                                    : 'Check your Internet Connection!',
                                style: GoogleFonts.nunito(
                                  fontSize: Sizes.dimen_18,
                                ),
                              ),
                            ),
                          );
                        }
                        return Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                  AppColor.kPrimaryColor),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
