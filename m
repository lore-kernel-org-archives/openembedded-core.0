Return-Path: <prvs=415dbfde3=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 40D4A60806
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1504700704; x=1536236704;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=E2GMH9eCIVVpabRsbybNhYqeHQsD0o4mopJk3ZqG5yY=;
	b=IZqoZD5Lc7hFZoY6k7ecKVK1lIA4EGu87Pwh6l5cU/dpa4VdifFRK8JL
	GcWwKVbkAriUBQUOPEtYW1CqksjoGhwA5dr6JVc7/uKZGJHnJI0JgTT+C
	Kmv1ZefZXykWmag9ka2mk13GRmR/UFLjqYfW4f6aZ4KlfWvoHKoGgR0Sa E=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 06 Sep 2017 14:22:06 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw6.muc with ESMTP/TLS;
	06 Sep 2017 14:22:04 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb5.muc with ESMTP/TLS; 06 Sep 2017 14:22:04 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Wed, 6 Sep 2017 14:22:04 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1320.000;
	Wed, 6 Sep 2017 14:22:04 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: =?utf-8?B?W09FLWNvcmVdIOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJnaXRzbS5w?=
	=?utf-8?Q?y:_use_download_cache_f..."_and_2_more?=
Thread-Index: AQHTJwQt5c0gonzraU6aWT9EO5g6MaKno+SAgAACCoA=
Date: Wed, 6 Sep 2017 12:22:04 +0000
Message-ID: <20170906122203.m6e227oodo2mlzge@hiutale>
References: <1504696096-13095-1-git-send-email-mikko.rapeli@bmw.de>
	<20170906113454.2383.22065@do.openembedded.org>
	<20170906121435.3dadxpwihm7besg7@hiutale>
In-Reply-To: <20170906121435.3dadxpwihm7besg7@hiutale>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJnaXRzbS5weTogdXNlIGRvd25sb2FkIGNhY2hlIGYuLi4iIGFuZCAyIG1vcmU=?=
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
X-List-Received-Date: Wed, 06 Sep 2017 12:25:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B9FC20025478D4690541D2C543CCE55@bmwmail.corp>
Content-Transfer-Encoding: base64

