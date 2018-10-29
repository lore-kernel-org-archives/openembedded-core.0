Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 165036003C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:48:59 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w9T9mxo8030690
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 29 Oct 2018 10:48:59 +0100
Received: from ATVIES991U8MSX.ww300.siemens.net
	(atvies991u8msx.ww300.siemens.net [158.226.163.42])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTPS id w9T9mwKf001604
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 29 Oct 2018 10:48:59 +0100
Received: from ATNETS9912WMSX.ww300.siemens.net ([169.254.10.142]) by
	ATVIES991U8MSX.ww300.siemens.net ([158.226.163.42]) with mapi id
	14.03.0415.000; Mon, 29 Oct 2018 10:48:58 +0100
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] staging: remove hard-coded values from _FIXMEs
Thread-Index: AQHUT0fLwLaoM6Q6Vk+hCAhnjVgVxKT3lS0AgD6lN5A=
Date: Mon, 29 Oct 2018 09:48:58 +0000
Message-ID: <D55698ECEC159B488D62A508E18D7FEC01690B77@ATNETS9912WMSX.ww300.siemens.net>
References: <20180917134158.4614-1-andrej.valek@siemens.com>
	<9c4d3cc718703e04e6b9890862c288f046915c61.camel@linuxfoundation.org>
	<333361a0-5622-46df-780f-bac18315fa01@siemens.com>
