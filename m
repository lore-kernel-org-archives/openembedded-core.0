Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWHjJ-000376-MM
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 02:15:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Dec 2011 17:09:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="97691757"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2011 17:09:14 -0800
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 2 Dec 2011 09:09:13 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 2 Dec 2011 09:09:13 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Fri, 2 Dec 2011
	09:09:10 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2011 09:09:09 +0800
Thread-Topic: [OE-core] [PATCH 4/8] libxfont: upgrade from 1.4.3 to 1.4.4
Thread-Index: AcyvrU5q5W5pqN42SgKVuaWOlsPssQA4AhBA
Message-ID: <1865303E0DED764181A9D882DEF65FB6E8EDF3A6A4@shsmsx502.ccr.corp.intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
	<7b66253699b50888fa21d9e79bc1d1e6898ff40a.1322662245.git.dexuan.cui@intel.com>
	<CAMKF1spEcQKvCHsBY68MQfPMXR8E-w7W9kyQrcbKq2RqvPVeCw@mail.gmail.com>
In-Reply-To: <CAMKF1spEcQKvCHsBY68MQfPMXR8E-w7W9kyQrcbKq2RqvPVeCw@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 4/8] libxfont: upgrade from 1.4.3 to 1.4.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Dec 2011 01:15:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

S2hlbSBSYWogd3JvdGUgb24gMjAxMS0xMi0wMToNCj4gT24gV2VkLCBOb3YgMzAsIDIwMTEgYXQg
NjoxMiBBTSwgRGV4dWFuIEN1aSA8ZGV4dWFuLmN1aUBpbnRlbC5jb20+DQo+IHdyb3RlOg0KPj4g
dXBkYXRlZCBMSUNfRklMRVNfQ0hLU1VNOg0KPj4gb25seSBDb3B5cmlnaHQgaG9sZGVyIGNoYW5n
ZSBpbiBDT1BZSU5HIC0tIG5vIGFjdHVhbCBsaWNlbnNlIGNoYW5nZS4NCj4+IA0KPj4gU2lnbmVk
LW9mZi1ieTogRGV4dWFuIEN1aSA8ZGV4dWFuLmN1aUBpbnRlbC5jb20+IC0tLQ0KPj4gwqAuLi4v
e2xpYnhmb250XzEuNC4zLmJiID0+IGxpYnhmb250XzEuNC40LmJifSDCoCDCoCDCoCB8IMKgIMKg
OCArKystLS0tLSDCoDENCj4+IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkgwqByZW5hbWUNCj4+IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi97bGli
eGZvbnRfMS40LjMuYmIgPT4gbGlieGZvbnRfMS40LjQuYmJ9DQo+PiAoNjIlKQ0KPj4gDQo+PiBk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhmb250XzEuNC4z
LmJiDQo+PiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4Zm9udF8xLjQuNC5i
YiBzaW1pbGFyaXR5IGluZGV4IDYyJQ0KPj4gcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL2xpYnhmb250XzEuNC4zLmJiIHJlbmFtZSB0bw0KPj4gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctbGliL2xpYnhmb250XzEuNC40LmJiIGluZGV4IDQzYTYyOGUuLjhhZjBh
YzkNCj4+IDEwMDY0NCAtLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGZv
bnRfMS40LjMuYmIgKysrDQo+PiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4
Zm9udF8xLjQuNC5iYiBAQCAtNyw3ICs3LDcgQEAgc3VjaA0KPj4gYXMgZnJlZXR5cGUpLiIgwqBy
ZXF1aXJlIHhvcmctbGliLWNvbW1vbi5pbmMNCj4+IA0KPj4gwqBMSUNFTlNFPSAiTUlUICYgTUlU
LXN0eWxlICYgQlNEIiAtTElDX0ZJTEVTX0NIS1NVTSA9DQo+PiAiZmlsZTovL0NPUFlJTkc7bWQ1
PWRlZWVlMWMyOWYzMmNhNzc0Y2VjZjBjODNiNDZiYjVjIiArTElDX0ZJTEVTX0NIS1NVTQ0KPj4g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWE0NmM4MDQwZjJmNzM3YmNkMGM0MzVmZWIyYWIxYzJjIg0K
Pj4gDQo+PiDCoERFUEVORFMgKz0gImZyZWV0eXBlIGZvbnRjYWNoZXByb3RvIHh0cmFucyBmb250
c3Byb3RvIGxpYmZvbnRlbmMiDQo+PiDCoFBST1ZJREVTID0gInhmb250Ig0KPj4gQEAgLTE1LDEx
ICsxNSw5IEBAIFBST1ZJREVTID0gInhmb250Ig0KPj4gwqBQUiA9ICJyMCINCj4+IMKgUEUgPSAi
MSINCj4+IA0KPj4gLSNTUkNfVVJJICs9ICJmaWxlOi8vbm8tc2NhbGFibGUtY3Jhc2gucGF0Y2gi
DQo+PiAtDQo+IA0KPiBQbGVhc2Ugcm0gdGhlIHBhdGNoIGFzIHdlbGwuDQogDQpUaGFua3MgZm9y
IHRoZSByZW1pbmRlciEgIEkgZGlkbid0IGZpbmQgdGhlIHBhdGNoIHNvbWVob3cuLi4gc29ycnku
DQpJJ2xsIHNlbmQgYSBuZXcgY29tbWl0IHRvIHJlbW92ZSB0aGUgcGF0Y2guDQoNClRoYW5rcywN
Ci0tIERleHVhbg0KDQo=