T24gV2VkLCBTZXAgMDYsIDIwMTcgYXQgMTI6MTQ6NDhQTSArMDAwMCwgTWlra28uUmFwZWxpQGJt
dy5kZSB3cm90ZToNCj4gT24gV2VkLCBTZXAgMDYsIDIwMTcgYXQgMTE6MzQ6NTRBTSArMDAwMCwg
UGF0Y2h3b3JrIHdyb3RlOg0KPiA+ID09IFNlcmllcyBEZXRhaWxzID09DQo+ID4gDQo+ID4gU2Vy
aWVzOiAiZ2l0c20ucHk6IHVzZSBkb3dubG9hZCBjYWNoZSBmLi4uIiBhbmQgMiBtb3JlDQo+ID4g
UmV2aXNpb246IDENCj4gPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5v
cmcvc2VyaWVzLzg3MzQvDQo+ID4gU3RhdGUgOiBmYWlsdXJlDQo+ID4gDQo+ID4gPT0gU3VtbWFy
eSA9PQ0KPiA+IA0KPiA+IA0KPiA+IFRoYW5rIHlvdSBmb3Igc3VibWl0dGluZyB0aGlzIHBhdGNo
IHNlcmllcyB0byBPcGVuRW1iZWRkZWQgQ29yZS4gVGhpcyBpcw0KPiA+IGFuIGF1dG9tYXRlZCBy
ZXNwb25zZS4gU2V2ZXJhbCB0ZXN0cyBoYXZlIGJlZW4gZXhlY3V0ZWQgb24gdGhlIHByb3Bvc2Vk
DQo+ID4gc2VyaWVzIGJ5IHBhdGNodGVzdCByZXN1bHRpbmcgaW4gdGhlIGZvbGxvd2luZyBmYWls
dXJlczoNCj4gPiANCj4gPiANCj4gPiANCj4gPiAqIElzc3VlICAgICAgICAgICAgIFNlcmllcyBk
b2VzIG5vdCBhcHBseSBvbiB0b3Agb2YgdGFyZ2V0IGJyYW5jaCBbdGVzdF9zZXJpZXNfbWVyZ2Vf
b25faGVhZF0gDQo+ID4gICBTdWdnZXN0ZWQgZml4ICAgIFJlYmFzZSB5b3VyIHNlcmllcyBvbiB0
b3Agb2YgdGFyZ2V0ZWQgYnJhbmNoDQo+ID4gICBUYXJnZXRlZCBicmFuY2ggIG1hc3RlciAoY3Vy
cmVudGx5IGF0IGNjMzE5YjZkY2MpDQo+IA0KPiBVaCwgdGhlIHBhdGNoIGlzIGJhc2VkIG9uIHBv
a3kgbWFzdGVyIGF0Og0KPiANCj4gY29tbWl0IDhiNGYxNmE5Y2JiYWY1MjE0NjFmNjk5YjcyNjRm
YWMyYWM4NzI1ODEgKHJlZnMvcmVtb3Rlcy91cHN0cmVhbS9tYXN0ZXItbmUNCj4gQXV0aG9yOiBK
dXNzaSBLdWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPg0KPiBEYXRlOiAgIE1vbiBT
ZXAgNCAxMTozOToyNCAyMDE3ICswMzAwDQo+IA0KPiAgICAgbWVzYS1nbDogRml4IGJ1aWxkIGFm
dGVyIHJlY2VudCBtZXNhIFBBQ0tBR0VDT05GSUcgY2hhbmdlcw0KPiAgICAgDQo+ICAgICA0OGQz
OWNmNDNiIGFkZGVkICJvcGVuZ2wiIFBBQ0tBR0VDT05GSUcgb3B0aW9uIHRvIG1lc2E6IGJlZm9y
ZSB0aGF0DQo+ICAgICB0aGUgY29uZmlndXJhdGlvbiB3YXMgYWx3YXlzIGVuYWJsZWQuICJvcGVu
Z2wiIHNob3VsZCBoYXZlIGJlZW4gYWRkZWQNCj4gICAgIHRvIG1lc2EtZ2wgZGVmYXVsdCBQQUNL
QUdFQ09ORklHIGJ1dCB3YXNuJ3Q6IGRvIGl0IG5vdy4NCj4gICAgIA0KPiAgICAgKEZyb20gT0Ut
Q29yZSByZXY6IGNjMzE5YjZkY2M1YjRhNTAxOWZiOTFjOTc3MWIxMmNlMTdmM2M5NTMpDQo+ICAg
ICANCj4gICAgIFNpZ25lZC1vZmYtYnk6IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBp
bnRlbC5jb20+DQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gDQo+IGFuZCB0aGVyZSBhcmUgbm8gbmV3ZXIg
Y2hhbmdlcyBhdmFpbGFibGUuIFNob3VsZCBJIHBvcnQgdGhlIHBhdGNoIHRvIG9lLWNvcmUNCj4g
ZGlyZWN0bHkgYW5kIHN1Ym1pdCBhZ2Fpbj8NCj4gDQo+IE1heWJlIHRoaXMgd29ya2VkIGluIHRo
ZSBwYXN0IGJlY2F1c2Ugc29tZW9uZSBlbHNlIGRpZCB0aGUgYXBwbHlpbmcgYW5kDQo+IG1lcmdp
bmcgbWFudWFsbHk/DQoNCkFoLCBzb3JyeS4gVGhlIHBhdGNoIGlzIGZvciBiaXRiYWtlLCBub3Qg
b2UtY29yZS4gV2lsbCBzZW5kIHRvIGNvcnJlY3QgbGlzdC4NCg0KLU1pa2tv

