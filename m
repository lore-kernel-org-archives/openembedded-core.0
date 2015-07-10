Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0DAAB73F9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:45:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98311446"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2015 17:49:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6A9hiof004970
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 17:43:44 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Fri, 10 Jul 2015 17:45:27 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v4 0/3] These patches aim to make the spdx
	file be compliant with the SPDX 1.2 Specification.
Thread-Index: AQHQo2WAF5RK7vRO10izvmzFSTmxy52zVqWAgCDhdEA=
Date: Fri, 10 Jul 2015 09:45:27 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDB2A398@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1433930954-31813-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FDB26B8C@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDB26B8C@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.26]
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] These patches aim to make the spdx file be compliant with the SPDX 1.2 Specification.
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
X-List-Received-Date: Fri, 10 Jul 2015 09:45:29 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkNCg0KV2h5IG5vdCBhY2NlcHQgdGhpcyBpbXByb3ZlbWVudCA/IEkgbWV0IHNvbWVvbmUgd2Fz
IGludGVyZXN0ZWQgaW4gaXQuDQoNCg0KQ2hlZXJzDQpMZWkNCg0KDQoNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBMZWksDQo+IE1hb2h1aQ0KPiBTZW50
OiBGcmlkYXksIEp1bmUgMTksIDIwMTUgMToxNCBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB2
NCAwLzNdIFRoZXNlIHBhdGNoZXMgYWltIHRvIG1ha2UgdGhlIHNwZHggZmlsZSBiZQ0KPiBjb21w
bGlhbnQgd2l0aCB0aGUgU1BEWCAxLjIgU3BlY2lmaWNhdGlvbi4NCj4gDQo+IA0KPiBwaW5nDQo+
IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogTGVpLCBNYW9odWkN
Cj4gPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTAsIDIwMTUgNjowOSBQTQ0KPiA+IFRvOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gQ2M6IExlaSwgTWFvaHVp
DQo+ID4gU3ViamVjdDogW1BBVENIIHY0IDAvM10gVGhlc2UgcGF0Y2hlcyBhaW0gdG8gbWFrZSB0
aGUgc3BkeCBmaWxlIGJlDQo+ID4gY29tcGxpYW50IHdpdGggdGhlIFNQRFggMS4yIFNwZWNpZmlj
YXRpb24uDQo+ID4NCj4gPiBUaG9zZSBwYXRjaGVzIGFpbSB0byBtYWtlIHRoZSBzcGR4IGZpbGUg
YmUgY29tcGxpYW50IHdpdGggdGhlIFNQRFggMS4yIFNwZWNpZmljYXRpb24uDQo+ID4gSWYgeW91
IHdhbnQgdG8gdXNlIHRoaXMgZmVhdHVyZSx5b3UgbmVlZCB0byBkbzoNCj4gPiAxLiBNYWtlIHN1
cmUgeW91ciBmb3Nzb2xvZ3krc3BkeCBzZXJ2ZXIgd29ya3Mgd2VsbC5Zb3UgY2FuIGdldCBzcGR4
DQo+ID4gZmlsZSB3aXRoIHRoZSBmb2xsb3dpbmcgY29tbWFuZC4NCj4gPiAgICBjdXJsIGh0dHA6
Ly8xMjcuMC4wLjEvcmVwby8gLS1ub3Byb3h5IDEyNy4wLjAuMSAtayAtRg0KPiA+IG1vZD1zcGR4
X2xpY2Vuc2Vfb25jZSAtRiBub0NvcHlyaWdodD1mYWxzZQ0KPiA+ICAgIC1GIGpzb25PdXRwdXQ9
ZmFsc2UgLUYgZnVsbFNQRFhGbGFnPXRydWUgLUYgZmlsZT1AeHh4LnRhci5neiAtbw0KPiA+IHh4
eC5zcGR4DQo+ID4NCj4gPiAyLiBBZGQgdGhlIGZvbGxvd2luZyBJTkhFUklUIHN0YXRlbWVudCBh
bmQgc2V0IHRoZSBTUERYX01BTklGRVNUX0RJUg0KPiA+IGF0IHRoZSBlbmQgb2YgeW91ciBjb25m
L2xvY2FsLmNvbmYgZmlsZSBmb3VuZCBpbiB0aGUgQnVpbGQgRGlyZWN0b3J5Lg0KPiA+ICAgIElO
SEVSSVQgKz0gInNwZHgiDQo+ID4NCj4gPg0KPiA+IExlaSBNYW9odWkgKDMpOg0KPiA+ICAgbGlj
ZW5zZXMuY29uZjogTW9kaWZpZWQgcGFyYW1ldGVycyBmb3IgbmV3IHNwZHguYmJjbGFzcw0KPiA+
ICAgc3BkeC5iYmNsYXNzOiBDcmVhdGUgdGhlIHNwZHggZmlsZSB3aGljaCBpcyBjb21wbGlhbnQg
ICAgICB3aXRoIFNQRFgNCj4gPiAgICAgMS4yIFNwZWNpZmljYXRpb24NCj4gPiAgIHNwZHg6IGNy
ZWF0ZSBhIGRpcmVjdG9yeSB0byBzYXZlIHNvdXJjZSBjb2RlDQo+ID4NCj4gPiAgbWV0YS9jbGFz
c2VzL3NwZHguYmJjbGFzcyB8IDQzMSArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gIG1ldGEvY29uZi9saWNlbnNlcy5jb25mICAgfCAgODYgKysrLS0t
LS0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTg0IGluc2VydGlvbnMoKyksIDMzMyBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IC0tDQo+ID4gMS44LjQuMg0KPiANCj4gLS0NCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUg
bWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1i
ZWRkZWQtY29yZQ0K

