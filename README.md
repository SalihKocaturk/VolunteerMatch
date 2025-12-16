# volunteer_match

# Volunteer Match – Kurumsal Gönüllülük ve Etkinlik Yönetim Platformu
Flutter ile geliştirilen Volunteer Match, kurumların sosyal sorumluluk etkinlikleri düzenlemesini, gönüllülerin bu etkinliklere başvurmasını ve iki tarafın da doğru eşleşmesini sağlayan modern bir mobil uygulamadır.

Bu proje; kurumsal doğrulama, etkinlik yönetimi, kullanıcı profilleri, kişilik analizi, belge yükleme, katılımcı yoklama sistemi ve gönüllü–etkinlik eşleştirme algoritması gibi gelişmiş modüller içerir.

---

## 🚀 Özellikler

### ✔ Kurumsal Modül
- **Kurum kaydı** (email doğrulama + belge yükleme)
- Vergi levhası, kuruluş belgesi, yetki belgesi vb. dosyaların PDF/Fotoğraf olarak yüklenmesi
- Çoklu dosya yükleme, görüntüleme ve silme
- Kurum onay süreci

### ✔ Etkinlik Yönetimi
- Etkinlik oluşturma (fotoğraf, açıklama, tarih, konum, minimum katılımcı vb.)
- Etkinlik detay sayfası (AddEvent + ParticipantCheck birleşimi)
- Katılımcı listeleme ve filtreleme
- Arama fonksiyonu
- **Toplu check-in / hepsini işaretle**
- Event katılımcıları için Riverpod tabanlı durum yönetimi
- QR tabanlı check-in entegrasyonuna hazır altyapı

### ✔ Gönüllü Kullanıcı Modülü
- Kullanıcı profilleri (fotoğraf, ad, katıldığı etkinlik sayısı)
- Başarımlar / rozet sistemi (opsiyonel)
- Kullanıcı detay sayfası
- Davranışsal kişilik testi (Personality Quiz)
- Etkinlik öneri algoritmasına temel oluşturan skor hesaplamaları

### ✔ Kullanıcı Kategorileri
Ana kullanıcı ekranında üç kategori bulunmaktadır:
- **Tüm kullanıcılar**
- **Başvuran kullanıcılar**
- **Daha önce çalışan kullanıcılar**

Her kategori:
- Mini avatar listesi
- “Tümünü göster” sayfasına yönlendirme
- Responsive card tasarımı içerir

### ✔ Eşleştirme Motoru (Matching System)
- Kullanıcı kişilik analizi
- Kullanıcı geçmiş etkinlik davranışları
- Etkinlik türü – kullanıcı karakter uyumu
- Temel öneri sistemi (future-ready)

---

## 🧩 Mimari Yapı

### ✔ State Management
- **Riverpod 3.x (Notifier / AsyncNotifier)**
- Feature-based klasörleme
- Provider + Notifier + Model ayrımı
- Reaktif filtreleme ve anlık listeler

### ✔ Katmanlar
lib/
│
├── core/
│   ├── widgets/
│   ├── services/
│   │   ├── document_service.dart
│   │   ├── image_service.dart
│   │   └── ...
│   ├── theme/
│   └── constants/
│
├── features/
│   ├── auth/
│   │   ├── pages/
│   │   ├── providers/
│   │   ├── notifiers/
│   │   └── widgets/
│   │
│   ├── corporate/
│   │   ├── onboarding/
│   │   ├── documents/
│   │   └── ...
│   │
│   ├── events/
│   │   ├── pages/
│   │   ├── providers/
│   │   └── widgets/
│   │
│   ├── users/
│   │   ├── pages/
│   │   ├── providers/
│   │   ├── models/
│   │   └── widgets/
│   │
│   └── personality/
│       ├── pages/
│       ├── models/
│       └── widgets/
│
└── main.dart


### ✔ Custom UI Components
- CustomTextField (search, password, normal)
- CustomImagePickerField
- CustomDatePickerField
- CustomBottomSheetField
- CustomCard
- PrimaryButton & OutlinedButton tasarımları
- EventCard, UserCategoryCard, ParticipantItem vb.

---

## 📸 Ekranlar

### Kurum Tarafı
- Kurum doğrulama & belge yükleme
- Etkinlik oluşturma
- Etkinlik detay + katılımcı yoklama

### Gönüllü Tarafı
- Kayıt / giriş
- Kişilik testi
- Etkinliklere başvuru
- Kullanıcı profil sayfası

---

## 🛠 Teknik Detaylar

### Belge Yükleme
- `file_picker` kullanılarak PDF / image destekli
- Çoklu seçim
- Kamera veya galeri seçenekleri
- Dosya ön izleme servisi

### Konum
- CustomLocationPickerField (Google Maps API için hazır yapı)

### Durum Yönetimi
- Tüm listeler reaktif ve filtrelenebilir
- UserListNotifier / ParticipantNotifier / DocumentUploadNotifier

---

## ▶️ Çalıştırma

Proje bağımlılıklarını kurun:

```bash
flutter pub get

