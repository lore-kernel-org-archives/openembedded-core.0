Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.27471.1590973427312891779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 18:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,458,1583164800"; 
   d="scan'208";a="93490281"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Jun 2020 09:03:39 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 5AACC4BCC885;
	Mon,  1 Jun 2020 09:03:39 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 1 Jun 2020 09:03:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::a02b:f831:342:223])
 by G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::a02b:f831:342:223%14]) with mapi
 id 15.00.1497.006; Mon, 1 Jun 2020 09:03:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-setuptools:upgrade 45.2.0 -> 47.1.1
Thread-Topic: [OE-core] [PATCH] python3-setuptools:upgrade 45.2.0 -> 47.1.1
Thread-Index: AQHWNZDCS6dz+d1gRkCv/gNTuC/bpKjCZJ6AgACQizA=
Date: Mon, 1 Jun 2020 01:03:42 +0000
Message-ID: <b7e6b91ece4e43a594113456040b105c@G08CNEXMBPEKD04.g08.fujitsu.local>
References: <1590772282-43066-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1590772282-43066-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <CAMKF1sqXOp88HSgjgHBqyq_=LT7hJnnAgaYg79NfmpPDXu_1mg@mail.gmail.com>
In-Reply-To: <CAMKF1sqXOp88HSgjgHBqyq_=LT7hJnnAgaYg79NfmpPDXu_1mg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 5AACC4BCC885.AB974
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBhbSBpbnZlc3RpZ2F0aW5nLCBhbmQgcGF0Y2h2MiB3aWxsIGJlIHNlbnQgYWZ0ZXIgdGhlIGlu
dmVzdGlnYXRpb24gaXMgc3VjY2Vzc2Z1bC4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IA0KU2VudDogTW9uZGF5LCBKdW5l
IDEsIDIwMjAgODoyNCBBTQ0KVG86IFphbmcsIFJ1b2NoZW4v6IenIOiLpeWwmCA8emFuZ3JjLmZu
c3RAY24uZnVqaXRzdS5jb20+DQpDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhl
IG9lLWNvcmUgbGF5ZXIgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gcHl0aG9uMy1zZXR1cHRvb2xzOnVwZ3Jh
ZGUgNDUuMi4wIC0+IDQ3LjEuMQ0KDQpUaGlzIGZhaWxzIHpvcGVpbnRlcmZhY2UgbW9kdWxlIGJ1
aWxkcyBzZWUNCg0KaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWls
cy80MTQ2NTAvDQoNCk9uIEZyaSwgTWF5IDI5LCAyMDIwIGF0IDE6MTEgQU0gemFuZ3JjIDx6YW5n
cmMuZm5zdEBjbi5mdWppdHN1LmNvbT4gd3JvdGU6DQo+DQo+IFNpZ25lZC1vZmYtYnk6IFphbmcg
UnVvY2hlbiA8emFuZ3JjLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tc2V0dXB0b29scy5pbmMgIHwgIDQgKystLQ0KPiAg
Li4uLzAwMDEtY2hhbmdlLXNoZWJhbmctdG8tcHl0aG9uMy5wYXRjaCAgICAgICAgICAgIHwgMTMg
Ky0tLS0tLS0tLS0tLQ0KPiAgLi4udG9vbHNfNDUuMi4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29s
c180Ny4xLjEuYmJ9IHwgIDANCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
NCBkZWxldGlvbnMoLSkgIHJlbmFtZSANCj4gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97
cHl0aG9uMy1zZXR1cHRvb2xzXzQ1LjIuMC5iYiA9PiANCj4gcHl0aG9uMy1zZXR1cHRvb2xzXzQ3
LjEuMS5iYn0gKDEwMCUpDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbi1zZXR1cHRvb2xzLmluYyANCj4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbi1zZXR1cHRvb2xzLmluYw0KPiBpbmRleCBlOWFkOTNkYmVlLi5jOTFjY2E5
ZjA2IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1z
ZXR1cHRvb2xzLmluYw0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bi1zZXR1cHRvb2xzLmluYw0KPiBAQCAtMTIsOCArMTIsOCBAQCBTUkNfVVJJX2FwcGVuZF9jbGFz
cy1uYXRpdmUgPSAiIA0KPiBmaWxlOi8vMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1j
b2RlLWJ5LWUNCj4NCj4gIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLWNoYW5nZS1zaGViYW5nLXRv
LXB5dGhvbjMucGF0Y2giDQo+DQo+IC1TUkNfVVJJW21kNXN1bV0gPSAiMGM5NTZlZWExNDJhZjlj
MmIwMmQ3MmUzYzA0MmFmMzAiDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODljNmU2MDExZWMy
ZjZkNTdkNDNhM2Y5Mjk2YzRlZjAyMmMyY2JmNDliYWIyNmI0MDdmZTY3OTkyYWUzMzk3ZiINCj4g
K1NSQ19VUklbbWQ1c3VtXSA9ICI2ZTlkZTkwYjI0MmZkZDYwZWY1OWY0OTc0MjRjZTEzYSINCj4g
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxNDVmYTYyYjlkN2JiNTQ0ZmNlMTZlOWI1YTliZjRhYjIw
MzJkMmY3NThiN2NkNjc0YWYwOWE5MjczNmFmZjc0Ig0KPg0KPiAgREVQRU5EUyArPSAiJHtQWVRI
T05fUE59Ig0KPg0KPiBkaWZmIC0tZ2l0IA0KPiBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY2hhbmdlLXNoZWJhbmctDQo+IHRvLXB5dGhvbjMu
cGF0Y2ggDQo+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9v
bHMvMDAwMS1jaGFuZ2Utc2hlYmFuZy0NCj4gdG8tcHl0aG9uMy5wYXRjaA0KPiBpbmRleCAzM2Fm
OGRhZWQ3Li42ZGNmNTI3NzFiIDEwMDY0NA0KPiAtLS0gDQo+IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jaGFuZ2Utc2hlYmFuZy0NCj4gdG8t
cHl0aG9uMy5wYXRjaA0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29scy8wMDAxLWNoYW5nZS1zaGViDQo+ICsrKyBhbmctdG8tcHl0aG9uMy5wYXRj
aA0KPiBAQCAtOCw4ICs4LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQo+ICBTaWduZWQt
b2ZmLWJ5OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPg0KPiAgLS0t
DQo+ICAgcGtnX3Jlc291cmNlcy9fdmVuZG9yL2FwcGRpcnMucHkgICB8IDIgKy0NCj4gLSBzZXR1
cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5IHwgMiArLQ0KPiAtIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiArIDEgZmlsZXMgY2hhbmdlZCwg
MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKQ0KPg0KPiAgZGlmZiAtLWdpdCBhL3BrZ19y
ZXNvdXJjZXMvX3ZlbmRvci9hcHBkaXJzLnB5IA0KPiBiL3BrZ19yZXNvdXJjZXMvX3ZlbmRvci9h
cHBkaXJzLnB5DQo+ICBpbmRleCBhZTY3MDAxLi45MzNlMzk4IDEwMDY0NA0KPiBAQCAtMjEsMTYg
KzIwLDYgQEAgaW5kZXggYWU2NzAwMS4uOTMzZTM5OCAxMDA2NDQNCj4gICAjIC0qLSBjb2Rpbmc6
IHV0Zi04IC0qLQ0KPiAgICMgQ29weXJpZ2h0IChjKSAyMDA1LTIwMTAgQWN0aXZlU3RhdGUgU29m
dHdhcmUgSW5jLg0KPiAgICMgQ29weXJpZ2h0IChjKSAyMDEzIEVkZHkgUGV0cmnImW9yDQo+IC1k
aWZmIC0tZ2l0IGEvc2V0dXB0b29scy9jb21tYW5kL2Vhc3lfaW5zdGFsbC5weSANCj4gYi9zZXR1
cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5DQo+IC1pbmRleCBhYmNhMWFlLi42YmNkYzk4
IDEwMDY0NA0KPiAtLS0tIGEvc2V0dXB0b29scy9jb21tYW5kL2Vhc3lfaW5zdGFsbC5weQ0KPiAt
KysrIGIvc2V0dXB0b29scy9jb21tYW5kL2Vhc3lfaW5zdGFsbC5weQ0KPiAtQEAgLTEsNCArMSw0
IEBADQo+IC0tIyEvdXNyL2Jpbi9lbnYgcHl0aG9uDQo+IC0rIyEvdXNyL2Jpbi9lbnYgcHl0aG9u
Mw0KPiAtICIiIg0KPiAtIEVhc3kgSW5zdGFsbA0KPiAtIC0tLS0tLS0tLS0tLQ0KPiAgLS0NCj4g
IDIuMjQuMQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHNfNDUuMi4wLmJiIA0KPiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzQ3LjEuMS5iYg0KPiBzaW1pbGFyaXR5IGluZGV4IDEw
MCUNCj4gcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHNfNDUuMi4wLmJiDQo+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc2V0dXB0b29sc180Ny4xLjEuYmINCj4gLS0NCj4gMi4xNy4xDQo+DQo+DQo+
DQo+IA0KDQoNCgoK
