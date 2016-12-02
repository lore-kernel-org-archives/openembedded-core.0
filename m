Return-Path: <henry.bruce@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9BD607B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 19:10:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 02 Dec 2016 11:10:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,288,1477983600"; d="scan'208";a="12801215"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2016 11:10:43 -0800
Received: from orsmsx116.amr.corp.intel.com (10.22.240.14) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 2 Dec 2016 11:10:43 -0800
Received: from orsmsx104.amr.corp.intel.com ([169.254.4.62]) by
	ORSMSX116.amr.corp.intel.com ([10.22.240.14]) with mapi id
	14.03.0248.002; Fri, 2 Dec 2016 11:10:43 -0800
From: "Bruce, Henry" <henry.bruce@intel.com>
To: "pab@pabigot.com" <pab@pabigot.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "paul.eggleton@linux.intel.com"
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] npm.bbclass support for deep native modules?
Thread-Index: AQHSSEgePiQ7K+1Ev0ubtj4q5Yp3yKDutRUAgAAG2QCABtkngA==
Date: Fri, 2 Dec 2016 19:10:41 +0000
Message-ID: <1480705839.8273.22.camel@intel.com>
References: <b3516f43-75eb-2fa5-31c6-ad5e3a57d032@pabigot.com>
	<5308703.KLEPbEOQKq@peggleto-mobl.ger.corp.intel.com>
	<f1da4624-99b2-46ec-a49d-892e2a491a8f@pabigot.com>
In-Reply-To: <f1da4624-99b2-46ec-a49d-892e2a491a8f@pabigot.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.198.61]
MIME-Version: 1.0
Subject: Re: npm.bbclass support for deep native modules?
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
X-List-Received-Date: Fri, 02 Dec 2016 19:10:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DB14D74A292B942AB33B109FF8A2CF2@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDE2LTExLTI4IGF0IDA0OjM1IC0wNjAwLCBQZXRlciBBLiBCaWdvdCB3cm90ZToN
Cg0KSGkgUGV0ZXIsDQoNCkknbSBoZWxwaW5nIFBhdWwgd2l0aCB0aGlzLiBTYWRseSwgSSdtIG5v
dCBtdWNoIG9mIGFuIG5wbSBleHBlcnQNCmVpdGhlciwgYnV0IHdhbnQgdG8gaW1wcm92ZSBzdXBw
b3J0IGZvciBub2RlLmpzIGRldmVsb3BtZW50LsKgDQoNCj4gDQo+IFNvcnJ5LCB0aGF0IHdhc24n
dCBjbGVhci7CoMKgc3RhdHNkIGRlcGVuZHMgb24gbW9kZXJuLXN5c2xvZyBidXQgdGhlwqANCj4g
bG9ja2Rvd24gYW5kIHNocmlua3dyYXAgZmlsZXMgZ2VuZXJhdGVkIGJ5IGRldnRvb2wgZG9uJ3Qg
aW5jbHVkZSBpdC4NCj4gRnJvbSB0aGUgV2lraToNCj4gDQo+ICJEZXZ0b29sIGNhbm5vdCBkZXRl
Y3QgbmF0aXZlIGxpYnJhcmllcyBpbiBtb2R1bGUgZGVwZW5kZW5jaWVzLCB5b3XCoA0KPiB5b3Un
bGwgbmVlZCB0byBtYW51YWxseSBhZGQgcGFja2FnZXMgdG8gcmVjaXBlIg0KPiANCj4gVGhlIFdp
a2kgZG9lc24ndCBnbyBpbnRvIGRldGFpbCBvZiBob3cgdGhhdCdzIHN1cHBvc2VkIHRvIGJlIGRv
bmUuIElzDQo+IHRoZSBleGlzdGluZyBpbmZyYXN0cnVjdHVyZSBzdXBwb3NlZCB0byBiZSBhYmxl
IHRvIGZpbmTCoA0KPiBnbG9iYWxseS1pbnN0YWxsZWQgbW9kdWxlcz8NCg0KSSBiZWxpZXZlIHRo
YXQgdGhpcyByZWZlcnMgdG8gbmF0aXZlIGNvZGUgZGVwZW5kaW5nIG9uIGFub3RoZXIgbmF0aXZl
DQpsaWJyYXJ5IChlLmcuIGxpYmZvbykuIEluIHRoaXMgY2FzZSwgYSBwYWNrYWdlIGZvciBsaWJm
b28gd291bGQgaGF2ZSB0bw0KYmUgYXZhaWxhYmxlIGFuZCBhZGRlZCB0byBERVBFTkRTLiBUaGlz
IGlzIG5vdCBhcHBsaWNhYmxlIGZvciBtb2Rlcm4tDQpzeXNsb2cuIFBhdWwgLSBjb3JyZWN0IG1l
IGlmIEkndmUgZ290IHRoaXMgd3JvbmcuDQoNCj4gSSdtIHdvbmRlcmluZyB3aGV0aGVyIGh0dHBz
Oi8veWFybnBrZy5jb20vIG9yIG9uZSBvZiB0aGUgb3RoZXIgbm9kZWpzDQo+IGRlcGVuZGVuY3kg
bWFuYWdlcnMgbWlnaHQgYmUgYW4gYWx0ZXJuYXRpdmUsIGFzIEkgYmVsaWV2ZSBucG0ncw0KPiBh
cHByb2FjaCB0byBkZXBlbmRlbmNpZXMgaXMgbm90IHN1aXRlZCB0byBsZXZlbCBvZiBsb2NrZG93
biBuZWVkZWQgYnkNCj4gWW9jdG8gYW5kIG1hbnkgb3RoZXIgcHJvZHVjdGlvbiBzeXN0ZW1zLg0K
DQpHb29kIGlkZWEsIGJ1dCB3ZSBuZWVkIHRvIGJhbGFuY2UgdGhlIGNvbXBsZXhpdHkgb2YgYWRk
aW5nIGFub3RoZXIgdG9vbA0KdnMuIGZpZ3VyaW5nIHRoaXMgb3V0IHdpdGggbnBtLg0KDQpCYWNr
IHRvIHRoZSBwcm9ibGVtLiBJIGhhdmUgcmUtY3JlYXRlZCB0aGUgc3RhdHNkIGJ1aWxkIGZhaWx1
cmUsIGFuZA0KYWdyZWUgd2l0aCB5b3VyIGRpYWdub3NpcywgYnV0IGRvbid0IGhhdmUgYW0gaW1t
ZWRpYXRlIHNvbHV0aW9uLiDCoA0KDQpJIGhhdmUgb3BlbmVkIGEgYnVnICMxMDc2MCwgYW5kIGFk
ZGVkIHlvdSB0byBDQyBsaXN0LiBMZXQncyB1c2UgdGhpcw0KYnVnIHRvIGNvbW11bmljYXRlIGZy
b20gaGVyZW9uLg0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNn
aT9pZD0xMDc2MA0KDQoNCkhlbnJ5DQo=

