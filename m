Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id BDC317F3B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:55:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2019 03:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="196831896"
Received: from pgsmsx112.gar.corp.intel.com ([10.108.55.201])
	by orsmga007.jf.intel.com with ESMTP; 20 Nov 2019 03:55:35 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.88]) by
	PGSMSX112.gar.corp.intel.com ([10.108.55.201]) with mapi id
	14.03.0439.000; Wed, 20 Nov 2019 19:55:34 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "zangrc.fnst@cn.fujitsu.com"
	<zangrc.fnst@cn.fujitsu.com>
Thread-Topic: [OE-core]  [PATCH] alsa-lib:upgrade 1.1.9 -> 1.2.1.1
Thread-Index: AQHVn2HQUQF/RRh8l0WNzACu7mNml6eTbe6A
Date: Wed, 20 Nov 2019 11:55:33 +0000
Message-ID: <7620b40b6ba965474794d7a4b9b280c8c5a849bf.camel@intel.com>
References: <20191120051704.24066-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191120051704.24066-1-zangrc.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.229.215]
MIME-Version: 1.0
Subject: Re: [PATCH] alsa-lib:upgrade 1.1.9 -> 1.2.1.1
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
X-List-Received-Date: Wed, 20 Nov 2019 11:55:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1529006A34014041B42F4A481DFF42AA@intel.com>
Content-Transfer-Encoding: base64

