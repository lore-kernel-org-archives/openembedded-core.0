Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D63D661222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 15:55:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Aug 2013 08:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,895,1367996400"; d="scan'208";a="387376394"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2013 08:55:52 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 16 Aug 2013 16:55:51 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.233]) with mapi id
	14.03.0123.003; Fri, 16 Aug 2013 16:55:52 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Kai Kang
	<kai.kang@windriver.com>
Thread-Topic: [OE-core] [PATCH 1/1] qemu: update dependency of native package
Thread-Index: AQHOmmhOP/KUsCzHH0akjBVsKRYjl5mXloCAgABkIvA=
Date: Fri, 16 Aug 2013 15:55:50 +0000
Message-ID: <81551E10643BEC4899D6BA2541201B62018E4EF9@IRSMSX105.ger.corp.intel.com>
References: <cover.1376647416.git.kai.kang@windriver.com>
	<b861e570e04aa288f05c344b161815b0dec8e788.1376647416.git.kai.kang@windriver.com>
	<1376650065.22952.118.camel@ted>
In-Reply-To: <1376650065.22952.118.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "Zhangle.Yang@windriver.com" <Zhangle.Yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemu: update dependency of native package
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
X-List-Received-Date: Fri, 16 Aug 2013 15:55:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uDQo+IEJlaGFsZiBPZiBSaWNoYXJk
IFB1cmRpZQ0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAxNiwgMjAxMyAxOjQ4IFBNDQo+IFRvOiBL
YWkgS2FuZw0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsN
Cj4gWmhhbmdsZS5ZYW5nQHdpbmRyaXZlci5jb20NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0ggMS8xXSBxZW11OiB1cGRhdGUgZGVwZW5kZW5jeSBvZiBuYXRpdmUNCj4gcGFja2FnZQ0K
PiANCj4gT24gRnJpLCAyMDEzLTA4LTE2IGF0IDE4OjA1ICswODAwLCBLYWkgS2FuZyB3cm90ZToN
Cj4gPiBbWU9DVE8gIzQ5NzNdDQo+ID4NCj4gPiBJdCBmYWlscyB0byBzdGFydCBxZW11IHdpdGgg
Y29yZS1pbWFnZS1zYXRvIG9uIEZlZG9yYSAxOS4gVGhlIGVycm9yDQo+ID4gbWVzc2FnZSBzaG93
czoNCj4gPg0KPiA+IENvdWxkIG5vdCBpbml0aWFsaXplIFNETChObyBhdmFpbGFibGUgdmlkZW8g
ZGV2aWNlKSAtIGV4aXRpbmcNCj4gPg0KPiA+IEFkZCBkZXBlbmRlY3kgbGlieGV4dC1uYXRpdmUg
dG8gcWVtdS1uYXRpdmUgdG8gZml4IHRoaXMgZXJyb3IuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jIGIvbWV0YS9yZWNpcGVzLQ0KPiBkZXZ0
b29scy9xZW11L3FlbXUuaW5jDQo+ID4gaW5kZXggOTdlOWI3Yi4uYTk2ZTAwYyAxMDA2NDQNCj4g
PiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYw0KPiA+ICsrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jDQo+ID4gQEAgLTIsNyArMiw3IEBAIERF
U0NSSVBUSU9OID0gIm9wZW4gc291cmNlIHByb2Nlc3NvciBlbXVsYXRvciINCj4gPiAgSE9NRVBB
R0UgPSAiaHR0cDovL3FlbXUub3JnIg0KPiA+ICBMSUNFTlNFID0gIkdQTHYyICYgTEdQTHYyLjEi
DQo+ID4gIERFUEVORFMgPSAiZ2xpYi0yLjAgemxpYiBhbHNhLWxpYiB2aXJ0dWFsL2xpYngxMSBw
aXhtYW4gZHRjIGxpYnNkbCINCj4gPiAtREVQRU5EU19jbGFzcy1uYXRpdmUgPSAiemxpYi1uYXRp
dmUgYWxzYS1saWItbmF0aXZlIGdsaWItMi4wLW5hdGl2ZQ0KPiBwaXhtYW4tbmF0aXZlIGR0Yy1u
YXRpdmUiDQo+ID4gK0RFUEVORFNfY2xhc3MtbmF0aXZlID0gInpsaWItbmF0aXZlIGFsc2EtbGli
LW5hdGl2ZSBnbGliLTIuMC1uYXRpdmUNCj4gcGl4bWFuLW5hdGl2ZSBkdGMtbmF0aXZlIGxpYnhl
eHQtbmF0aXZlIg0KPiA+ICBERVBFTkRTX2NsYXNzLW5hdGl2ZXNkayA9ICJuYXRpdmVzZGstemxp
YiBuYXRpdmVzZGstbGlic2RsIG5hdGl2ZXNkay0NCj4gZ2xpYi0yLjAgbmF0aXZlc2RrLXBpeG1h
biBuYXRpdmVzZGstZHRjIg0KPiA+ICBSREVQRU5EU18ke1BOfV9jbGFzcy1uYXRpdmVzZGsgPSAi
bmF0aXZlc2RrLWxpYnNkbCINCj4gDQo+IFRoaXMgaXMgb25lIG9mIHRoZSB1Z2x5IGRlcGVuZGVu
Y2llcyB3ZSd2ZSB0cmllZCB0byBpZ25vcmUuDQo+IA0KPiBXZSBiYXNpY2FsbHkgYXNzdW1lIGlm
IHlvdXIgYnVpbGQgbWFjaGluZSBoYXMgZ3JhcGhpY3MsIHlvdSBoYXZlIHRoZQ0KPiBkZXZlbCBo
ZWFkZXJzL2xpYnMgdGhlcmUgYW5kIHFlbXUgd2lsbCBhdXRvZGV0ZWN0IGFuZCBpbmNsdWRlIGdy
YXBoaWNzDQo+IHN1cHBvcnQuIEVxdWFsbHksIGlmIHlvdXIgYnVpbGQgbWFjaGluZSBkb2Vzbid0
LCBpdCBqdXN0IHdvbid0IGJ1aWxkDQo+IGdyYXBoaWNzIHN1cHBvcnQuIEluIGdlbmVyYWwgbW9z
dCBwZW9wbGUgc2VlbSBoYXBweSB3aXRoIHRoaXMgZXZlbiBpZg0KPiBpdHMgaW1wZXJmZWN0Lg0K
PiANCg0KQnV0LCBidXQuLi4gSSBkbyBoYXZlIGxpYnhleHQgYW5kIGxpYnhleHQtZGV2ZWwgaW5z
dGFsbGVkLi4uIChhbmQgbWluaW1hbCB3b3JrcyBqdXN0IGZpbmUgYXMgdGhlIGJ1ZyBzYXlzKQ0K
bGliWGV4dC0xLjMuMi0xLmZjMTkueDg2XzY0DQpsaWJYZXh0LWRldmVsLTEuMy4yLTEuZmMxOS54
ODZfNjQNCg0KQWxzbyBzdHJhY2Ugc2hvd3M6DQpvcGVuKCIvbGliNjQvbGliWGV4dC5zby42Iiwg
T19SRE9OTFl8T19DTE9FWEVDKSA9IDExDQpyZWFkKDExLCAiXDE3N0VMRlwyXDFcMVwwXDBcMFww
XDBcMFwwXDBcMFwzXDA+XDBcMVwwXDBcMGA3YFUxXDBcMFwwIi4uLiwgODMyKSA9IDgzMg0KZnN0
YXQoMTEsIHtzdF9tb2RlPVNfSUZSRUd8MDc1NSwgc3Rfc2l6ZT03NzM3NiwgLi4ufSkgPSAwDQpt
bWFwKE5VTEwsIDIxNjkxMTIsIFBST1RfUkVBRHxQUk9UX0VYRUMsIE1BUF9QUklWQVRFfE1BUF9E
RU5ZV1JJVEUsIDExLCAwKSA9IDB4N2YwYTQ5M2VlMDAwDQptcHJvdGVjdCgweDdmMGE0OTNmZjAw
MCwgMjA5MzA1NiwgUFJPVF9OT05FKSA9IDANCm1tYXAoMHg3ZjBhNDk1ZmUwMDAsIDgxOTIsIFBS
T1RfUkVBRHxQUk9UX1dSSVRFLCBNQVBfUFJJVkFURXxNQVBfRklYRUR8TUFQX0RFTllXUklURSwg
MTEsIDB4MTAwMDApID0gMHg3ZjBhNDk1ZmUwMDANCmNsb3NlKDExKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA9IDANCg0KVGhlIEYxOCBzeXN0ZW0gd2hpY2ggZG9lc24ndCBoYXZlIGEg
cHJvYmxlbSB3aXRoIHNhdG8gaGFzOg0KDQpsaWJYZXh0LTEuMy4xLTMuMjAxMzA1MjRnaXRkZmU2
ZTFmM2IuZmMxOC54ODZfNjQNCmxpYlhleHQtZGV2ZWwtMS4zLjEtMy4yMDEzMDUyNGdpdGRmZTZl
MWYzYi5mYzE4Lng4Nl82NA0KDQoNCkNoZWVycywNClN0ZWZhbg0KDQo+IEFkZGluZyBsaWJ4ZXh0
LW5hdGl2ZSB1cHNldHMgdGhpcyBiYWxhbmNlIGEgbGl0dGxlLi4uDQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiBSaWNoYXJkDQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+IE9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0K

