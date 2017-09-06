Return-Path: <prvs=415dbfde3=Mikko.Rapeli@bmw.de>
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id 29A4B60938
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 12:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1504700181; x=1536236181;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=oINoMq5Mo10wC9k+KKQFVOxhEC0rhJC+y5LXpkrBhsc=;
	b=HskVwssIhgSMS4Ct40ZlVwiiEXBw5vfyoyV4KGPNggOhdejNYeqczC7c
	oZoeSdoEjsjmyixuXpHUECTjs+H/6MwRXWA6HgHARSGiahE0gx5wgYLwb
	EIJGml1F3NTcArfo1sRnB49eqtcsWgul5Vp9VRnEUqrwekaNvcWbdb4n/ s=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 06 Sep 2017 14:14:49 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw5.muc with ESMTP/TLS;
	06 Sep 2017 14:14:49 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb6.muc with ESMTP/TLS; 06 Sep 2017 14:14:48 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Wed, 6 Sep 2017 14:14:48 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1320.000;
	Wed, 6 Sep 2017 14:14:48 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: =?utf-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgImdpdHNtLnB5OiB1c2UgZG93?=
	=?utf-8?Q?nload_cache_f..."_and_2_more?=
Thread-Index: AQHTJwQt5c0gonzraU6aWT9EO5g6MaKno+SA
Date: Wed, 6 Sep 2017 12:14:48 +0000
Message-ID: <20170906121435.3dadxpwihm7besg7@hiutale>
References: <1504696096-13095-1-git-send-email-mikko.rapeli@bmw.de>
	<20170906113454.2383.22065@do.openembedded.org>
In-Reply-To: <20170906113454.2383.22065@do.openembedded.org>
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
X-List-Received-Date: Wed, 06 Sep 2017 12:16:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DCA0D3F08788A49A4ED4D9AC195069F@bmwmail.corp>
Content-Transfer-Encoding: base64

T24gV2VkLCBTZXAgMDYsIDIwMTcgYXQgMTE6MzQ6NTRBTSArMDAwMCwgUGF0Y2h3b3JrIHdyb3Rl
Og0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiAiZ2l0c20ucHk6IHVzZSBk
b3dubG9hZCBjYWNoZSBmLi4uIiBhbmQgMiBtb3JlDQo+IFJldmlzaW9uOiAxDQo+IFVSTCAgIDog
aHR0cHM6Ly9wYXRjaHdvcmsub3BlbmVtYmVkZGVkLm9yZy9zZXJpZXMvODczNC8NCj4gU3RhdGUg
OiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiANCj4gVGhhbmsgeW91IGZvciBz
dWJtaXR0aW5nIHRoaXMgcGF0Y2ggc2VyaWVzIHRvIE9wZW5FbWJlZGRlZCBDb3JlLiBUaGlzIGlz
DQo+IGFuIGF1dG9tYXRlZCByZXNwb25zZS4gU2V2ZXJhbCB0ZXN0cyBoYXZlIGJlZW4gZXhlY3V0
ZWQgb24gdGhlIHByb3Bvc2VkDQo+IHNlcmllcyBieSBwYXRjaHRlc3QgcmVzdWx0aW5nIGluIHRo
ZSBmb2xsb3dpbmcgZmFpbHVyZXM6DQo+IA0KPiANCj4gDQo+ICogSXNzdWUgICAgICAgICAgICAg
U2VyaWVzIGRvZXMgbm90IGFwcGx5IG9uIHRvcCBvZiB0YXJnZXQgYnJhbmNoIFt0ZXN0X3Nlcmll
c19tZXJnZV9vbl9oZWFkXSANCj4gICBTdWdnZXN0ZWQgZml4ICAgIFJlYmFzZSB5b3VyIHNlcmll
cyBvbiB0b3Agb2YgdGFyZ2V0ZWQgYnJhbmNoDQo+ICAgVGFyZ2V0ZWQgYnJhbmNoICBtYXN0ZXIg
KGN1cnJlbnRseSBhdCBjYzMxOWI2ZGNjKQ0KDQpVaCwgdGhlIHBhdGNoIGlzIGJhc2VkIG9uIHBv
a3kgbWFzdGVyIGF0Og0KDQpjb21taXQgOGI0ZjE2YTljYmJhZjUyMTQ2MWY2OTliNzI2NGZhYzJh
Yzg3MjU4MSAocmVmcy9yZW1vdGVzL3Vwc3RyZWFtL21hc3Rlci1uZQ0KQXV0aG9yOiBKdXNzaSBL
dWtrb25lbiA8anVzc2kua3Vra29uZW5AaW50ZWwuY29tPg0KRGF0ZTogICBNb24gU2VwIDQgMTE6
Mzk6MjQgMjAxNyArMDMwMA0KDQogICAgbWVzYS1nbDogRml4IGJ1aWxkIGFmdGVyIHJlY2VudCBt
ZXNhIFBBQ0tBR0VDT05GSUcgY2hhbmdlcw0KICAgIA0KICAgIDQ4ZDM5Y2Y0M2IgYWRkZWQgIm9w
ZW5nbCIgUEFDS0FHRUNPTkZJRyBvcHRpb24gdG8gbWVzYTogYmVmb3JlIHRoYXQNCiAgICB0aGUg
Y29uZmlndXJhdGlvbiB3YXMgYWx3YXlzIGVuYWJsZWQuICJvcGVuZ2wiIHNob3VsZCBoYXZlIGJl
ZW4gYWRkZWQNCiAgICB0byBtZXNhLWdsIGRlZmF1bHQgUEFDS0FHRUNPTkZJRyBidXQgd2Fzbid0
OiBkbyBpdCBub3cuDQogICAgDQogICAgKEZyb20gT0UtQ29yZSByZXY6IGNjMzE5YjZkY2M1YjRh
NTAxOWZiOTFjOTc3MWIxMmNlMTdmM2M5NTMpDQogICAgDQogICAgU2lnbmVkLW9mZi1ieTogSnVz
c2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4NCiAgICBTaWduZWQtb2ZmLWJ5
OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCg0K
YW5kIHRoZXJlIGFyZSBubyBuZXdlciBjaGFuZ2VzIGF2YWlsYWJsZS4gU2hvdWxkIEkgcG9ydCB0
aGUgcGF0Y2ggdG8gb2UtY29yZQ0KZGlyZWN0bHkgYW5kIHN1Ym1pdCBhZ2Fpbj8NCg0KTWF5YmUg
dGhpcyB3b3JrZWQgaW4gdGhlIHBhc3QgYmVjYXVzZSBzb21lb25lIGVsc2UgZGlkIHRoZSBhcHBs
eWluZyBhbmQNCm1lcmdpbmcgbWFudWFsbHk/DQoNCi1NaWtrbw==

