<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message App README</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }
        h1, h2, h3 {
            color: #1a73e8;
        }
        ul {
            padding-left: 20px;
        }
        code {
            background-color: #f4f4f4;
            padding: 2px 4px;
            border-radius: 4px;
            font-family: "Courier New", Courier, monospace;
        }
        pre {
            background-color: #f4f4f4;
            padding: 10px;
            border-radius: 4px;
            overflow-x: auto;
        }
        img {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
        }
        blockquote {
            border-left: 4px solid #ddd;
            padding: 10px;
            background-color: #f9f9f9;
            margin: 20px 0;
            font-style: italic;
        }
        a {
            color: #1a73e8;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<h1>📱 Message App</h1>

<p><strong>Message App</strong>, Flutter kullanılarak geliştirilmiş bir mesajlaşma uygulamasıdır. Kullanıcıların güvenli ve hızlı bir şekilde iletişim kurmasını sağlayan bu uygulama, Firebase altyapısıyla entegre edilmiştir ve birçok modern özellik sunmaktadır. Proje, hem yeni başlayanlar hem de tecrübeli geliştiriciler için faydalı olacak birçok konuyu ele almaktadır.</p>

<img src="https://example.com/screenshot.png" alt="Message App Screenshot">

<h2>🚀 Başlarken</h2>

<p>Bu proje, Flutter ve Dart hakkında temel bilgiye sahip olmanızı gerektirir. Başlamak için aşağıdaki adımları takip edebilirsiniz:</p>

<h3>Kurulum</h3>

<ol>
    <li><strong>Flutter SDK</strong>'yi yükleyin: <a href="https://flutter.dev/docs/get-started/install" target="_blank">Flutter Kurulumu</a></li>
    <li>Depoyu klonlayın:</li>
    <pre><code>git clone https://github.com/kullaniciadi/message_app.git</code></pre>
    <li>Proje dizinine gidin:</li>
    <pre><code>cd message_app</code></pre>
    <li>Gerekli bağımlılıkları yükleyin:</li>
    <pre><code>flutter pub get</code></pre>
    <li>Uygulamayı başlatın:</li>
    <pre><code>flutter run</code></pre>
</ol>

<h2>📚 Kullanılan Kütüphaneler</h2>

<p>Projede kullanılan önemli kütüphaneler ve açıklamaları:</p>

<ul>
    <li><a href="https://pub.dev/packages/firebase_core" target="_blank"><strong>firebase_core</strong></a>: Firebase ile uygulama entegrasyonu.</li>
    <li><a href="https://pub.dev/packages/firebase_auth" target="_blank"><strong>firebase_auth</strong></a>: Kullanıcı oturum açma ve kimlik doğrulama işlemleri.</li>
    <li><a href="https://pub.dev/packages/cloud_firestore" target="_blank"><strong>cloud_firestore</strong></a>: Gerçek zamanlı veri tabanı yönetimi.</li>
    <li><a href="https://pub.dev/packages/http" target="_blank"><strong>http</strong></a>: HTTP istekleri ile veri alışverişi.</li>
    <li><a href="https://pub.dev/packages/webview_flutter" target="_blank"><strong>webview_flutter</strong></a>: Uygulama içerisinde web sayfalarını görüntüleme.</li>
    <li><a href="https://pub.dev/packages/url_launcher" target="_blank"><strong>url_launcher</strong></a>: Bağlantıları uygulama dışına açma.</li>
    <li><a href="https://pub.dev/packages/provider" target="_blank"><strong>provider</strong></a>: Durum yönetimi ve bağımlılık enjeksiyonu.</li>
    <li><a href="https://pub.dev/packages/image_picker" target="_blank"><strong>image_picker</strong></a>: Kullanıcıların fotoğraf seçmesini ve yüklemesini sağlama.</li>
    <li><a href="https://pub.dev/packages/emoji_picker_flutter" target="_blank"><strong>emoji_picker_flutter</strong></a>: Mesajlaşma deneyimini daha eğlenceli hale getiren emojiler.</li>
    <li><a href="https://pub.dev/packages/firebase_messaging" target="_blank"><strong>firebase_messaging</strong></a>: Gerçek zamanlı bildirimler gönderme ve alma.</li>
</ul>

<h2>✨ Özellikler</h2>

<ul>
    <li>Kullanıcı oturum açma ve kayıt sistemi</li>
    <li>Gerçek zamanlı mesajlaşma</li>
    <li>Resim ve medya paylaşımı</li>
    <li>Kullanıcı dostu arayüz</li>
    <li>Mesajlaşma esnasında emoji kullanımı</li>
    <li>Bildirim sistemi ile mesaj bildirimleri</li>
</ul>

<h2>📂 Proje Yapısı</h2>

<p>Projede temiz ve düzenli bir dosya yapısı kullanılmaktadır:</p>

<pre><code>lib/
├── main.dart
├── screens/
│   ├── login_screen.dart
│   ├── chat_screen.dart
│   └── profile_screen.dart
├── widgets/
│   ├── message_bubble.dart
│   ├── message_input.dart
│   └── custom_button.dart
├── models/
│   └── message.dart
├── services/
│   ├── auth_service.dart
│   ├── database_service.dart
│   └── notification_service.dart
└── utils/
    ├── constants.dart
    ├── styles.dart
    └── colors.dart
</code></pre>

<h2>📄 Lisans</h2>

<p>Bu proje MIT Lisansı altında lisanslanmıştır - detaylar için <a href="LICENSE" target="_blank">LICENSE</a> dosyasına göz atabilirsiniz.</p>

<h2>🛠 Katkıda Bulunma</h2>

<p>Katkıda bulunmak isterseniz, lütfen önce <a href="CONTRIBUTING.md" target="_blank">CONTRIBUTING.md</a> dosyasını okuyun. Tüm pull request'ler değerlendirilmek üzere açıktır!</p>

<h2>📧 İletişim</h2>

<p>Sorularınız veya önerileriniz için <a href="mailto:gorkemoa35@gmail.com">email@example.com</a> adresinden benimle iletişime geçebilirsiniz.</p>

<hr>

<p><strong>Geri bildirimlerinizi ve katkılarınızı bekliyorum! 😊</strong></p>

<hr>

<p>#flutter #dart #mobiluygulama #yazılım #firebase</p>

</body>
</html>
