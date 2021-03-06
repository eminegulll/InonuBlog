USE [master]
GO
/****** Object:  Database [mvcblogson]    Script Date: 16.05.2017 14:52:29 ******/
CREATE DATABASE [mvcblogson]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mvcblogson', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\mvcblogson.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mvcblogson_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\mvcblogson_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mvcblogson] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mvcblogson].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mvcblogson] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mvcblogson] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mvcblogson] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mvcblogson] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mvcblogson] SET ARITHABORT OFF 
GO
ALTER DATABASE [mvcblogson] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mvcblogson] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mvcblogson] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mvcblogson] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mvcblogson] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mvcblogson] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mvcblogson] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mvcblogson] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mvcblogson] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mvcblogson] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mvcblogson] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mvcblogson] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mvcblogson] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mvcblogson] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mvcblogson] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mvcblogson] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mvcblogson] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mvcblogson] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mvcblogson] SET  MULTI_USER 
GO
ALTER DATABASE [mvcblogson] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mvcblogson] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mvcblogson] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mvcblogson] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [mvcblogson] SET DELAYED_DURABILITY = DISABLED 
GO
USE [mvcblogson]
GO
/****** Object:  Table [dbo].[Etiket]    Script Date: 16.05.2017 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiket](
	[EtiketId] [int] IDENTITY(1,1) NOT NULL,
	[EtiketAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Etiket] PRIMARY KEY CLUSTERED 
(
	[EtiketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 16.05.2017 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Makale]    Script Date: 16.05.2017 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makale](
	[MakaleId] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](500) NULL,
	[Icerik] [nvarchar](max) NULL,
	[Foto] [nvarchar](500) NULL,
	[Tarih] [date] NULL CONSTRAINT [DF_Makale_Tarih]  DEFAULT (getdate()),
	[KategoriID] [int] NULL,
	[UyeId] [int] NULL,
	[Okunma] [int] NULL CONSTRAINT [DF_Makale_Okunma]  DEFAULT ((0)),
 CONSTRAINT [PK_Makale] PRIMARY KEY CLUSTERED 
(
	[MakaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MakaleEtiket]    Script Date: 16.05.2017 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MakaleEtiket](
	[MakaleId] [int] NOT NULL,
	[EtiketId] [int] NOT NULL,
 CONSTRAINT [PK_MakaleEtiket] PRIMARY KEY CLUSTERED 
(
	[MakaleId] ASC,
	[EtiketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Uye]    Script Date: 16.05.2017 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uye](
	[UyeId] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Sifre] [nvarchar](20) NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Foto] [nvarchar](250) NULL,
	[YetkiId] [int] NULL,
 CONSTRAINT [PK_Uye] PRIMARY KEY CLUSTERED 
(
	[UyeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Yetki]    Script Date: 16.05.2017 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yetki](
	[YetkiId] [int] IDENTITY(1,1) NOT NULL,
	[Yetki] [nvarchar](50) NULL,
 CONSTRAINT [PK_Yetki] PRIMARY KEY CLUSTERED 
(
	[YetkiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 16.05.2017 14:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorum](
	[YorumId] [int] IDENTITY(1,1) NOT NULL,
	[Icerik] [nvarchar](500) NULL,
	[UyeId] [int] NULL,
	[MakaleId] [int] NULL,
	[Tarih] [datetime] NULL CONSTRAINT [DF_Yorum_Tarih]  DEFAULT (getdate()),
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[YorumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Etiket] ON 

INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1047, N'aaa')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1052, N'')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1053, N'')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1054, N'')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1055, N'')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1056, N'teknoloji')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1057, N'haber')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1058, N'microsoft')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1059, N'')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1060, N'yazıcı')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1061, N'3d')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1062, N'yazılım')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1063, N'2017')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1064, N'etiket1')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1065, N'etiket2')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1066, N'etiket1')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1067, N'etiket2')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1068, N'etiket1')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1069, N'etiket2')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1070, N'windows')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1071, N'yazilim')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1072, N'guncelleme')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1073, N'windows10')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1078, N'yazıcı')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1079, N' 3d')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1080, N' teknoloji')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1081, N'facebook')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1082, N'akilli')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1083, N'proje')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1095, N'robot')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1096, N'sergi')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1097, N'microsoft')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1098, N'java')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1099, N'robot')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1100, N'sergi')
INSERT [dbo].[Etiket] ([EtiketId], [EtiketAdi]) VALUES (1101, N'konferans')
SET IDENTITY_INSERT [dbo].[Etiket] OFF
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (1, N'Yazılım')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (2, N'C#')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (3, N'Teknoloji')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (4, N'3D Yazıcı')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (5, N'Robotik')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (6, N'Java')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (7, N'Android')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (1008, N'İnovasyon')
SET IDENTITY_INSERT [dbo].[Kategori] OFF
SET IDENTITY_INSERT [dbo].[Makale] ON 

INSERT [dbo].[Makale] ([MakaleId], [Baslik], [Icerik], [Foto], [Tarih], [KategoriID], [UyeId], [Okunma]) VALUES (1002, N'Windows 10, her Mart ve Eylül ayında büyük güncelleme alacak', N'<p>Uzun s&uuml;redir Windows g&uuml;ncellemelerini olduk&ccedil;a ciddiye alan Microsoft, son işletim sistemi olan Windows 10&rsquo;un her Mart ve Eyl&uuml;l ayında b&uuml;y&uuml;k g&uuml;ncellemeler alacağını a&ccedil;ıkladı. Bu kararı sayesinde Windows 10 g&uuml;ncellemelerini d&uuml;zene oturtmayı ama&ccedil;layan Microsoft, 2017 yılının ilk b&uuml;y&uuml;k g&uuml;ncellemesi olan Creators Update&rsquo;i 11 Nisan tarihinde kullanıma sunmuştu. Yılın ikinci b&uuml;y&uuml;k g&uuml;ncellemesini Eyl&uuml;l ayında sunmayı planlayan Microsoft&rsquo;un en azından &ouml;n&uuml;m&uuml;zdeki birka&ccedil; yıl boyunca yola Windows 10&rsquo;la birlikte devam edeceğini s&ouml;yleyebiliriz. Her g&uuml;ncellemenin 18 ay boyunca destekleneceğini de ekleyen Microsoft, bir sonraki b&uuml;y&uuml;k Windows 10 g&uuml;ncellemesinin neler getireceği hakkında ise herhangi bir a&ccedil;ıklama yapmadı. Eyl&uuml;l ayında yayınlanması beklenen bir sonraki b&uuml;y&uuml;k g&uuml;ncellemenin Redstone 3 kod adına sahip olduğunu ve Windows Insiders programı i&ccedil;erisinde test s&uuml;recine başladığını da belirtelim. &Ouml;zellikle arka planda &ccedil;alışan uygulamaların daha iyi kontrol edilmesini sağlayarak pil tasarrufu sağlaması beklenen Redstone 3 g&uuml;ncellemesi, ilk olarak Creators Update&rsquo;in test s&uuml;recinde karşımıza &ccedil;ıkan g&ouml;rev &ccedil;ubuğuna da sahip olacak. Son olarak Microsoft&rsquo;un Project Neon adı altında &ccedil;eşitli tasarım değişiklikleri &uuml;zerinde &ccedil;alıştığını ve Redstone 3 g&uuml;ncellemesi ile Windows 10&rsquo;un tasarımının b&uuml;y&uuml;k oranda değişebileceğini de ekleyelim.</p>', N'/Uploads/MakaleFoto/b9306986-f9bb-4bf0-8538-507aa16a09c4.jpg', CAST(N'2017-04-22' AS Date), 1, 2, 5)
INSERT [dbo].[Makale] ([MakaleId], [Baslik], [Icerik], [Foto], [Tarih], [KategoriID], [UyeId], [Okunma]) VALUES (1003, N'C Sharp', N'C# Programlama Dili (si şarp şeklinde telaffuz edilir), Microsoft''un geliştirmiş olduğu yeni nesil programlama dilidir. Yine Microsoft tarafından geliştirilmiş .NET Teknolojisi için geliştirilmiş dillerden biridir. Microsoft tarafından geliştirilmiş olsa da ECMA ve ISO standartları altına alınmıştır. C programlama dilinde bir tamsayı değişkeni 1 atırmak için ++ soneki kullanılır. C++ dili adını, C diliyle Nesneye Yönelimli Programlama yapabilmek için eklentiler (C With Classes) almıştır. Benzer şekilde C++ diline yeni eklentiler yapılarak ((C++)++) bir adım daha ileriye götürülmüş ve tamamen nesneye yönelik tasarlanmış C# dilinin isimlendirilmesinde, + karakterlerinin birbirlerine yakınlaşmış hali ve bir melodi anahtarı olan C# Major kullanılmıştır. Bu dilin tasarlanmasına Pascal, Delphi derleyicileri ve J++ programlama dilinin tasarımlarıyla bilinen Anders Hejlsberg liderlik etmiştir. Birçok alanda Java''yı kendisine örnek alır ve C# da java gibi C ve C++ kod sözdizimine benzer bir kod yapısındadır. .NET kütüphanelerini kullanmak amacıyla yazılan programların çalıştığı bilgisayarlarda uyumlu bir kütüphanenin ve yorumlayıcının bulunması gereklidir. Bu, Microsoft''un .Net Framework''u olabileceği gibi ECMA standartlarına uygun herhangi bir kütüphane ve yorumlayıcı da olabilir. Yaygın diğer kütüphanelere örnek olarak Portable.Net ve Mono verilebilir. Özellikle nesne yönelimli programlama kavramının gelişmesine katkıda bulunan en aktif programlama dillerinden biridir .NET platformunun anadili olduğu bazı kesimler tarafından kabul görse de bazıları bunun doğru olmadığını savunur. C#, .NET orta seviyeli programlama dillerindendir. Yani hem makine diline hem de insan algısına eşit seviyededir. Buradaki orta ifadesi dilin gücünü değil makine dili ile günlük konuşma diline olan mesafesini göstermektedir. Örneğin; Visual Basic .NET (VB.NET) yüksek seviyeli bir dildir dersek bu, dilin insanların günlük yaşantılarında konuşma biçimine yakın şekilde yazıldığını ifade etmektedir. Dolayısıyla VB.NET, C#.NET''ten daha güçlü bir dildir diyemeyiz. Programın çalışması istenen bilgisayarlarda framework kurulu olması gerekmektedir. (Windows 7 ve Windows Vista''da .NET Framework kuruludur)', N'/Uploads/MakaleFoto/cc5eff95-bd5c-4a29-89ba-9405b9c27ae2.jpg', CAST(N'2017-04-22' AS Date), 2, 2, 6)
INSERT [dbo].[Makale] ([MakaleId], [Baslik], [Icerik], [Foto], [Tarih], [KategoriID], [UyeId], [Okunma]) VALUES (1029, N'Yazıcı Sesinden Hırsızlık Yapılabilir!', N'Özel yazılımlara sahip cep telefonlarının üç boyutlu yazıcıların sadece yakınında bulunarak bile yazıcıların ürettiği tasarımları çalabildiği ortaya çıktı! 3D yazıcılar son bir kaç yıldır inanılmaz bir hızla gelişmeye devam ediyor. Her geçen gün yeni bir sektöre katkıda bulunan 3D yazıcılar geleceğin önemli üretim Teknolojilerinden birisi olacak.  Fakat Slahdot isimli bir Forum sitesinde ortaya çıkan ilginç hırsızlık yöntemi dünyayı hayretler içerisinde bıraktı. Üç boyutlu yazıcıların sadece yakınında bulunarak dahi üretilen malzemenin tasarımını %94 oranında doğru bir şekilde kopyalayabildiği tespit edildi.  Buffalo Üniversitesi tarafından yapılan çalışma sonucunda özel yazılımlar yüklenmiş bir akıllı telefonun, üç boyutlu yazıcı ile arasında 20 cm mesafe olmasına rağmen yazıcının ürettiği ses ve elektromanyetik radyasyon sayesinde yazıcının hareketleri hakkında detaylı bilgiyi ele geçirebildiği tespit edildi. 3D yazıcılar güvenlik konusunda oldukça başarılı olmasına karşın akıllı telefonlardan gelen saldırılara karşı savunması kalabiliyor.  Bu saldırı nedeniyle 3D yazıcıların çalışma mantığı bile değişebilir. Gelecekte devletler tarafından dahi özel projelerde kullanılması planlanan 3D yazıcıların bu tarz saldırılara karşı dirençli olması gerekiyor. ', N'/Uploads/MakaleFoto/001ea791-dbf3-4bf1-94c5-0b6c65c55602.jpg', CAST(N'2017-04-23' AS Date), 4, 2, 4)
INSERT [dbo].[Makale] ([MakaleId], [Baslik], [Icerik], [Foto], [Tarih], [KategoriID], [UyeId], [Okunma]) VALUES (1030, N'Facebook düşünceyle yazma ve tenle işitme teknolojileri geliştiriyor...', N'Facebook’un rotasını Sanal Gerçeklik (VR) başta olmak üzere alternatif gerçekliklere çevirmesi, şirketin yeni teknolojilerle ufuk açıcı çalışmalara imza atmasını sağlıyor. Bu teknolojilere odaklanan Building 8 birimini bir süre önce duyuran Facebook, birimin geliştirmeye devam ettiği teknolojileri f8 konferansında tanıttı. İnsan beynini doğrudan bilgisayarlara bağlayacak yeni yollar deneyen şirket, doğrudan beyin kontrolüne odaklanıyor.  f8 konferansında DARPA ve Google’dan sonra Building 8’in başına geçen Regina Dugan, bu teknolojiyi “Artırılmış Gerçeklik (AR) için beyin faresi” şeklinde tanımlıyor. Yani arayüz, vücudun hareketini takip etmeye gerek kalmadan doğrudan sinirsel aktivitenizi izliyor. Şirketin 60 mühendisle birlikte geliştirdiği teknoloji, bu sayede insanların düşüncelerini takip ederek, arada bir başka fiziksel eyleme gerek kalmadan, bilgisayarla etkileşime girebiliyor. Dugan’ın öne çıkardığı iki etkileşimden ilki yazı. Altı aydır beyinle yazma teknolojisi üzerinde çalışan Facebook, insanların yazı yazmak için akıllarından kelimeleri geçirmelerinin yeterli olacağı bir arayüz geliştirmek istiyor. Amaç, ilk etapta dakikada 100 kelime yazmak ki bu bugün telefonla yapabildiğimizde 5 kat daha hızlı. Önemli bir ayrımın altını çizden Dugan, Facebook’un rastgele düşünceleri okuyacak bir teknoloji geliştirmediğini söylüyor. Beyin dalgalarının deşifre edilebilmesi için beyinde konuşmaya dönüştürülmeye hazır düşünceler olması gerekiyor. Felçli ya da konuşma engelli insanlar bu, oldukça anlamlı bir ilerleme olabilir. Diğer taraftan Facebook, “Paylaş” butonunu doğrudan beynimize entegre ediyor. Bu teknoloji ileri aşamada VR ve AR deneyimleri için bugün hayal bile edemeyeceğimiz ilerlemeler sağlayabilir.  Zuckerberg’in not ettiği gibi beynimiz her saniye dört adet HD film yayınlayacak kadar çok veri ortaya çıkarıyor. Bilgisayar etkileşimimizin ne kadar verimsiz olduğunu ortaya koyan veriler, yalnız Zuckerberg’i değil, Elon Musk’tan Bryan Johnson’a öncü teknoloji girişimcilerini heyecanlandırıyor.  f8’de öne çıkan “sessiz konuşma arayüzleri”nin ikincisi insanın tenle duymasını sağlıyor. Açıklamaya göre Building 8 ekibi, insan teninin kulaktaki salyangozun özelliklerini taklit etmesini sağlayacak donanım ve yazılım teknolojileri geliştiriyor.  Teknoloji sayesinde insan derisi ses duyarlı hale geliyor ve işitme kulağa bağlı bir duyu olmaktan çıkıyor.  Dugan “Çok da uzak gelecekte olmayan bir gün, ben Mandarin dilinde düşünürken sizin beni o anda İspanyolca dilince hissetmeniz mümkün olabilir” diyor. Hayal etmesi de denemesi de keyifli bu yolculukta Facebook, insan beynini doğrudan bilgisayarlara bağlayacak en güçlü adaylardan biri olarak beliriyor.', N'/Uploads/MakaleFoto/d2ff1aae-2a11-420e-b674-b272981b96b3.jpg', CAST(N'2017-04-26' AS Date), 1, 2, 18)
INSERT [dbo].[Makale] ([MakaleId], [Baslik], [Icerik], [Foto], [Tarih], [KategoriID], [UyeId], [Okunma]) VALUES (1035, N'Robocot bu Cuma!..', N'Robocot bu Cuma!.. Robocot bu Cuma!..Robocot bu Cuma!..Robocot bu Cuma!..Robocot bu Cuma!..Robocot bu Cuma!..Robocot bu Cuma!..Robocot bu Cuma!..Robocot bu Cuma!..Robocot bu Cuma!..', N'/Uploads/MakaleFoto/4845b3f7-531c-4aba-9554-c2f672f92d0f.png', CAST(N'2017-05-02' AS Date), 1, 2, 9)
INSERT [dbo].[Makale] ([MakaleId], [Baslik], [Icerik], [Foto], [Tarih], [KategoriID], [UyeId], [Okunma]) VALUES (1036, N'Microsoft Javaya da el atacak!', N'Microsoft Javaya da el atacak!Microsoft Javaya da el atacak!Microsoft Javaya da el atacak!Microsoft Javaya da el atacak!Microsoft Javaya da el atacak!Microsoft Javaya da el atacak!Microsoft Javaya da el atacak!Microsoft Javaya da el atacak!', N'/Uploads/MakaleFoto/efc2dd21-c55e-4d79-a92a-ae4227ef5599.png', CAST(N'2017-05-02' AS Date), 1, 2, 5)
INSERT [dbo].[Makale] ([MakaleId], [Baslik], [Icerik], [Foto], [Tarih], [KategoriID], [UyeId], [Okunma]) VALUES (1037, N'Malatya''da Robocot Sona Erdi...! ', N'<p>Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...! Malatya''da Robocot Sona Erdi...!</p>', N'/Uploads/MakaleFoto/629011c9-4477-4263-817a-c762d95d67db.jpg', CAST(N'2017-05-07' AS Date), 1, 3, 15)
SET IDENTITY_INSERT [dbo].[Makale] OFF
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1002, 1056)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1003, 1057)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1029, 1078)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1029, 1079)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1029, 1080)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1030, 1081)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1030, 1082)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1030, 1083)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1035, 1095)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1035, 1096)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1036, 1097)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1036, 1098)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1037, 1099)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1037, 1100)
INSERT [dbo].[MakaleEtiket] ([MakaleId], [EtiketId]) VALUES (1037, 1101)
SET IDENTITY_INSERT [dbo].[Uye] ON 

INSERT [dbo].[Uye] ([UyeId], [KullaniciAdi], [Email], [Sifre], [AdSoyad], [Foto], [YetkiId]) VALUES (2, N'Emine', N'emine@emine.com', N'123456', N'Emine Gül', N'/Uploads/UyeFoto/b4d18096-d28c-423d-9ee6-92e0e2a2b15d.jpg', 1)
INSERT [dbo].[Uye] ([UyeId], [KullaniciAdi], [Email], [Sifre], [AdSoyad], [Foto], [YetkiId]) VALUES (3, N'Ali', N'ali@ali.com', N'123456', N'Ali Can', N'/Uploads/UyeFoto/491e6754-f231-4b04-8177-b782ca0dc43e.jpg', 1)
INSERT [dbo].[Uye] ([UyeId], [KullaniciAdi], [Email], [Sifre], [AdSoyad], [Foto], [YetkiId]) VALUES (1002, N'test', N'test', N'123', N'test test', N'C:\Users\lenovo\Desktop\Masaüstü\CV and other stuff\foto.jpg', 2)
INSERT [dbo].[Uye] ([UyeId], [KullaniciAdi], [Email], [Sifre], [AdSoyad], [Foto], [YetkiId]) VALUES (1003, N'test2', N'test2@test2.com', N'123', N'test2', N'/Uploads/UyeFoto/5e99b418-7937-44ef-9552-3b41fdf30818.jpg', 2)
SET IDENTITY_INSERT [dbo].[Uye] OFF
SET IDENTITY_INSERT [dbo].[Yetki] ON 

INSERT [dbo].[Yetki] ([YetkiId], [Yetki]) VALUES (1, N'Admin')
INSERT [dbo].[Yetki] ([YetkiId], [Yetki]) VALUES (2, N'Üye')
SET IDENTITY_INSERT [dbo].[Yetki] OFF
SET IDENTITY_INSERT [dbo].[Yorum] ON 

INSERT [dbo].[Yorum] ([YorumId], [Icerik], [UyeId], [MakaleId], [Tarih]) VALUES (3, N'Çok Faydalı olmuş!!', 2, 1003, CAST(N'2017-04-26 00:47:26.693' AS DateTime))
INSERT [dbo].[Yorum] ([YorumId], [Icerik], [UyeId], [MakaleId], [Tarih]) VALUES (4, N'denemeee', 2, 1003, CAST(N'2017-04-26 00:48:11.847' AS DateTime))
INSERT [dbo].[Yorum] ([YorumId], [Icerik], [UyeId], [MakaleId], [Tarih]) VALUES (8, N'sdsd', 2, 1030, CAST(N'2017-04-26 09:01:23.440' AS DateTime))
INSERT [dbo].[Yorum] ([YorumId], [Icerik], [UyeId], [MakaleId], [Tarih]) VALUES (10, N'Son Yorum', 2, 1036, CAST(N'2017-05-08 22:59:32.660' AS DateTime))
INSERT [dbo].[Yorum] ([YorumId], [Icerik], [UyeId], [MakaleId], [Tarih]) VALUES (11, N'dfxsdfdf', 1003, 1035, CAST(N'2017-05-12 15:32:11.077' AS DateTime))
SET IDENTITY_INSERT [dbo].[Yorum] OFF
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kategori] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategori] ([KategoriId])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kategori]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Uye] FOREIGN KEY([UyeId])
REFERENCES [dbo].[Uye] ([UyeId])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Uye]
GO
ALTER TABLE [dbo].[MakaleEtiket]  WITH CHECK ADD  CONSTRAINT [FK_MakaleEtiket_Etiket] FOREIGN KEY([EtiketId])
REFERENCES [dbo].[Etiket] ([EtiketId])
GO
ALTER TABLE [dbo].[MakaleEtiket] CHECK CONSTRAINT [FK_MakaleEtiket_Etiket]
GO
ALTER TABLE [dbo].[MakaleEtiket]  WITH CHECK ADD  CONSTRAINT [FK_MakaleEtiket_Makale] FOREIGN KEY([MakaleId])
REFERENCES [dbo].[Makale] ([MakaleId])
GO
ALTER TABLE [dbo].[MakaleEtiket] CHECK CONSTRAINT [FK_MakaleEtiket_Makale]
GO
ALTER TABLE [dbo].[Uye]  WITH CHECK ADD  CONSTRAINT [FK_Uye_Yetki] FOREIGN KEY([YetkiId])
REFERENCES [dbo].[Yetki] ([YetkiId])
GO
ALTER TABLE [dbo].[Uye] CHECK CONSTRAINT [FK_Uye_Yetki]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Uye] FOREIGN KEY([UyeId])
REFERENCES [dbo].[Uye] ([UyeId])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Uye]
GO
USE [master]
GO
ALTER DATABASE [mvcblogson] SET  READ_WRITE 
GO
