Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A3E757F423
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 03:53:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 20:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,356,1559545200"; d="scan'208";a="203043654"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2019 20:53:55 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.22]) by
	PGSMSX111.gar.corp.intel.com ([169.254.2.22]) with mapi id
	14.03.0439.000; Wed, 7 Aug 2019 11:53:54 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "zangrc.fnst@cn.fujitsu.com"
	<zangrc.fnst@cn.fujitsu.com>
Thread-Topic: [OE-core]  [PATCH] flac:upgrade 1.3.2 -> 1.3.3
Thread-Index: AQHVTMt9GAZes6u6U0uoA8DYns0A9abuh8GA
Date: Wed, 7 Aug 2019 03:53:54 +0000
Message-ID: <913721d209f4296f695bf238976d92e25ac2667d.camel@intel.com>
References: <20190807025345.24426-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190807025345.24426-1-zangrc.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.199.133]
MIME-Version: 1.0
Subject: Re: [PATCH] flac:upgrade 1.3.2 -> 1.3.3
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
X-List-Received-Date: Wed, 07 Aug 2019 03:53:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2EDB328DE8B59F48891A772EE5768E67@intel.com>
Content-Transfer-Encoding: base64

VGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggdGhpcyB2ZXJzaW9uIGFuZCBpdCBsb29rcyBsaWtlIHRo
ZXJlJ2QgYmUgYQ0KMS4zLjQ6DQoNCmh0dHBzOi8vZ2l0LnhpcGgub3JnLz9wPWZsYWMuZ2l0O2E9
Y29tbWl0O2g9M2IzNmZlMjYwZTkyZjNjMmNhYjM2ODBkZjBjZDIwZTBjOGI5MzgxNw0KDQpUaGFu
a3MsDQoNCkFudWoNCg0KT24gV2VkLCAyMDE5LTA4LTA3IGF0IDEwOjUzICswODAwLCBaYW5nIFJ1
b2NoZW4gd3JvdGU6DQo+IC1mbGFjL0NWRS0yMDE3LTY4ODgucGF0Y2gNCj4gIFJlbW92ZWQgc2lu
Y2UgdGhpcyBpcyBpbmNsdWRlZCBpbiAxLjMuMy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFphbmcg
UnVvY2hlbiA8emFuZ3JjLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgLi4uL2ZsYWMv
ZmxhYy9DVkUtMjAxNy02ODg4LnBhdGNoICAgICAgICAgICAgICAgICAgfCAzNyAtLS0tLS0tLS0t
LS0NCj4gLS0tLS0tLS0tLQ0KPiAgLi4uL2ZsYWMve2ZsYWNfMS4zLjIuYmIgPT4gZmxhY18xLjMu
My5iYn0gICAgICAgICAgfCAgNyArKy0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgNDEgZGVsZXRpb25zKC0pDQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZmxhYy9mbGFjL0NWRS0yMDE3LQ0KPiA2ODg4LnBhdGNoDQo+ICByZW5hbWUg
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmxhYy97ZmxhY18xLjMuMi5iYiA9PiBmbGFjXzEuMy4z
LmJifQ0KPiAoOTElKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2ZsYWMvZmxhYy9DVkUtMjAxNy02ODg4LnBhdGNoDQo+IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZmxhYy9mbGFjL0NWRS0yMDE3LTY4ODgucGF0Y2gNCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0DQo+IGluZGV4IGYwMTc5MTYuLjAwMDAwMDANCj4gLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZmxhYy9mbGFjL0NWRS0yMDE3LTY4ODgucGF0Y2gNCj4gKysrIC9kZXYvbnVsbA0KPiBA
QCAtMSwzNyArMCwwIEBADQo+IC1Gcm9tIDQzZWNiNjQzMTA3N2ZmNTRlOWRmMjdmNzE3MzdlNmU5
NmQ2YzAzOWYgTW9uIFNlcCAxNyAwMDowMDowMA0KPiAyMDAxDQo+IC1Gcm9tOiBDaGFuZ3Fpbmcg
TGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPg0KPiAtRGF0ZTogVHVlLCAyMSBBdWcgMjAx
OCAxNDo0Njo0MyArMDgwMA0KPiAtU3ViamVjdDogW1BBVENIXSBGcm9tIDVmNDdiNjNlOWM5NzFl
NjM5MTU5MGNhZjAwYTBmMmE1ZWQ2MTJlNjcgTW9uDQo+IFNlcCAxNw0KPiAtIDAwOjAwOjAwIDIw
MDEgRnJvbTogRXJpayBkZSBDYXN0cm8gTG9wbyA8ZXJpa2RAbWVnYS1uZXJkLmNvbT4gRGF0ZToN
Cj4gU2F0LCA4DQo+IC0gQXByIDIwMTcgMTg6MzQ6NDkgKzEwMDAgU3ViamVjdDogW1BBVENIXSBz
dHJlYW1fZGVjb2Rlci5jOiBGaXggYQ0KPiBtZW1vcnkgbGVhaw0KPiAtDQo+IC1MZWFrIHJlcG9y
dGVkIGJ5IFNlY3VuaWEgUmVzZWFyY2guDQo+IC0NCj4gLVVwc3RyZWFtLVN0YXR1czogQmFja3Bv
cnRbaHR0cHM6Ly9naXQueGlwaC5vcmcvP3A9ZmxhYy5naXQ7YT1jb21taXQ7DQo+IC0gICAgICAg
ICAgICAgICAgIGg9NGY0N2I2M2U5Yzk3MWU2MzkxNTkwY2FmMDBhMGYyYTVlZDYxMmU2N10NCj4g
LQ0KPiAtVXBkYXRlIHBhdGNoIHRvIHZlcnNpb24gMS4zLjINCj4gLUNWRTogQ1ZFLTIwMTctNjg4
OA0KPiAtDQo+IC1TaWduZWQtb2ZmLWJ5OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5k
cml2ZXIuY29tPg0KPiAtLS0tDQo+IC0gc3JjL2xpYkZMQUMvc3RyZWFtX2RlY29kZXIuYyB8IDMg
KysrDQo+IC0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiAtDQo+IC1kaWZmIC0t
Z2l0IGEvc3JjL2xpYkZMQUMvc3RyZWFtX2RlY29kZXIuYw0KPiBiL3NyYy9saWJGTEFDL3N0cmVh
bV9kZWNvZGVyLmMNCj4gLWluZGV4IGQzNjRiMGMuLmViZjkzZGEgMTAwNjQ0DQo+IC0tLS0gYS9z
cmMvbGliRkxBQy9zdHJlYW1fZGVjb2Rlci5jDQo+IC0rKysgYi9zcmMvbGliRkxBQy9zdHJlYW1f
ZGVjb2Rlci5jDQo+IC1AQCAtMTc1OSw2ICsxNzU5LDkgQEAgRkxBQ19fYm9vbA0KPiByZWFkX21l
dGFkYXRhX3ZvcmJpc2NvbW1lbnRfKEZMQUNfX1N0cmVhbURlY29kZXIgKmRlY29kZXIsIEZMQUNf
X1N0cmUNCj4gLSAJCQkJCX0NCj4gLSAJCQkJCW1lbXNldCAob2JqLT5jb21tZW50c1tpXS5lbnRy
eSwgDQo+IDAsIG9iai0+Y29tbWVudHNbaV0ubGVuZ3RoKSA7DQo+IC0gCQkJCQlpZg0KPiAoIUZM
QUNfX2JpdHJlYWRlcl9yZWFkX2J5dGVfYmxvY2tfYWxpZ25lZF9ub19jcmMoZGVjb2Rlci0+cHJp
dmF0ZV8tDQo+ID5pbnB1dCwgb2JqLT5jb21tZW50c1tpXS5lbnRyeSwgb2JqLT5jb21tZW50c1tp
XS5sZW5ndGgpKSB7DQo+IC0rCQkJCQkJLyogQ3VycmVudCBpLXRoIGVudHJ5DQo+IGlzIGJhZCwg
c28gd2UgZGVsZXRlIGl0LiAqL1wNCj4gLSsJCQkJCQlmcmVlIChvYmotDQo+ID5jb21tZW50c1tp
XS5lbnRyeSkgOw0KPiAtKwkJCQkJCW9iai0+Y29tbWVudHNbaV0uZW50cnkNCj4gPSBOVUxMIDsJ
CQkJCQkNCj4gLSAJCQkJCQlvYmotPm51bV9jb21tZW50cyA9IGk7DQo+IC0gCQkJCQkJZ290byBz
a2lwOw0KPiAtIAkJCQkJfQ0KPiAtLS0gDQo+IC0yLjcuNA0KPiAtDQo+IGRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mbGFjL2ZsYWNfMS4zLjIuYmINCj4gYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9mbGFjL2ZsYWNfMS4zLjMuYmINCj4gc2ltaWxhcml0eSBpbmRleCA5MSUN
Cj4gcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmxhYy9mbGFjXzEuMy4yLmJi
DQo+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mbGFjL2ZsYWNfMS4zLjMuYmIN
Cj4gaW5kZXggZTg1OTlmNi4uZWQ4MmUyNSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZmxhYy9mbGFjXzEuMy4yLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2ZsYWMvZmxhY18xLjMuMy5iYg0KPiBAQCAtMTUsMTEgKzE1LDEwIEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiDQo+IGZpbGU6Ly9DT1BZSU5HLkZETDttZDU9YWQxNDE5ZWNjNTZlMDYwZWNjZjgx
ODRhODdjNDI4NWYgXA0KPiAgREVQRU5EUyA9ICJsaWJvZ2ciDQo+ICANCj4gIFNSQ19VUkkgPSAi
aHR0cDovL2Rvd25sb2Fkcy54aXBoLm9yZy9yZWxlYXNlcy9mbGFjLyR7QlB9LnRhci54eiBcDQo+
IC0gICAgICAgICAgIGZpbGU6Ly9DVkUtMjAxNy02ODg4LnBhdGNoICINCj4gKyAgICAgICAgICAi
DQo+ICANCj4gLQ0KPiAtU1JDX1VSSVttZDVzdW1dID0gIjQ1NGYxYmZhM2Y5M2NjNzA4MDk4ZDc4
OTBkMDQ5OWJkIg0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjkxY2ZjM2VkNjFkYzQwZjQ3
ZjA1MGExMDliMDg2MTA2NjdkNzM0NzdhZjZlZjM2ZGNhZDMxYzMxYTRhOGQ1M2YiDQo+ICtTUkNf
VVJJW21kNXN1bV0gPSAiMjY3MDNlZDI4NThjMWZjOWZmYzA1MTM2ZDEzZGFhNjkiDQo+ICtTUkNf
VVJJW3NoYTI1NnN1bV0gPQ0KPiAiMjEzZTgyYmQ3MTZjOWRlNmRiMmY5OGJjYWRiYzRjMjRjN2Uy
ZWZlOGM3NTkzOWExYTg0ZTI4NTM5YzRlMTc0OCINCj4gIA0KPiAgQ1ZFX1BST0RVQ1QgPSAibGli
ZmxhYyBmbGFjIg0KPiAgDQo+IC0tIA0KPiAyLjcuNA0KPiANCj4gDQo+IA0K

