import 'package:flutter/material.dart';

import '../../utils/theme.dart';
import '../../widgets/my_custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});
  static String route = "/privacy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().primary,
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, MediaQuery.of(context).size.height * 0.09),
        child: MyCustomAppBar(
          label: 'سياسة الخصوصية',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 5.0),
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          top: 40.0,
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: MaterialTheme.lightScheme().onPrimary,
          boxShadow: [
            BoxShadow(
                color: MaterialTheme.lightScheme().shadow,
                blurStyle: BlurStyle.outer,
                spreadRadius: 0,
                blurRadius: 7.0),
          ],
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(75.0), topLeft: Radius.circular(75.0)),
        ),
        child: SingleChildScrollView(
          child: Text(
            'مرحبًا بك في تطبيقنا المحمول! نحن فريق متحمس يعمل على تقديم أفضل تجربة لك. نهدف إلى تلبية احتياجاتك وتسهيل حياتك من خلال تطبيقنا.  نحن نسعى جاهدين لتقديم منتج عالي الجودة ومبتكر يلبي توقعاتك. نحن نؤمن بأهمية التصميم الجميل والواجهة السهلة الاستخدام لتحقيق تجربة ممتعة ومرضية للمستخدم.  فريقنا مكون من خبراء متخصصين في مجالات التطوير وتصميم التطبيقات المحمولة. نحن نعمل بجد لتحقيق الابتكار والتطور المستمر، ونعتبر رضاكم هو هدفنا الأول. في حالة وجود أي استفسارات أو ملاحظات، فلا تتردد في التواصل معنا. نحن هنا لمساعدتك والاستماع إلى مقترحاتك لتحسين تجربتك مع تطبيقنا. شكرًا لاختيارك تطبيقنا ونتطلع لخدمتك بأفضل ما لدينا!مرحبًا بك في تطبيقنا المحمول! نحن فريق متحمس يعمل على تقديم أفضل تجربة لك. نهدف إلى تلبية احتياجاتك وتسهيل حياتك من خلال تطبيقنا.  نحن نسعى جاهدين لتقديم منتج عالي الجودة ومبتكر يلبي توقعاتك. نحن نؤمن بأهمية التصميم الجميل والواجهة السهلة الاستخدام لتحقيق تجربة ممتعة ومرضية للمستخدم.  فريقنا مكون من خبراء متخصصين في مجالات التطوير وتصميم التطبيقات المحمولة. نحن نعمل بجد لتحقيق الابتكار والتطور المستمر، ونعتبر رضاكم هو هدفنا الأول. في حالة وجود أي استفسارات أو ملاحظات، فلا تتردد في التواصل معنا. نحن هنا لمساعدتك والاستماع إلى مقترحاتك لتحسين تجربتك مع تطبيقنا. شكرًا لاختيارك تطبيقنا ونتطلع لخدمتك بأفضل ما لدينا!مرحبًا بك في تطبيقنا المحمول! نحن فريق متحمس يعمل على تقديم أفضل تجربة لك. نهدف إلى تلبية احتياجاتك وتسهيل حياتك من خلال تطبيقنا.  نحن نسعى جاهدين لتقديم منتج عالي الجودة ومبتكر يلبي توقعاتك. نحن نؤمن بأهمية التصميم الجميل والواجهة السهلة الاستخدام لتحقيق تجربة ممتعة ومرضية للمستخدم.  فريقنا مكون من خبراء متخصصين في مجالات التطوير وتصميم التطبيقات المحمولة. نحن نعمل بجد لتحقيق الابتكار والتطور المستمر، ونعتبر رضاكم هو هدفنا الأول. في حالة وجود أي استفسارات أو ملاحظات، فلا تتردد في التواصل معنا. نحن هنا لمساعدتك والاستماع إلى مقترحاتك لتحسين تجربتك مع تطبيقنا. شكرًا لاختيارك تطبيقنا ونتطلع لخدمتك بأفضل ما لدينا!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
