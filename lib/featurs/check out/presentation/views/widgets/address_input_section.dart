import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coustom_form_textField.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.globalKey,
    this.autovalidateMode,
    required this.valueListenable,
  });
  final GlobalKey<FormState> globalKey;
  final AutovalidateMode? autovalidateMode;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder:
            (context, value, child) => Form(
              key: globalKey,
              autovalidateMode: value,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  CoustomFormTextfield(
                    onSaved: (p0) {
                      context.read<OrderEntity>().shippingAddressEntity!.name =
                          p0!; // i selected with this shape because the bottom not find here unless i make varlables and select with traditional way.
                    },
                    keyboardType: TextInputType.text,
                    hintText: 'الاسم كامل',
                  ),
                  SizedBox(height: 8),
                  CoustomFormTextfield(
                    onSaved: (p0) {
                      context.read<OrderEntity>().shippingAddressEntity!.email =
                          p0!;
                    },
                    keyboardType: TextInputType.text,
                    hintText: 'البريد الإلكتروني',
                  ),
                  SizedBox(height: 8),
                  CoustomFormTextfield(
                    onSaved: (p0) {
                      context
                          .read<OrderEntity>()
                          .shippingAddressEntity!
                          .address = p0!;
                    },
                    keyboardType: TextInputType.text,
                    hintText: 'العنوان',
                  ),
                  SizedBox(height: 8),
                  CoustomFormTextfield(
                    onSaved: (p0) {
                      context.read<OrderEntity>().shippingAddressEntity!.city =
                          p0!;
                    },
                    keyboardType: TextInputType.text,
                    hintText: 'المدينه',
                  ),
                  SizedBox(height: 8),
                  CoustomFormTextfield(
                    onSaved: (p0) {
                      context
                          .read<OrderEntity>()
                          .shippingAddressEntity!
                          .phoneNumber = p0!;
                    },
                    keyboardType: TextInputType.name,
                    hintText: 'رقم الهاتف',
                  ),
                  SizedBox(height: 8),
                  CoustomFormTextfield(
                    onSaved: (p0) {
                      context
                          .read<OrderEntity>()
                          .shippingAddressEntity!
                          .addressDeitails = p0!;
                    },
                    keyboardType: TextInputType.text,
                    hintText: 'رقم الطابق , رقم الشقه ..',
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(value: true, onChanged: (value) {}),
                      ),
                      Text(
                        'حفظ العنوان',
                        style: AppTextStyles.simibold13.copyWith(
                          color: const Color(0xFF949D9E),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 64),
                ],
              ),
            ),
      ),
    );
  }
}
