Return-Path: <cosmin.paraschiv@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0185.outbound.protection.outlook.com [207.46.163.185])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC5F60DDF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 09:02:01 +0000 (UTC)
Received: from BY2PR03MB128.namprd03.prod.outlook.com (10.242.36.28) by
	BY2PR03MB125.namprd03.prod.outlook.com (10.242.36.14) with Microsoft
	SMTP Server (TLS) id 15.0.898.11; Wed, 19 Mar 2014 09:02:00 +0000
Received: from BY2PR03MB128.namprd03.prod.outlook.com ([169.254.5.150]) by
	BY2PR03MB128.namprd03.prod.outlook.com ([169.254.5.37]) with mapi id
	15.00.0898.005; Wed, 19 Mar 2014 09:02:00 +0000
From: "cosmin.paraschiv@freescale.com" <cosmin.paraschiv@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] gcc-runtime: Build libatomic
Thread-Index: AQHPOgqkOaUJEml5JU68hagDJ0kdAZrWUmAAgADBaACAAHAkAIAQqz+g
Date: Wed, 19 Mar 2014 09:01:59 +0000
Message-ID: <f9035df5b8954b039b30461bae114cbe@BY2PR03MB128.namprd03.prod.outlook.com>
References: <1394199544-19668-1-git-send-email-cosmin.paraschiv@freescale.com>
	<CAMKF1sq_hMS_eeF=aV4YkY6EFZP7gVgjfyabVE4p35uT8uYGRA@mail.gmail.com>
	<531B02E6.6070509@freescale.com>
	<CAMKF1spa-4iVA91hJ2co1NcOFdprvUkusfpE0NS6hzg9MeCXcg@mail.gmail.com>
In-Reply-To: <CAMKF1spa-4iVA91hJ2co1NcOFdprvUkusfpE0NS6hzg9MeCXcg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(199002)(189002)(69226001)(87266001)(19300405004)(87936001)(2656002)(74366001)(80976001)(74316001)(81686001)(81816001)(19580395003)(15975445006)(83322001)(95666003)(85306002)(74706001)(74876001)(56816005)(90146001)(83072002)(95416001)(85852003)(18717965001)(93136001)(92566001)(97336001)(97186001)(19609705001)(31966008)(81342001)(74662001)(15202345003)(81542001)(74502001)(47446002)(94316002)(86362001)(93516002)(76576001)(77096001)(76786001)(76796001)(94946001)(33646001)(555874004)(551214005)(54356001)(59766001)(77982001)(558084003)(53806001)(76482001)(56776001)(54316002)(51856001)(16236675002)(46102001)(49866001)(80022001)(47976001)(4396001)(79102001)(63696002)(47736001)(50986001)(20776003)(66066001)(65816001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB125;
	H:BY2PR03MB128.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Build libatomic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2014 09:02:02 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_f9035df5b8954b039b30461bae114cbeBY2PR03MB128namprd03pro_"

--_000_f9035df5b8954b039b30461bae114cbeBY2PR03MB128namprd03pro_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGluZyENCg==

--_000_f9035df5b8954b039b30461bae114cbeBY2PR03MB128namprd03pro_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTIgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIiwic2VyaWYi
O30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0K
CWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQphOnZpc2l0ZWQsIHNw
YW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9y
OnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnANCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCW1zby1tYXJnaW4tdG9wLWFsdDphdXRvOw0KCW1hcmdpbi1yaWdodDowaW47
DQoJbXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87DQoJbWFyZ2luLWxlZnQ6MGluOw0KCWZvbnQt
c2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IlRpbWVzIE5ldyBSb21hbiIsInNlcmlmIjt9DQpz
cGFuLkVtYWlsU3R5bGUxOA0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250
LWZhbWlseToiQ2FsaWJyaSIsInNhbnMtc2VyaWYiOw0KCWNvbG9yOiMxRjQ5N0Q7fQ0KLk1zb0No
cERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7fQ0KQHBhZ2UgV29yZFNlY3Rp
b24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBp
bjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+
PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBz
cGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4
bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIg
ZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4N
Cjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIj4NCjxkaXYgY2xh
c3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LCZxdW90O3NhbnMt
c2VyaWYmcXVvdDs7Y29sb3I6IzFGNDk3RCI+UGluZyE8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_f9035df5b8954b039b30461bae114cbeBY2PR03MB128namprd03pro_--
