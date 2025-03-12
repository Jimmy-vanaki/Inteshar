import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/config/status.dart';
import 'package:inteshar/app/core/extensions/success_color_theme.dart';
import 'package:inteshar/app/core/utils/custom_loading.dart';
import 'package:inteshar/app/features/services/data/data_source/service_api_provider.dart';

Future<dynamic> internetModalConfirm({
  required BuildContext context,
  required String price,
  required String category,
  required String classification,
  required String categoryId,
  required String type,
}) {
  final formKey = GlobalKey<FormState>();
  ServiceApiProvider serviceApiProvider = Get.put(ServiceApiProvider());
  final TextEditingController phoneController = TextEditingController(text: '');
  return showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).colorScheme.primary,
    context: context,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          alignment: Alignment.topCenter,
          height: Get.height * .42,
          child: Column(
            children: [
              Form(
                key: formKey,
                child: TextFormField(
                  textDirection: TextDirection.ltr,
                  validator: (value) {
                    if (value!.length < 10 || value.length > 10) {
                      return 'رقم الجوال غير صالح';
                    }
                    return null;
                  },
                  controller: phoneController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixText: '00964',
                    suffixStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withAlpha(200)),
                    border: const OutlineInputBorder(),
                    label: Text(
                      'رقم الهاتف',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('التصنيف :'),
                  Text(
                    classification,
                    style: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('الفئة :'),
                  Text(
                    category,
                    style: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('السعر :'),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w700),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Theme.of(context)
                        .extension<SuccessColorTheme>()
                        ?.successColor),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      serviceApiProvider.fetchTransaction(
                        phone: phoneController.text,
                        categoryId: categoryId,
                        type: type,
                        price: price,
                        category: category,
                      );
                    }
                  },
                  child: Obx(() {
                    final requestStatus =
                        serviceApiProvider.rxRequestStatus.value;

                    switch (requestStatus) {
                      case Status.loading:
                        return const Center(child: CustomLoading());

                      case Status.error:
                        return Text(
                          serviceApiProvider.errorMessage.value,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        );

                      case Status.initial:
                        return Text(
                          'تأكيد',
                          style: TextStyle(
                            color: Theme.of(context)
                                .extension<SuccessColorTheme>()
                                ?.onSuccessColor,
                          ),
                        );

                      case Status.completed:
                      default:
                        return Text(
                          'تأكيد',
                          style: TextStyle(
                            color: Theme.of(context)
                                .extension<SuccessColorTheme>()
                                ?.onSuccessColor,
                          ),
                        );
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      );
    },
  ).whenComplete(
    () {
      Get.delete<ServiceApiProvider>();
    },
  );
}
