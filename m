Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E7DBA7FD6D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 06:24:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 22:24:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="426950147"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
	by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2020 22:24:37 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.131]) by
	KMSMSX156.gar.corp.intel.com ([169.254.1.217]) with mapi id
	14.03.0439.000; Tue, 21 Jan 2020 14:24:33 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Saloni.Jain@kpit.com"
	<Saloni.Jain@kpit.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [poky][master][PATCH] Added patch for CVE-2019-12900
	as backport from upstream.
Thread-Index: AQHV0CIL/xQ3jDQ+70qQ/qxzW8Losaf0IIIA
Date: Tue, 21 Jan 2020 06:24:33 +0000
Message-ID: <9656a44dab659a1acd428818253a605b4059ca4e.camel@intel.com>
References: <1579587259-18617-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1579587259-18617-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.21.137]
MIME-Version: 1.0
Cc: "Nisha.Parrakat@kpit.com" <Nisha.Parrakat@kpit.com>,
	"Sana.Kazi@kpit.com" <Sana.Kazi@kpit.com>
Subject: Re: [poky][master][PATCH] Added patch for CVE-2019-12900 as backport from upstream.
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
X-List-Received-Date: Tue, 21 Jan 2020 06:24:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DCDCFABBA7B254390F605F5F76B14BA@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTAxLTIxIGF0IDA2OjE0ICswMDAwLCBTYWxvbmkgSmFpbiB3cm90ZToNCj4g
RnJvbTogU2FuYSBLYXppIDxTYW5hLkthemlAa3BpdC5jb20+DQo+IA0KPiBGaXhlcyBvdXQgb2Yg
Ym91bmQgYWNjZXNzIGRpc2NvdmVyZWQgd2hpbGUgZnV6enlpbmcga2FyY2hpdmUuDQo+IA0KPiBU
ZXN0ZWQgYnk6IFNhbmEuS2F6aUBrcGl0LmNvbQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2Fsb25p
IEphaW4gPFNhbG9uaS5KYWluQGtwaXQuY29tPg0KPiAtLS0NCj4gIC4uLi9iemlwMi9iemlwMi0x
LjAuNi9DVkUtMjAxOS0xMjkwMC5wYXRjaCAgICAgICAgIHwgMzYNCj4gKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykNCg0KVGhlIHBhdGNo
IGZpbGUgd291bGQgYWxzbyBuZWVkIHRvIGluY2x1ZGVkIGluIHRoZSByZWNpcGUgU1JDX1VSSS4g
QWxzbywNCnRoaXMgcGF0Y2ggc2hvdWxkIG9ubHkgYmUgYXBwbGljYWJsZSB0byB3YXJyaW9yL3Ro
dWQgc2luY2UgaXQncyBhbHJlYWR5DQppbiAxLjAuNy4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=

