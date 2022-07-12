import 'dart:io';

import 'package:firebase_admin/firebase_admin.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseSetup {

  static App? _app;

  static App get app => _app!;

  static init() async {
    if (_app != null) {
      return;
    }

    // ignore: prefer_interpolation_to_compose_strings
    var json = "{\n" +
        "  \"type\": \"service_account\",\n" +
        "  \"project_id\": \"swift-backup-31751\",\n" +
        "  \"private_key_id\": \"2f434bdafd2456a74ad26534cc20bdc774b24ac8\",\n" +
        "  \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDRuI4hS+aeq+Eq\\ncXUG0fYDoti+qWvag6w9Mdv9DQ++8Aa8ntgblcC11TVI1D0PuQY0rvumW9YyqlpD\\na0LEfHqXbgM+1wTvylzN3yj0yBVVADmZ+WIIA7MqXJNX8CTOZ+tHKVpdRqycUQfZ\\nfI7WCbPphDbAsrMn5tS87j7bLPHgnqX/L/8H6ynHwWOcLU061N82oKQobPL7Z9Kn\\nikYGIQrE1Bj1aAMKbCunGSenUFBQ+802/7u0iwbhv64dIUF1X+71bz1cSHbiMEKP\\nia6koDoV9Vv0DVvaZZbFkPu7c9b6J3DZjJP13yG2v8E+RdCwx7Ua7JiGdOUOd/Nk\\n5b5rBZy/AgMBAAECggEAUlUKU08JYDRpBrEY+M73rnDBd4Rqp5P2y+VlkGAO1O5F\\nLsqLW7T8PUZRD2DnAeOo6IjjmWlHW4eePQaAZUPbGtThKEvgj8TZjybzXLmqCj82\\n3dhWIIBXV6OVYroPsQqCBuNYqvLCc/Gpy7uHFcckXuH9XsQo6lrIHM3JVmE8KepY\\nIEjJzgqbCHhC/lWBxmqujMpSxu6FnpY6TTqjfh02F2RF7zuaF5u979cGJHf+F9Qy\\nfYXqpAaKgDoqqmZPXTIIXbs5AIChuCzifwcK/UWEv+tpPWnr1Gxf3yEzctfExv7L\\nRmYlmkT/AUS8K8KuoqKxyxZFR+Cn/OGz6AMooDVmoQKBgQD5nst18z1XlN99KUJL\\nx8zoQc3PF4oCbXKyUD+9NtkVNNaWZaMmkCjuBFUYWBwy8pyNHdLfsnQOacz+/YdP\\n+TTQdpvSLYRtDpGO1Yazy929e00AA85rGyArqYITf4b7xjjo36ZGXTSu4SXZJFFd\\n5GpJEtbsAZlP2zaUusUt8VXgHwKBgQDXFLVea+6SAVaR5v7OILHgi0tmwxgOuhuB\\nOuY19UIoA2CfzgQj7ouug221WyHhcPS0/UlBVxD9hoXtEmNOD29s9sIJ4Pwf6GEy\\n9XZ8I7u5t84Ddt0QdF14P6TVdThviSDe6vciNHpMKnPwFhsM+y/FmB21uzNahPab\\nb/aoh+ovYQKBgQDKTouBldjicZLMArNrbYxBtItTyzUcEI5DvExcUuaPjFpaXBdl\\nerLhbPt2lnqMRBrjOAefKydqQw9Uni+bflLynR5esmtAY+1OgPoCIDkfh535ZBxY\\nrAxftqromJPS3G1lN1Wwc3vuPCWLniaf3S7S+ITdk9IoaXcMBW8ndA/wawKBgQDF\\nutoKljtbqzNFKxHxuokNH8IQFSeW0m3a3qUp0fIiCwjXoXSY/AMaSuWfJsr9EPVH\\nNtwT39FU4klZa+AzsWkEyc4VeusPAnnpeVSWR9ubn2kcMjiFmhUcKZaGTx+1GmJH\\nzcepgIk2YIj5nbj8tCh1BaW6nwFVJIv61nHy+hDHwQKBgEZyVfW8eCEDtmdh0ewt\\nvcv9E43xhXkvse78OoioE87m0NFIyPlMoWHnXpU+yC0htbSjlxsaiZba4th+m4nf\\nlYlngolippjotWatZk40cpJ9Gc3u+t2g2/a46s+Qvt3bEDdg2cqrbfYfOUU8H6Ac\\nnGsliKBzHtSa5JgGo3+dY+W4\\n-----END PRIVATE KEY-----\\n\",\n" +
        "  \"client_email\": \"firebase-adminsdk-dvsk0@swift-backup-31751.iam.gserviceaccount.com\",\n" +
        "  \"client_id\": \"101970197976432779180\",\n" +
        "  \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",\n" +
        "  \"token_uri\": \"https://oauth2.googleapis.com/token\",\n" +
        "  \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",\n" +
        "  \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-dvsk0%40swift-backup-31751.iam.gserviceaccount.com\"\n" +
        "}\n";

    Directory tempDir = await getTemporaryDirectory();
    File file = File('${tempDir.path}/service-account.json');
    await file.writeAsString(json);
    final credential = FirebaseAdmin.instance.certFromPath(file.path);
    _app = FirebaseAdmin.instance.initializeApp(
      AppOptions(
        credential: credential,
        projectId: 'swift-backup-31751',
      ),
    );
  }
}