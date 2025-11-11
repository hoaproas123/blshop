import 'package:blshop/models/support_model.dart';

const dataSupport = [
    {
        'id': 1,
        'urlImg': 'assets/headset.png',
        'label': 'Tư vấn mua hàng',
        'info': '1900.63.64.69',
        'link': 'tel:1900636469',
    },
    {
        'id': 2,
        'urlImg': 'assets/shield.png',
        'label': 'Bảo hành',
        'info': '1900.63.69.81',
        'link': 'tel:1900636981',
    },
    {
        'id': 4,
        'urlImg': 'assets/email.png',
        'label': 'Email',
        'info': 'director@bachlongmobile.com',
        'link': 'mail to:director@bachlongmobile.com',
    },
    {
        'id': 3,
        'urlImg': 'assets/comments.png',
        'label': 'Khiếu nại',
        'info': '0938.038.038',
        'link': 'tel:0938038038',
    },

];
// Convert sang List<SupportModel>
List<SupportModel> listSupportModel = dataSupport
    .map((e) => SupportModel.fromJson(e))
    .toList();