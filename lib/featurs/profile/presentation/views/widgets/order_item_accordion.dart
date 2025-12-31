import 'package:accordion/accordion.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/order_entity.dart';
import 'package:flutter/material.dart';

class OrderItemAccordion extends StatelessWidget {
  const OrderItemAccordion({
    super.key,
    required this.orderEntityForOrder,
    required this.index,
    required this.listLenght,
  });
  final OrderEntityForOrderForOrders orderEntityForOrder;
  final int index;
  final int listLenght;
  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      headerBackgroundColor: const Color(0x7FF2F3F3),
      headerBackgroundColorOpened: const Color(0x7FF2F3F3),
      paddingListHorizontal: 0,
      paddingListTop: 0,
      paddingBetweenClosedSections: 0,
      paddingBetweenOpenSections: 0,
      contentBorderColor: Colors.transparent,
      flipRightIconIfOpen: true,
      disableScrolling: true,
      children: [
        AccordionSection(
          isOpen: false,
          rightIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black,
          ),
          headerPadding: const EdgeInsets.only(top: 12, bottom: 12, left: 34),

          // 🔥 الجزء اللي ظاهر فوق (العنوان)
          header: SizedBox(
            height: 117,
            child: Row(
              children: [
                Container(
                  height: 66,
                  width: 66,
                  padding: EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    color: Color(0xffE4F2E6),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(Assets.assetsOrderItem),
                ),
                SizedBox(width: 22),
                // ✔ رقم الطلب + التاريخ
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 19),
                      // رقم الطلب
                      Text(
                        'طلب رقم ${listLenght - index}#  ',
                        style: AppTextStyles.bold13,
                      ),

                      SizedBox(height: 4),

                      // التاريخ
                      Text(
                        'تم الطلب :  ${orderEntityForOrder.orderDate.substring(0, 10)}',
                        style: AppTextStyles.regular11.copyWith(
                          color: const Color(0xFF949D9E),
                        ),
                      ),

                      SizedBox(height: 6),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // عدد الطلبات
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "عدد الطلبات: ",
                                  style: AppTextStyles.regular13.copyWith(
                                    color: const Color(0xFF949D9E),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      orderEntityForOrder
                                          .orderProductEntityList
                                          .length
                                          .toString(),
                                  style: AppTextStyles.bold13.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(child: SizedBox(width: 52)),
                          // السعر
                          Text(
                            "${orderEntityForOrder.totalPrice} جنية",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 19),
                    ],
                  ),
                ),

                // ✔ الأيقونة على اليمين
              ],
            ),
          ),

          // 🔽 المحتوى اللي ينزل عند الفتح
          content: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 8,
              bottom: 12,
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "عرض التفاصيل",
                      style: TextStyle(color: Color(0xff035C32), fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
