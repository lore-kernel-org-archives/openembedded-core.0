Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 632AE7F296
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 08:04:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Sep 2019 01:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="360064596"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by orsmga005.jf.intel.com with ESMTP; 11 Sep 2019 01:04:44 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.57]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.216]) with mapi id
	14.03.0439.000; Wed, 11 Sep 2019 16:02:05 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "li.zhou@windriver.com" <li.zhou@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] qemu: Security Advisory - qemu - CVE-2019-15890
Thread-Index: AQHVaGa2vngLr0uUSkma/OjYetQM4qclkMOAgAAD0wCAAALlAA==
Date: Wed, 11 Sep 2019 08:02:04 +0000
Message-ID: <e16bb1f580e04f08eb961339e97db29bc5ba46f7.camel@intel.com>
References: <1568181773-91288-1-git-send-email-li.zhou@windriver.com>
	<8d42e3a265dcb8c3dc5398d0f6056df9f0d7940e.camel@intel.com>
	<a69a4699-d89a-098e-98fb-2c41f8cefbb3@windriver.com>
In-Reply-To: <a69a4699-d89a-098e-98fb-2c41f8cefbb3@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.128.76]
MIME-Version: 1.0
Subject: Re: [PATCH] qemu: Security Advisory - qemu - CVE-2019-15890
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
X-List-Received-Date: Wed, 11 Sep 2019 08:04:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E78367089794F44B53DA94FD4A06D8E@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTA5LTExIGF0IDE1OjUxICswODAwLCB6aG91IGxpIHdyb3RlOg0KPiBPbiAy
MDE5LzA5LzExIDE1OjM4LCBNaXR0YWwsIEFudWogd3JvdGU6DQo+ID4gT24gV2VkLCAyMDE5LTA5
LTExIGF0IDE0OjAyICswODAwLCBMaSBaaG91IHdyb3RlOg0KPiA+ID4gQmFja3BvcnRpbmcgcGF0
Y2ggZnJvbQ0KPiA+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3NsaXJwL2xpYnNs
aXJwL2NvbW1pdC9jNTkyNzk0Mw0KPiA+ID4gdG8gc29sdmUgQ1ZFLTIwMTktMTU4OTAuDQo+ID4g
PiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExpIFpob3UgPGxpLnpob3VAd2luZHJpdmVyLmNvbT4N
Cj4gPiA+IC0tLQ0KPiA+ID4gICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyAg
ICAgICAgICAgICAgICB8ICAxICsNCj4gPiA+ICAgLi4uL3FlbXUvcWVtdS9DVkUtMjAxOS0xNTg5
MC5wYXRjaCAgICAgICAgICAgICAgICAgfCA0OA0KPiA+ID4gKysrKysrKysrKysrKysrKysrKysr
Kw0KPiA+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykNCj4gPiA+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZFLTIwMTkt
DQo+ID4gPiAxNTg5MC5wYXRjaA0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgYi9tZXRhL3JlY2lwZXMtDQo+ID4gPiBkZXZ0b29s
cy9xZW11L3FlbXUuaW5jDQo+ID4gPiBpbmRleCAyNDFmOWRiLi5kZTIxZDMwIDEwMDY0NA0KPiA+
ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gPiA+ICsrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jDQo+ID4gPiBAQCAtMjMsNiArMjMs
NyBAQCBTUkNfVVJJID0gIg0KPiA+ID4gaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZy8ke0JQTn0t
JHtQVn0udGFyLnh6IFwNCj4gPiA+ICAgICAgICAgICAgICBmaWxlOi8vMDAwOC1saW51eC11c2Vy
LUZpeC13ZWJraXRndGstaGFuZ3Mtb24tMzItDQo+ID4gPiBiaXQteDg2LQ0KPiA+ID4gdGFyZ2V0
LnBhdGNoIFwNCj4gPiA+ICAgICAgICAgICAgICBmaWxlOi8vMDAwOS1GaXgtd2Via2l0Z3RrLWJ1
aWxkcy5wYXRjaCBcDQo+ID4gPiAgICAgICAgICAgICAgZmlsZTovLzAwMTAtY29uZmlndXJlLUFk
ZC1wa2ctY29uZmlnLWhhbmRsaW5nLWZvci0NCj4gPiA+IGxpYmdjcnlwdC5wYXRjaCBcDQo+ID4g
PiArICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMTktMTU4OTAucGF0Y2ggXA0KPiA+ID4gICAgICAg
ICAgICAgICINCj4gPiA+ICAgVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicWVtdS0oP1A8cHZlcj5c
ZCsoXC5cZCspKylcLnRhciINCj4gPiA+ICAgDQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS9DVkUtMjAxOS0xNTg5MC5wYXRjaA0KPiA+ID4gYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L0NWRS0yMDE5LTE1ODkwLnBhdGNoDQo+ID4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gaW5kZXggMDAwMDAwMC4uMWQ4OTQzMQ0KPiA+ID4g
LS0tIC9kZXYvbnVsbA0KPiA+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS9DVkUtMjAxOS0xNTg5MC5wYXRjaA0KPiA+ID4gQEAgLTAsMCArMSw0OCBAQA0KPiA+ID4gK0Zy
b20gNGZjMGQyM2U4ZjZkNzk1YzY3OTYyM2QyZWQyY2JlNmE3YTE3YjljNyBNb24gU2VwIDE3DQo+
ID4gPiAwMDowMDowMA0KPiA+ID4gMjAwMQ0KPiA+ID4gK0Zyb206IExpIFpob3UgPGxpLnpob3VA
d2luZHJpdmVyLmNvbT4NCj4gPiBDYW4geW91IHBsZWFzZSBmaXggdGhlIGF1dGhvciBuYW1lIGhl
cmU/DQo+IA0KPiBEbyB5b3UgbWVhbiBpdCBzaG91bGQgYmUgdGhlIG9yaWdpbmFsIGF1dGhvcj8N
Cj4gDQo+IEhlcmUgaXMgbXkgbmFtZSBiZWNhdXNlIEkgaGF2ZSBhZGFwdGVkIHN0aCAodGhlIGZp
bGUgcGF0aCkgaW4gdGhlDQo+IHBhdGNoLg0KPiANCg0KWWVzLCBpdCBzaG91bGQgc3RpbGwgcmVm
bGVjdCB0aGUgbmFtZSBvZiBvcmlnaW5hbCBhdXRob3IgaGVyZS4NCg0KPiBTaG91bGQgSSBjaGFu
Z2UgaXQgYmFjayBieSBoYW5kIGhlcmU/DQo+IA0KDQpnaXQgY29tbWl0IC0tYW1lbmQgLS1hdXRo
b3IgIm5hbWUgPGVtYWlsPiINCg0Kc2hvdWxkIGhlbHAuDQoNClRoYW5rcywNCg0KQW51ag0K