In-Reply-To: <333361a0-5622-46df-780f-bac18315fa01@siemens.com>
Accept-Language: en-US, de-AT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.23]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: remove hard-coded values from _FIXMEs
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
X-List-Received-Date: Mon, 29 Oct 2018 09:49:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KRGkgeW91IGhhdmUgc29tZSB0aW1lIHRvIHRoaW5rIGFib3V0IGl0Pw0K
DQpSZWdhcmRzLA0KQW5kcmVqDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBB
bmRyZWogVmFsZWsgW21haWx0bzphbmRyZWoudmFsZWtAc2llbWVucy5jb21dIA0KU2VudDogMTku
IHNlcHRlbWJyYSAyMDE4IDE1OjA5DQpUbzogUmljaGFyZCBQdXJkaWU7IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSBzdGFnaW5nOiByZW1vdmUgaGFyZC1jb2RlZCB2YWx1ZXMgZnJvbSBfRklYTUVzDQoNCkhpIFJp
Y2hhcmQsDQoNCkkgaGF2ZSBzZW50IHRoaXMgcGF0Y2gsIGJlY2F1c2Ugb2YgbW9kaWZpY2F0aW9u
IHRoaXMgcmVwbGFjZW1lbnQuIFdoYXQgYWJvdXQgYWRkaW5nIFRNUERJUiBpbnRvIHRoaXMgaGFy
ZC1jb2RlZCBhcnJheT8gSSB0aGluaywgZXZlbiBpZiBpdCBpc24ndCBhZGRlZCBpbnRvIEVYVFJB
X1NUQUdJTkdfRklYTUVTIGl0IHNob3VsZG4ndCBpbmZsdWVuY2UgZGVmYXVsdCBiZWhhdmlvci4N
Cg0KUmVnYXJkcywNCg0KQW5kcmVqDQoNCk9uIDkvMTgvMTggMjowMyBQTSwgUmljaGFyZCBQdXJk
aWUgd3JvdGU6DQo+IE9uIE1vbiwgMjAxOC0wOS0xNyBhdCAxNTo0MSArMDIwMCwgQW5kcmVqIFZh
bGVrIHdyb3RlOg0KPj4gTGV0IHVzZXJzIHRvIG92ZXJyaWRlIHRoZXNlIHZhbHVlcyBpbiB0aGVp
ciBsYXllcnMgYW5kIGNvdWxkIG1hdGNoIA0KPj4gdGhlbSB3aXRoIHZhbHVlcyBpbiBFWFRSQV9T
VEFHSU5HX0ZJWE1FUy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWogVmFsZWsgPGFuZHJl
ai52YWxla0BzaWVtZW5zLmNvbT4NCj4+IC0tLQ0KPj4gIG1ldGEvY2xhc3Nlcy9zdGFnaW5nLmJi
Y2xhc3MgfCA0ICsrKy0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9zdGFnaW5nLmJiY2xh
c3MgDQo+PiBiL21ldGEvY2xhc3Nlcy9zdGFnaW5nLmJiY2xhc3MgaW5kZXggODRlMTNiYWI1OS4u
NmRiNTAxZGFjMSAxMDA2NDQNCj4+IC0tLSBhL21ldGEvY2xhc3Nlcy9zdGFnaW5nLmJiY2xhc3MN
Cj4+ICsrKyBiL21ldGEvY2xhc3Nlcy9zdGFnaW5nLmJiY2xhc3MNCj4+IEBAIC0xMjcsNiArMTI3
LDggQEAgcHl0aG9uIGRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmUgKCkgeyAgfSAgDQo+PiBh
ZGR0YXNrIGRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmUNCj4+ICANCj4+ICtTWVNST09UX1NU
QUdJTkdfRklYTUVTID89ICJDT01QT05FTlRTX0RJUiBIT1NUVE9PTFNfRElSIFBLR0RBVEFfRElS
DQo+PiBQU0VVRE9fTE9DQUxTVEFURURJUiBMT0dGSUZPIg0KPj4gKw0KPj4gIGRlZiBzdGFnaW5n
X2NvcHlmaWxlKGMsIHRhcmdldCwgZGVzdCwgcG9zdGluc3RzLCBzZWVuZGlycyk6DQo+PiAgICAg
IGltcG9ydCBlcnJubw0KPj4gIA0KPj4gQEAgLTE2Nyw3ICsxNjksNyBAQCBkZWYgc3RhZ2luZ19w
cm9jZXNzZml4bWUoZml4bWUsIHRhcmdldCwgDQo+PiByZWNpcGVzeXNyb290LCByZWNpcGVzeXNy
b290bmF0aXZlLCBkKToNCj4+ICAgICAgaWYgbm90IGZpeG1lOg0KPj4gICAgICAgICAgcmV0dXJu
DQo+PiAgICAgIGNtZCA9ICJzZWQgLWUgJ3M6XlteL10qLzolcy86ZycgJXMgfCB4YXJncyBzZWQg
LWkgLWUgDQo+PiAnczpGSVhNRVNUQUdJTkdESVJUQVJHRVQ6JXM6ZzsgczpGSVhNRVNUQUdJTkdE
SVJIT1NUOiVzOmcnIiAlIA0KPj4gKHRhcmdldCwgIiAiLmpvaW4oZml4bWUpLCByZWNpcGVzeXNy
b290LCByZWNpcGVzeXNyb290bmF0aXZlKQ0KPj4gLSAgICBmb3IgZml4bWV2YXIgaW4gWydDT01Q
T05FTlRTX0RJUicsICdIT1NUVE9PTFNfRElSJywNCj4+ICdQS0dEQVRBX0RJUicsICdQU0VVRE9f
TE9DQUxTVEFURURJUicsICdMT0dGSUZPJ106DQo+PiArICAgIGZvciBmaXhtZXZhciBpbiBkLmdl
dFZhcigiU1lTUk9PVF9TVEFHSU5HX0ZJWE1FUyIpLnNwbGl0KCk6DQo+PiAgICAgICAgICBmaXht
ZV9wYXRoID0gZC5nZXRWYXIoZml4bWV2YXIpDQo+PiAgICAgICAgICBjbWQgKz0gIiAtZSAnczpG
SVhNRV8lczolczpnJyIgJSAoZml4bWV2YXIsIGZpeG1lX3BhdGgpDQo+PiAgICAgIGJiLmRlYnVn
KDIsIGNtZCkNCj4gDQo+IEkgdGhpbmsgdGhpcyB3YXMgZGVsaWJlcmF0ZWx5IGxlZnQgdGhpcyB3
YXkgcmF0aGVyIHRoYW4gbGV0dGluZyB1c2VycyANCj4gb3ZlcnJpZGUgaXQgYXMgdGhlIHNjb3Bl
IGlzc3VlcyBhcm91bmQgdGhpcyBhcmUgbm90IG9idmlvdXMgYW5kIG1ha2luZyANCj4gaXQgYSB2
YXJpYWJsZSBnaXZlcyB1c2VycyBleHBlY3RhdGlvbnMgd2hpY2ggbWF5IG5vdCBiZSBtZXQuDQo+
IA0KPiBJJ20gZ29pbmcgZnJvbSBtZW1vcnkgd2l0aCBqZXRsYWcgYnV0IEkgdGhpbmsgdGhhdCB0
aGlzIHZhcmlhYmxlIHdvdWxkIA0KPiBub3Qgd29yayBmcm9tIHJlY2lwZSBjb250ZXh0LCB5b3Un
ZCBoYXZlIHRvIGRvIGl0IGluIGdsb2JhbCBzY29wZSBhbmQgDQo+IGNoYW5naW5nIHRoaXMgaW4g
Z2xvYmFsIHNjb3BlIGZvciBldmVyeXRoaW5nIGlzIGEgcHJldHR5IHNlcmlvdXMgDQo+IGNoYW5n
ZS4NCj4gDQo+IFRoZSByZWFzb24gaXMgdGhhdCBpdCBjYW4gZ2V0IGNhbGxlZCB3aGVuIGJ1aWxk
aW5nIGFueSByZWNpcGUgc3lzcm9vdCANCj4gc28gdGhlIGRhdGFzdG9yZSBpc24ndCB0byBjb250
ZXh0IG9mIHRoZSBvcmlnaW5hbCBjcmVhdG9yLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFy
ZA0KPiANCg==

