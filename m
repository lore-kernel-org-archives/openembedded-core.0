Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2294178285
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 02:46:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35393546"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2018 10:46:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5AC5E49F5B38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 10:46:09 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([169.254.1.181]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0361.001; Wed, 17 Jan 2018 10:46:08 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] glibc:CVE-2017-17426
Thread-Index: AQHTeWoR+aEuh6aclkmdRxKj8FwOG6N3h7Kg
Date: Wed, 17 Jan 2018 02:46:08 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C63B59397A@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1513757451-829-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1513757451-829-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.130.24
dlp-reaction: no-action
x-originating-ip: [10.167.225.125]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 5AC5E49F5B38.AAC8D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] glibc:CVE-2017-17426
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
X-List-Received-Date: Wed, 17 Jan 2018 02:46:15 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogSHVhbmcsIFFpeXUgDQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIg
MjAsIDIwMTcgNDoxMSBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogSHVhbmcsIFFpeXUgPGh1YW5n
cXkuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gU3ViamVjdDogW09FLWNvcmVd
W1BBVENIXSBnbGliYzpDVkUtMjAxNy0xNzQyNg0KPiANCj4gRml4IHRoZSBD
VkUtMjAxNy0xNzQyNi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFFp
eXUgPGh1YW5ncXkuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICAu
Li4tb3ZlcmZsb3ctaW4tbWFsbG9jLXdoZW4tdGNhY2hlLWlzLWVuYWJsZS5w
YXRjaCB8IDUyDQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gIG1ldGEv
cmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMjYuYmIgICAgICAgICAgICAg
IHwgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCsp
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYmMvZ2xpYmMvMDAyOS1GaXgtaW50ZWdlci1vdmVyZmxvdy1pbi1tYWxs
b2Mtd2hlbi10Y2FjaGUNCj4gLWlzLWVuYWJsZS5wYXRjaA0KPiANCj4gZGlm
ZiAtLWdpdA0KPiBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjLzAw
MjktRml4LWludGVnZXItb3ZlcmZsb3ctaW4tbWFsbG9jLXdoZW4tdGNhYw0K
PiBoZS1pcy1lbmFibGUucGF0Y2gNCj4gYi9tZXRhL3JlY2lwZXMtY29yZS9n
bGliYy9nbGliYy8wMDI5LUZpeC1pbnRlZ2VyLW92ZXJmbG93LWluLW1hbGxv
Yy13aGVuLXRjYWMNCj4gaGUtaXMtZW5hYmxlLnBhdGNoDQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLjYyM2JlZDcNCj4gLS0t
IC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9n
bGliYy8wMDI5LUZpeC1pbnRlZ2VyLW92ZXJmbG93LWluLW1hbGxvYy0NCj4g
KysrIHdoZW4tdGNhY2hlLWlzLWVuYWJsZS5wYXRjaA0KPiBAQCAtMCwwICsx
LDUyIEBADQo+ICtGcm9tIDM0Njk3Njk0ZThhOTNiMzI1YjE4ZjI1ZjdkY2Rl
ZDU1ZDZiYWVhZjYgTW9uIFNlcCAxNyAwMDowMDowMA0KPiAyMDAxDQo+ICtG
cm9tOiBBcmp1biBTaGFua2FyIDxhcmp1bkByZWRoYXQuY29tPg0KPiArRGF0
ZTogVGh1LCAzMCBOb3YgMjAxNyAxMzozMTo0NSArMDEwMA0KPiArU3ViamVj
dDogW1BBVENIXSBGaXggaW50ZWdlciBvdmVyZmxvdyBpbiBtYWxsb2Mgd2hl
biB0Y2FjaGUgaXMgZW5hYmxlZA0KPiArW0JaICAjMjIzNzVdDQo+ICsNCj4g
K1doZW4gdGhlIHBlci10aHJlYWQgY2FjaGUgaXMgZW5hYmxlZCwgX19saWJj
X21hbGxvYyB1c2VzIHJlcXVlc3Qyc2l6ZQ0KPiArKHdoaWNoIGRvZXMgbm90
IHBlcmZvcm0gYW4gb3ZlcmZsb3cgY2hlY2spIHRvIGNhbGN1bGF0ZSB0aGUg
Y2h1bmsgc2l6ZQ0KPiArZnJvbSB0aGUgcmVxdWVzdGVkIGFsbG9jYXRpb24g
c2l6ZS4gVGhpcyBsZWFkcyB0byBhbiBpbnRlZ2VyIG92ZXJmbG93DQo+ICtj
YXVzaW5nIG1hbGxvYyB0byBpbmNvcnJlY3RseSByZXR1cm4gdGhlIGxhc3Qg
c3VjY2Vzc2Z1bGx5IGFsbG9jYXRlZA0KPiArYmxvY2sgd2hlbiBjYWxsZWQg
d2l0aCBhIHZlcnkgbGFyZ2Ugc2l6ZSBhcmd1bWVudCAoY2xvc2UgdG8gU0la
RV9NQVgpLg0KPiArDQo+ICtUaGlzIGNvbW1pdCB1c2VzIGNoZWNrZWRfcmVx
dWVzdDJzaXplIGluc3RlYWQsIHJlbW92aW5nIHRoZSBvdmVyZmxvdy4NCj4g
Kw0KPiArVXBzdHJlYW0tc3RhdHVzOiBCYWNrcG9ydA0KPiArLS0tDQo+ICsg
Q2hhbmdlTG9nICAgICAgIHwgNiArKysrKysNCj4gKyBtYWxsb2MvbWFsbG9j
LmMgfCAzICsrLQ0KPiArIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9DaGFu
Z2VMb2cgYi9DaGFuZ2VMb2cNCj4gK2luZGV4IGI1NWVkMjIuLjg4OGY5ZmIg
MTAwNjQ0DQo+ICstLS0gYS9DaGFuZ2VMb2cNCj4gKysrKyBiL0NoYW5nZUxv
Zw0KPiArQEAgLTEsMyArMSw5IEBADQo+ICsrMjAxNy0xMS0zMCAgQXJqdW4g
U2hhbmthciAgPGFyanVuQHJlZGhhdC5jb20+DQo+ICsrDQo+ICsrCVtCWiAj
MjIzNzVdDQo+ICsrCSogbWFsbG9jL21hbGxvYy5jIChfX2xpYmNfbWFsbG9j
KTogVXNlIGNoZWNrZWRfcmVxdWVzdDJzaXplDQo+ICsrCWluc3RlYWQgb2Yg
cmVxdWVzdDJzaXplLg0KPiArKw0KPiArIDIwMTctMDgtMDIgIFNpZGRoZXNo
IFBveWFyZWthciAgPHNpZGRoZXNoQHNvdXJjZXdhcmUub3JnPg0KPiArDQo+
ICsgCSogc3lzZGVwcy9zcGFyYy9zcGFyYzMyL3NwYXJjdjkvZnB1L211bHRp
YXJjaC9zX2xscmludC5TDQo+ICtkaWZmIC0tZ2l0IGEvbWFsbG9jL21hbGxv
Yy5jIGIvbWFsbG9jL21hbGxvYy5jIGluZGV4IDc5ZjBlOWUuLjBjOWUwNzQN
Cj4gKzEwMDY0NA0KPiArLS0tIGEvbWFsbG9jL21hbGxvYy5jDQo+ICsrKysg
Yi9tYWxsb2MvbWFsbG9jLmMNCj4gK0BAIC0zMDUwLDcgKzMwNTAsOCBAQCBf
X2xpYmNfbWFsbG9jIChzaXplX3QgYnl0ZXMpDQo+ICsgICAgIHJldHVybiAo
Kmhvb2spKGJ5dGVzLCBSRVRVUk5fQUREUkVTUyAoMCkpOyAgI2lmIFVTRV9U
Q0FDSEUNCj4gKyAgIC8qIGludF9mcmVlIGFsc28gY2FsbHMgcmVxdWVzdDJz
aXplLCBiZSBjYXJlZnVsIHRvIG5vdCBwYWQgdHdpY2UuDQo+ICsqLw0KPiAr
LSAgc2l6ZV90IHRieXRlcyA9IHJlcXVlc3Qyc2l6ZSAoYnl0ZXMpOw0KPiAr
KyAgc2l6ZV90IHRieXRlczsNCj4gKysgIGNoZWNrZWRfcmVxdWVzdDJzaXpl
IChieXRlcywgdGJ5dGVzKTsNCj4gKyAgIHNpemVfdCB0Y19pZHggPSBjc2l6
ZTJ0aWR4ICh0Ynl0ZXMpOw0KPiArDQo+ICsgICBNQVlCRV9JTklUX1RDQUNI
RSAoKTsNCj4gKy0tDQo+ICsyLjcuNA0KPiArDQo+IGRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliY18yLjI2LmJiDQo+IGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4yNi5iYg0KPiBpbmRleCAx
MzVlYzRmLi4zNmIyMDA0IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliYy9nbGliY18yLjI2LmJiDQo+ICsrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWJjL2dsaWJjXzIuMjYuYmINCj4gQEAgLTQzLDYgKzQzLDcg
QEAgU1JDX1VSSSA9DQo+ICIke0dMSUJDX0dJVF9VUkl9O2JyYW5jaD0ke1NS
Q0JSQU5DSH07bmFtZT1nbGliYyBcDQo+IA0KPiBmaWxlOi8vMDAyNi1hc3Nl
cnQtU3VwcHJlc3MtcGVkYW50aWMtd2FybmluZy1jYXVzZWQtYnktc3RhdGVt
ZW50LnBhdGNoIFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMjctZ2xpYmMt
cmVzZXQtZGwtbG9hZC13cml0ZS1sb2NrLWFmdGVyLWZvcmtpbmcucGF0Y2gg
XA0KPiAgICAgICAgICAgICBmaWxlOi8vMDAyOC1CdWctNDU3OC1hZGQtbGQu
c28tbG9jay13aGlsZS1mb3JrLnBhdGNoIFwNCj4gKw0KPiArIGZpbGU6Ly8w
MDI5LUZpeC1pbnRlZ2VyLW92ZXJmbG93LWluLW1hbGxvYy13aGVuLXRjYWNo
ZS1pcy1lbmFibGUucGF0Y2gNCj4gKyBcDQo+ICAiDQo+IA0KPiAgTkFUSVZF
U0RLRklYRVMgPz0gIiINCj4gLS0NCj4gMi43LjQNCg0KCgo=

