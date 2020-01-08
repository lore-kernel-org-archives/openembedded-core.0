Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id B2C967FA13
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 03:25:20 +0000 (UTC)
IronPort-SDR: NkkeM0Gllgh5yvL2TBM17doVX8YixM3UjolePPKDRF1ThPovfm16fpw3r4VqItf83fjEnl20pA
	hqamLr0bjj86nS/yceXkHLkomXqWvj4KbUvPse5Y+zYjrxkhfNpupQguj3K80qB2CGbFe1wWqn
	vTX3QOOfmrQ2oujI+spQJtlaBcS/6OpgR3qSA7/w6Vpr+E7hfchfYc7oMqAk3TgMOPexkxrbTV
	Z7Mb7HNDc+Fd7k8qiD50DYRoz8K60pi0lfYsaMPu6s03PZ2wIhIjsVkc6BoI0R9LF8IZ+SZ1QE
	Vwg=
X-IronPort-AV: E=Sophos;i="5.69,408,1571695200"; 
   d="scan'208";a="4160071"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] scripts: add pkgdataui
Thread-Index: AQHVr1KUVUawII5ZdUaxZUFJesR8/qfR/BPggAW1DgCACECc4A==
Date: Wed, 8 Jan 2020 03:25:20 +0000
Message-ID: <cf9574734d6245bd812cadbf78a6b4dd@XBOX03.axis.com>
References: <20191210120817.8374-1-ross.burton@intel.com>
	<a5e91d5ad9674452b9c9d3309884e7d3@XBOX03.axis.com>
	<3c836a6a-995a-3b6f-c957-d07427ac8356@intel.com>
In-Reply-To: <3c836a6a-995a-3b6f-c957-d07427ac8356@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: add pkgdataui
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
X-List-Received-Date: Wed, 08 Jan 2020 03:25:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5i
dXJ0b25AaW50ZWwuY29tPg0KPiBTZW50OiBkZW4gMiBqYW51YXJpIDIwMjAgMTg6MTYNCj4gVG86
IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsgb3BlbmVt
YmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0hdIHNjcmlwdHM6IGFkZCBwa2dkYXRhdWkNCj4gDQo+IE9uIDMwLzEyLzIw
MTkgMDE6MTYsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPj4gcGtnZGF0YXVpIGlzIGEg
UHl0aG9uIDMvR09iamVjdCBJbnRyb3NwZWN0aW9uL0dUSysgMyB0b29sIHRvIGJyb3dzZSB0aGUg
cGtnZGF0YQ0KPiA+DQo+ID4gV291bGQgaXQgbWFrZSBzZW5zZSB0byByZW5hbWUgaXQgdG8gb2Ut
cGtnZGF0YS1icm93c2VyIChiYXNlZCBvbiB0aGUgdGl0bGUgaXQNCj4gPiBnaXZlcyBpdHNlbGYs
IGFuZCB0aGUgZXhpc3Rpbmcgb2UtcGtnYWRhdGEtdXRpbCB0b29sKT8NCj4gDQo+IE1ha2VzIHNl
bnNlLg0KDQpJIGhhdmUgYSBwYXRjaCBzZXQgdGhhdCBjaGFuZ2VzIHRoaXMsIGFuZCBtYWtlcyBz
b21lIG90aGVyIA0KaW1wcm92ZW1lbnRzLiBJJ2xsIHNlbmQgaXQgbmV4dC4NCg0KPiA+IEkgZ2V0
IHRoZSBmb2xsb3dpbmcgZXJyb3JzIHdoZW4gSSBydW4gaXQgKHRob3VnaCB0aGUgR1VJIGNvbWVz
IHVwIGFuZCBzZWVtcw0KPiA+IHRvIHdvcmspOg0KPiA+DQo+ID4gbGliR0wgZXJyb3I6IE5vIG1h
dGNoaW5nIGZiQ29uZmlncyBvciB2aXN1YWxzIGZvdW5kDQo+ID4gbGliR0wgZXJyb3I6IGZhaWxl
ZCB0byBsb2FkIGRyaXZlcjogc3dyYXN0DQo+IA0KPiBUaGF0J3MgeW91ciBob3N0IHN5c3RlbSBH
VEsrL01lc2EsIG5vdCBwa2dkYXRhdWkuDQoNCkhtbSwgb2suIEl0IHNlZW1zIHRvIHJ1biB3aXRo
b3V0IHRob3NlIGVycm9ycyBub3cgdGhhdCBJIHRyaWVkIA0KYWdhaW4sIHNvIEkgZ3Vlc3MgaXQg
d2FzIGp1c3Qgc29tZXRoaW5nIHRlbXBvcmFyeS4NCg0KPiA+PiAgIHNjcmlwdHMvcGtnZGF0YXVp
LmdsYWRlIHwgMzM1DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPg0KPiA+IENhbiB0aGUgLmdsYWRlIGZpbGUgYmUgcHV0IHNvbWV3aGVyZSBlbHNlIHRoYW4g
aW4gdGhlIHNjcmlwdHMgZGlyZWN0b3J5Pw0KPiA+IEJlY2F1c2UgYXMgaXQgaXMgbm93LCBpdCBz
aG93cyB1cCB3aGVuIHVzaW5nIHRhYiBjb21wbGV0aW9uICh3aXRoIHpzaCkuDQo+IA0KPiBXaHkg
aXMgenNoIHNob3dpbmcgaXQ/IEl0J3Mgbm90IGV4ZWN1dGFibGUsIGFuZCBhIGdsYWRlIGZpbGUg
c2hvdWxkbid0DQo+IGJlIHJhbiBieSBhbnl0aGluZy4NCg0KSSBoYXZlIG5vIGlkZWEuIEFueXdh
eSwgaWYgdGhlIHNjcmlwdCBpcyByZW5hbWVkIHRvIGEgbmFtZSB3aXRob3V0IHRoZSANCi5weSBz
dWZmaXgsIGl0IHNob3VsZG4ndCBtYXR0ZXIgYW55bW9yZSBzaW5jZSB0aGUgcmVhbCBzY3JpcHQg
d2lsbCB0aGVuIA0KYmUgc2hvd24gYmVmb3JlIHRoZSAuZ2xhZGUgZmlsZS4NCg0KPiBSb3NzDQoN
Ci8vUGV0ZXINCg0K

