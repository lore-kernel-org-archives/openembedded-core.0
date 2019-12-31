Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7127FA1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 01:26:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Dec 2019 17:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,377,1571727600"; d="scan'208";a="269783739"
Received: from pgsmsx108.gar.corp.intel.com ([10.221.44.103])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Dec 2019 17:26:21 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.61]) by
	PGSMSX108.gar.corp.intel.com ([169.254.8.26]) with mapi id
	14.03.0439.000; Tue, 31 Dec 2019 09:26:21 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [zeus][PATCH 0/9] zeus -next review
Thread-Index: AQHVtVJOgywIEYY/jkOfuLc94VSkYafTAdsA
Date: Tue, 31 Dec 2019 01:26:20 +0000
Message-ID: <386084749a3a5974ea192ebd8714446fcee7fdc9.camel@intel.com>
References: <cover.1576638856.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1576638856.git.anuj.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.16.254]
MIME-Version: 1.0
Subject: Re: [zeus][PATCH 0/9] zeus -next review
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
X-List-Received-Date: Tue, 31 Dec 2019 01:26:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <66FB269BD5F2F74699B6F4A3D90F2E89@intel.com>
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KT24gV2VkLCAyMDE5LTEyLTE4IGF0IDExOjIwICswODAwLCBBbnVqIE1p
dHRhbCB3cm90ZToNCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiA5YzBj
OGU1MWRkMzQ1ZGQxYjZiYTI0MGIwMjdkMjRhMThmNTU3NTdjOg0KPiANCj4gICBZUCAzLjAuMSBE
b2NzOiBGaXhlZCBtYW51YWwgcmV2aXNpb24gdGFibGVzLiAoMjAxOS0xMi0xNiAyMzozMjozOQ0K
PiArMDAwMCkNCj4gDQo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0K
PiANCj4gICBnaXQ6Ly9wdXNoLnlvY3RvcHJvamVjdC5vcmcvcG9reS1jb250cmliIGFudWptL3pl
dXMNCj4gDQo+IEFkcmlhbiBCdW5rICgyKToNCj4gICBvcGVuc3NsOiBXaGl0ZWxpc3QgQ1ZFLTIw
MTktMDE5MA0KPiAgIHB5dGhvbi9weXRob24zOiBXaGl0ZWxpc3QgQ1ZFLTIwMTktMTgzNDgNCj4g
DQo+IEFudWogTWl0dGFsICgzKToNCj4gICBnaXQ6IHVwZ3JhZGUgMi4yMy4wIC0+IDIuMjMuMQ0K
PiAgIG9wZW5zc2w6IGZpeCBDVkUtMjAxOS0xNTUxDQo+ICAgc3lzc3RhdDogZml4IENWRS0yMDE5
LTE5NzI1DQo+IA0KPiBLaGVtIFJhaiAoMSk6DQo+ICAgbnNzOiBCYWNrcG9ydCBjbGFuZyBidWls
ZCBmaXgNCj4gDQo+IFF1YW55YW5nIFdhbmcgKDEpOg0KPiAgIGx0dG5nLW1vZHVsZXM6IGZpeCBO
VUxMIHBvaW50ZXIgZGVmZXJlbmNlIGVycm9yIHdoZW4gdGVzdGluZw0KPiAgICAgcnBjX3Rhc2tf
cnVubmluZw0KPiANCj4gUmljaGFyZCBQdXJkaWUgKDEpOg0KPiAgIHFlbXUtaGVscGVyLW5hdGl2
ZS9zeXN0ZW10YXAtbmF0aXZlOiBFbnN1cmUgc3lzcm9vdHMgYXJlIHBvcHVsYXRlZA0KPiAgICAg
d2l0aCBkZXBlbmRlbmNpZXMNCj4gDQo+IFNsYXZpYyBCcnV0YWxpayAoMSk6DQo+ICAgc3lzdGVt
ZC1zeXN0ZW1jdGw6IEZpeCBoYW5kbGluZyBvZiBhbGlhc2VkIHRhcmdldHMNCj4gDQoNCkNhbiB5
b3UgcGxlYXNlIG1lcmdlIHRoZXNlIGNoYW5nZXMgaW4gemV1cz8NCg0KVGhhbmtzLA0KDQpBbnVq
DQo=