VGhpcyB2ZXJzaW9uIGhhcyBtb3ZlZCB1Y20gYW5kIHRvcG9sb2d5IGNvbmYgZmlsZXMgdG8gc2Vw
YXJhdGUNCnJlcG9zaXRvcmllcy4gV2Ugc2hvdWxkIGFsc28gcHJvYmFibHkgZmV0Y2ggYW5kIHBh
Y2thZ2UgdGhvc2UuDQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS1saWIv
Y29tbWl0LzFmMzdiYTJhMmIxYzA3YzA0ZGUxYzM2OGNkNDk0M2Y3MTJjY2NmYTUNCg0KaHR0cHM6
Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLWxpYi9jb21taXQvY2RjOGFhY2JiNTdjODJh
ODFlM2IzOThmMmVkZTY0NDBkNDkzMzRhNQ0KDQpUaGFua3MsDQoNCkFudWoNCg0KT24gV2VkLCAy
MDE5LTExLTIwIGF0IDEzOjE3ICswODAwLCBaYW5nIFJ1b2NoZW4gd3JvdGU6DQo+IFRoZSBmb2xs
b3dpbmcgZXJyb3Igb2NjdXJyZWQgZHVyaW5nIHRoZSBzdGVwcyBvZiBkby1jb25maWd1cmU6DQo+
ID4gRml4aW5nIGxpYnRvb2wgZm9yIC1ycGF0aCBwcm9ibGVtcy4NCj4gPiAuLi9hbHNhLWxpYi0x
LjIuMS4xL2NvbmZpZ3VyZTogbGluZSAxNjU2NzogbGlidG9vbDogTm8gc3VjaCBmaWxlIG9yDQo+
ID4gZGlyZWN0b3J5DQo+ID4gbXY6IGNhbm5vdCBzdGF0ICdsaWJ0b29sLTInOiBObyBzdWNoIGZp
bGUgb3IgZGlyZWN0b3J5DQo+ID4gY2htb2Q6IGNhbm5vdCBhY2Nlc3MgJ2xpYnRvb2wnOiBObyBz
dWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+IA0KPiBhZGQgYWxzYS1saWIvMDAwMS1GaXgtcHJvYmxl
bS13aXRoLWxpYnRvb2wtbm90LWZvdW5kLnBhdGNoIHRvIGZpeCBpdC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFphbmcgUnVvY2hlbiA8emFuZ3JjLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0K
PiAgLi4uMS1GaXgtcHJvYmxlbS13aXRoLWxpYnRvb2wtbm90LWZvdW5kLnBhdGNoIHwgMzENCj4g
KysrKysrKysrKysrKysrKysrKw0KPiAgLi4ue2Fsc2EtbGliXzEuMS45LmJiID0+IGFsc2EtbGli
XzEuMi4xLjEuYmJ9IHwgIDggKysrLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliLzAwMDEtRml4LQ0KPiBwcm9ibGVtLXdpdGgtbGlidG9v
bC1ub3QtZm91bmQucGF0Y2gNCj4gIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNh
L3thbHNhLWxpYl8xLjEuOS5iYiA9PiBhbHNhLQ0KPiBsaWJfMS4yLjEuMS5iYn0gKDgzJSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliLzAw
MDEtRml4LXByb2JsZW0tDQo+IHdpdGgtbGlidG9vbC1ub3QtZm91bmQucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtDQo+IGxpYi8wMDAxLUZpeC1wcm9ibGVtLXdpdGgt
bGlidG9vbC1ub3QtZm91bmQucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXgg
MDAwMDAwMDAwMC4uNWZiODRjZDZmOA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWIvMDAwMS1GaXgtcHJvYmxlbS13aXRoLQ0KPiBs
aWJ0b29sLW5vdC1mb3VuZC5wYXRjaA0KPiBAQCAtMCwwICsxLDMxIEBADQo+ICtGcm9tIGY0MTky
NzZhNzE2ZGFmOGQ5ODg0NmIzZGY1MDk5NWU1YWMwMzAxMzQgTW9uIFNlcCAxNyAwMDowMDowMA0K
PiAyMDAxDQo+ICtGcm9tOiBaYW5nIFJ1b2NoZW4gPHphbmdyYy5mbnN0QGNuLmZ1aml0c3UuY29t
Pg0KPiArRGF0ZTogV2VkLCAyMCBOb3YgMjAxOSAxMToyNDoxNyArMDgwMA0KPiArU3ViamVjdDog
W1BBVENIXSBGaXggcHJvYmxlbSB3aXRoIGxpYnRvb2wgbm90IGZvdW5kDQo+ICsNCj4gK1Vwc3Ry
ZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZQ0KPiArU2lnbmVkLW9mZi1ieTogWmFuZyBSdW9jaGVu
IDx6YW5ncmMuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gKy0tLQ0KPiArIGNvbmZpZ3VyZS5hYyB8
IDYgKysrLS0tDQo+ICsgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYw0K
PiAraW5kZXggMzVlYjMxNS4uNTQ4YjllYSAxMDA2NDQNCj4gKy0tLSBhL2NvbmZpZ3VyZS5hYw0K
PiArKysrIGIvY29uZmlndXJlLmFjDQo+ICtAQCAtNzY5LDkgKzc2OSw5IEBAIGRubCBUYWtlbiBm
cm9tIA0KPiBodHRwczovL3dpa2kuZGViaWFuLm9yZy9ScGF0aElzc3VlDQo+ICsgY2FzZSAkaG9z
dCBpbg0KPiArICAgICotKi1saW51eC1nbnUpDQo+ICsgICAgQUNfTVNHX1JFU1VMVChbRml4aW5n
IGxpYnRvb2wgZm9yIC1ycGF0aCBwcm9ibGVtcy5dKQ0KPiArLSAgIHNlZCA8IGxpYnRvb2wgPiBs
aWJ0b29sLTIgXA0KPiArKyAgIHNlZCA8ICIkc3JjZGlyIi9saWJ0b29sID4gIiRzcmNkaXIiL2xp
YnRvb2wtMiBcDQo+ICsgICAgICAncy9eaGFyZGNvZGVfbGliZGlyX2ZsYWdfc3BlYy4qJCcvJ2hh
cmRjb2RlX2xpYmRpcl9mbGFnX3NwZWM9Ig0KPiAtRF9fTElCVE9PTF9JU19BX0ZPT0xfXyAiLycN
Cj4gKy0gICBtdiBsaWJ0b29sLTIgbGlidG9vbA0KPiArLSAgIGNobW9kIDc1NSBsaWJ0b29sDQo+
ICsrICAgbXYgIiRzcmNkaXIiL2xpYnRvb2wtMiAiJHNyY2RpciIvbGlidG9vbA0KPiArKyAgIGNo
bW9kIDc1NSAiJHNyY2RpciIvbGlidG9vbA0KPiArICA7Ow0KPiArIGVzYWMNCj4gKy0tIA0KPiAr
Mi4yMC4xDQo+ICsNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2Ev
YWxzYS1saWJfMS4xLjkuYmINCj4gYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2Et
bGliXzEuMi4xLjEuYmINCj4gc2ltaWxhcml0eSBpbmRleCA4MyUNCj4gcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYl8xLjEuOS5iYg0KPiByZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYl8xLjIuMS4xLmJiDQo+IGluZGV4
IDJjNjNlZTc1MjIuLjU2NTQ0YjBkNDUgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2Fsc2EvYWxzYS1saWJfMS4xLjkuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvYWxzYS9hbHNhLWxpYl8xLjIuMS4xLmJiDQo+IEBAIC03LDkgKzcsMTEgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICINCj4gZmlsZTovL0NPUFlJTkc7bWQ1PWE5MTY0NjdiOTEwNzZlNjMxZGQ4
ZWRiNzQyNDc2OWM3IFwNCj4gICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9zb2NrZXQu
YzttZDU9ZGQxYmM3ZjQ0ODcyNjkwMjI0ZDg5YzFhDQo+IDk4MDZlNDk1O2JlZ2lubGluZT0xO2Vu
ZGxpbmU9MjYgXA0KPiAgICAgICAgICAgICAgICAgICAgICAiDQo+ICANCj4gLVNSQ19VUkkgPSAi
aHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy9maWxlcy9wdWIvbGliLyR7QlB9LnRhci5iejIi
DQo+IC1TUkNfVVJJW21kNXN1bV0gPSAiZTZkNDI5ZGJkY2ZhYTBmMDM0ZDkwN2ZhNmRjMzczNWUi
DQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiNDg4MzczYWVmNTM5NjY4MmYzYTQxMWE2ZDA2
NGFlMGFkMTk2YjljOTYyNjlkMGJiOTEyZmJkZWVjOTRiOTk0YiINCj4gK1NSQ19VUkkgPSAiaHR0
cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy9maWxlcy9wdWIvbGliLyR7QlB9LnRhci5iejINCj4g
XA0KPiArICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtcHJvYmxlbS13aXRoLWxpYnRvb2wtbm90
LWZvdW5kLnBhdGNoIFwNCj4gKyAgICAgICAgICAiDQo+ICtTUkNfVVJJW21kNXN1bV0gPSAiMWQ0
MjhmNDZkNjE2MGY1ZTRiYmRkNjRhMmZmMzRmNDUiDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0K
PiAiYzk1YWM2M2MwYWFkNDNhNmFjNDU3ZDk2MDU2OTA5NmIwYjJlZjcyZGM0ZTM3MzdlNzdlM2Uy
ZGU4NzAyMmNlYyINCj4gIA0KPiAgaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnDQo+ICANCj4g
LS0gDQo+IDIuMjAuMQ0KPiANCj4gDQo+IA0K

