Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 86C2C77396
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 05:16:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,242,1444665600"; 
   d="scan'208";a="478125"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Nov 2015 13:16:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tAG5FwDh005750;
	Mon, 16 Nov 2015 13:15:59 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 16 Nov 2015 13:16:40 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v4 0/3] These patches aim to make the spdx file be
	compliant with the SPDX 1.2 Specification.
Thread-Index: AQHQo2WAF5RK7vRO10izvmzFSTmxy56e6bxA
Date: Mon, 16 Nov 2015 05:16:39 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDA8E58819@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1433930954-31813-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1433930954-31813-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.93]
MIME-Version: 1.0
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>
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
X-List-Received-Date: Mon, 16 Nov 2015 05:16:54 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgYWxsDQoNCkluIHRoZSBPcGVuIENvbXBsaWFuY2UgU3VtbWl0IG9mIDIwMTUoaHR0cDovL2V2
ZW50cy5saW51eGZvdW5kYXRpb24ub3JnL2V2ZW50cy9vcGVuLWNvbXBsaWFuY2Utc3VtbWl0KSwg
SSBub3RpY2VkIHRoYXQgYSBsb3Qgb2YgcGVvcGxlIGFyZSBpbnRlcmVzdGVkIGluIFNQRFguDQoN
Cg0KQWNjb3JkaW5nIHRvIG15IHVuZGVyc3RhbmRpbmcsIHRoZXJlIGFyZSBzb21lIHRvb2xzIGhh
dmUgc3VwcG9ydGVkIFNQRFggMi4wLiBCdXQgWW9jdG8rc3BkeCBzdGlsbCBzdXBwb3J0cyBTUERY
IDEuMS4NCg0KSW4gdGhlIG5leHQgdmVyc2lvbiBvZiBwb2t5LCBhcmUgdGhlcmUgc29tZSBwbGFu
cyBhYm91dCBZb2N0bytzcGR4Pw0KDQoNCkJlc3QgUmVnYXJkcw0KTGVpDQoNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZWksIE1hb2h1aQ0KPiBTZW50OiBXZWRuZXNk
YXksIEp1bmUgMTAsIDIwMTUgNjowOSBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogTGVpLCBNYW9odWkNCj4gU3ViamVjdDogW1BBVENIIHY0
IDAvM10gVGhlc2UgcGF0Y2hlcyBhaW0gdG8gbWFrZSB0aGUgc3BkeCBmaWxlIGJlIGNvbXBsaWFu
dCB3aXRoIHRoZQ0KPiBTUERYIDEuMiBTcGVjaWZpY2F0aW9uLg0KPiANCj4gVGhvc2UgcGF0Y2hl
cyBhaW0gdG8gbWFrZSB0aGUgc3BkeCBmaWxlIGJlIGNvbXBsaWFudCB3aXRoIHRoZSBTUERYIDEu
MiBTcGVjaWZpY2F0aW9uLg0KPiBJZiB5b3Ugd2FudCB0byB1c2UgdGhpcyBmZWF0dXJlLHlvdSBu
ZWVkIHRvIGRvOg0KPiAxLiBNYWtlIHN1cmUgeW91ciBmb3Nzb2xvZ3krc3BkeCBzZXJ2ZXIgd29y
a3Mgd2VsbC5Zb3UgY2FuIGdldCBzcGR4IGZpbGUgd2l0aCB0aGUNCj4gZm9sbG93aW5nIGNvbW1h
bmQuDQo+ICAgIGN1cmwgaHR0cDovLzEyNy4wLjAuMS9yZXBvLyAtLW5vcHJveHkgMTI3LjAuMC4x
IC1rIC1GIG1vZD1zcGR4X2xpY2Vuc2Vfb25jZSAtRg0KPiBub0NvcHlyaWdodD1mYWxzZQ0KPiAg
ICAtRiBqc29uT3V0cHV0PWZhbHNlIC1GIGZ1bGxTUERYRmxhZz10cnVlIC1GIGZpbGU9QHh4eC50
YXIuZ3ogLW8geHh4LnNwZHgNCj4gDQo+IDIuIEFkZCB0aGUgZm9sbG93aW5nIElOSEVSSVQgc3Rh
dGVtZW50IGFuZCBzZXQgdGhlIFNQRFhfTUFOSUZFU1RfRElSIGF0IHRoZSBlbmQNCj4gb2YgeW91
ciBjb25mL2xvY2FsLmNvbmYgZmlsZSBmb3VuZCBpbiB0aGUgQnVpbGQgRGlyZWN0b3J5Lg0KPiAg
ICBJTkhFUklUICs9ICJzcGR4Ig0KPiANCj4gDQo+IExlaSBNYW9odWkgKDMpOg0KPiAgIGxpY2Vu
c2VzLmNvbmY6IE1vZGlmaWVkIHBhcmFtZXRlcnMgZm9yIG5ldyBzcGR4LmJiY2xhc3MNCj4gICBz
cGR4LmJiY2xhc3M6IENyZWF0ZSB0aGUgc3BkeCBmaWxlIHdoaWNoIGlzIGNvbXBsaWFudCAgICAg
IHdpdGggU1BEWA0KPiAgICAgMS4yIFNwZWNpZmljYXRpb24NCj4gICBzcGR4OiBjcmVhdGUgYSBk
aXJlY3RvcnkgdG8gc2F2ZSBzb3VyY2UgY29kZQ0KPiANCj4gIG1ldGEvY2xhc3Nlcy9zcGR4LmJi
Y2xhc3MgfCA0MzEgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiAgbWV0YS9jb25mL2xpY2Vuc2VzLmNvbmYgICB8ICA4NiArKystLS0tLS0NCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTg0IGluc2VydGlvbnMoKyksIDMzMyBkZWxldGlvbnMoLSkNCj4gDQo+IC0t
DQo+IDEuOC40LjINCg0K

