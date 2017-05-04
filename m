Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57BF677AB5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 10:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3104118488;
	Thu,  4 May 2017 12:32:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Tq7tJVTLoEGG; Thu,  4 May 2017 12:32:19 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6ACCB1845F;
	Thu,  4 May 2017 12:32:19 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57EF01E0B4;
	Thu,  4 May 2017 12:32:19 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CB6D1E08B;
	Thu,  4 May 2017 12:32:19 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu,  4 May 2017 12:32:19 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 406652879;
	Thu,  4 May 2017 12:32:19 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 4 May 2017 12:32:19 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Thu, 4 May 2017 12:32:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: =?utf-8?B?W09FLWNvcmVdIOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJlcmF0?=
	=?utf-8?Q?ion-fonts:_update_to_2...."_and_4_more?=
Thread-Index: AQHSxL+Lr5nBfi4xBkWIyIQPx2BwVqHj+UIA
Date: Thu, 4 May 2017 10:32:19 +0000
Message-ID: <07ec7ed100e14d63bc17945084522fdd@XBOX02.axis.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<2897866.bodmxEm400@peggleto-mobl.ger.corp.intel.com>
	<24ebf3f4-9855-8aea-7019-3951973d37e1@linux.intel.com>
	<2764166.Tu3B0AapLd@peggleto-mobl.ger.corp.intel.com>
	<6447df1b-8742-7451-1978-68527f141437@linux.intel.com>
In-Reply-To: <6447df1b-8742-7451-1978-68527f141437@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJlcmF0aW9uLWZvbnRzOiB1cGRhdGUgdG8gMi4uLi4iIGFuZCA0IG1vcmU=?=
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
X-List-Received-Date: Thu, 04 May 2017 10:32:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBBbGV4YW5k
ZXIgS2FuYXZpbg0KPiBTZW50OiBkZW4gNCBtYWogMjAxNyAxMjoxNw0KPiBUbzogUGF1bCBFZ2ds
ZXRvbiA8cGF1bC5lZ2dsZXRvbkBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBMZW9uYXJkbyBTYW5k
b3ZhbCA8bGVvbmFyZG8uc2FuZG92YWwuZ29uemFsZXpAaW50ZWwuY29tPjsNCj4gb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJlcmF0aW9uLWZvbnRzOg0KPiB1cGRhdGUg
dG8gMi4uLi4iIGFuZCA0IG1vcmUNCj4gDQo+IE9uIDA1LzA0LzIwMTcgMDE6MDcgUE0sIFBhdWwg
RWdnbGV0b24gd3JvdGU6DQo+ID4gVGhlIG9yaWdpbmFsIGlkZWEgd2FzIHRoYXQgdGhlIHRlc3Rz
IGNvdWxkIGFsc28gYmUgcnVuIGZyb20geW91cg0KPiBsb2NhbCBtYWNoaW5lDQo+ID4gKGNvdWxk
IGVhc2lseSBiZSBhcyBhIGdpdCBob29rKSwgYW5kIHdoaWxzdCBpdCdzIG5vdCBhcyBlYXN5IGFz
IEkNCj4gbWlnaHQgaGF2ZQ0KPiA+IGxpa2VkIGl0IGlzIGRvYWJsZSAtIGhvd2V2ZXIgZXZlbiBp
ZiBpdCB3ZXJlIG11Y2ggZWFzaWVyLCB3ZSBoYXZlIHRvDQo+IGJlDQo+ID4gcmVhbGlzdGljIGFu
ZCBhY2tub3dsZWRnZSB0aGF0IG1vc3QgcGVvcGxlIHN0aWxsIHdvbid0IGRvIGl0Lg0KPiANCj4g
SSB0aG91Z2h0IGRlZmF1bHQgZ2l0IGhvb2tzIGNhbiBiZSBlbmZvcmNlZCBieSB0aGUgcmVtb3Rl
IHJlcG8gd2hlbiB5b3UNCj4gZG8gYSBjbG9uZSwgbm8/DQoNCk5vcGUsIHN0YW5kYXJkIEdpdCBo
YXMgbm8gc3VjaCBzdXBwb3J0LiBJdCB3b3VsZCBiZSBhIHNlY3VyaXR5IHJpc2sgaWYgDQp0aGUg
cmVtb3RlIHJlcG9zaXRvcnkgd291bGQgcHJvdmlkZSBob29rcyB0aGF0IHN0YXJ0ZWQgcnVubmlu
ZyBvbiB0aGUgDQpjbGllbnQgd2l0aG91dCBiZWluZyBhY3RpdmVseSBhY3RpdmF0ZWQuDQoNCj4g
QWxleA0KDQovL1BldGVyDQoNCg==

