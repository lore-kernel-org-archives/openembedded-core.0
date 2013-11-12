Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AAF66D8A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 19:02:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rACJ29JX009621
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Nov 2013 11:02:09 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.149]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0347.000;
	Tue, 12 Nov 2013 11:02:08 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/1] linuxdoc-tools: add dependency on texinfo
Thread-Index: AQHO3MxoMpE8T+HXQ0K8OtUeO1V385oh9aGAgAADMDA=
Date: Tue, 12 Nov 2013 19:02:08 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8455BE9823@ALA-MBA.corp.ad.wrs.com>
References: <1383947372-20075-1-git-send-email-jslater@windriver.com>
	<1384253239.6460.0.camel@ted>
In-Reply-To: <1384253239.6460.0.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linuxdoc-tools: add dependency on texinfo
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
X-List-Received-Date: Tue, 12 Nov 2013 19:02:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBiZWxpZXZlIHdlIHdpbGwgdXNlIHRoZSBob3N0IG1ha2VpbmZvLCBpZiB0aGF0IGV4aXN0cywg
c28gd2UNCndvbid0IGF1dG9tYXRpY2FsbHkgYnVpbGQgdGV4aW5mby1uYXRpdmUuICBCdXQsIGlm
IHdlIGFyZSBidWlsZGluZw0KaXQgYXQgdGhlIHNhbWUgdGltZSB3ZSBhcmUgdHJ5aW5nIHRvIHJ1
biBtYWtlaW5mbywgd2UgbWlnaHQgZ2V0DQoib3VyIiB2ZXJzaW9uIGluc3RlYWQgb2YgdGhlIGhv
c3QncywgYW5kIG91ciB2ZXJzaW9uIG1pZ2h0IG5vdCBiZQ0KZnVsbHkgaW5zdGFsbGVkLiAgQXQg
bGVhc3QsIHRoYXQgbG9va3MgbGlrZSB3aGF0IGhhcHBlbmVkIGZvciB0aGUNCmJ1aWxkIGZhaWx1
cmUgdGhpcyBwYXRjaCBhdHRlbXB0cyB0byBmaXguDQoNCkpvZQ0KDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAxMiwg
MjAxMyAyOjQ3IEFNDQo+IFRvOiBTbGF0ZXIsIEpvc2VwaA0KPiBDYzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SCAxLzFdIGxpbnV4ZG9jLXRvb2xzOiBhZGQgZGVwZW5kZW5jeSBvbiB0ZXhpbmZvDQo+IA0KPiBP
biBGcmksIDIwMTMtMTEtMDggYXQgMTM6NDkgLTA4MDAsIEpvZSBTbGF0ZXIgd3JvdGU6DQo+ID4g
V2UgZG8gcnVuIG1ha2VpbmZvLCBzbyB3ZSB3YW50IHRvIERFUEVORCBvbiB0ZXhpbmZvLW5hdGl2
ZS4NCj4gDQo+IG1ha2VpbmZvIGlzIGNoZWNrZWQgZm9yIGJ5IHRoZSBzYW5pdHkgdGVzdHMgc28g
d2UgcmVxdWlyZSBpdCBiZSBwcmVzZW50Pw0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0K
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqc2xhdGVyQHdpbmRyaXZlci5jb20+
DQo+ID4gLS0tDQo+ID4gIC4uLi9saW51eGRvYy10b29scy9saW51eGRvYy10b29scy1uYXRpdmVf
MC45LjY5LmJiIHwgICAgMiArLQ0KPiA+ICAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGludXhkb2MtdG9vbHMvbGludXhkb2MtdG9vbHMtbmF0aXZlXzAuOS42OS5iYg0KPiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9saW51eGRvYy10b29scy9saW51eGRvYy10b29scy1uYXRp
dmVfMC45LjY5LmJiDQo+ID4gaW5kZXggYmE5YzcyZS4uZDgxMjJlNiAxMDA2NDQNCj4gPiAtLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGludXhkb2MtdG9vbHMvbGludXhkb2MtdG9vbHMtbmF0
aXZlXzAuOS42OS5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saW51eGRvYy10
b29scy9saW51eGRvYy10b29scy1uYXRpdmVfMC45LjY5LmJiDQo+ID4gQEAgLTQsNyArNCw3IEBA
IEhPTUVQQUdFID0gImh0dHA6Ly9wYWNrYWdlcy5kZWJpYW4ub3JnL2xpbnV4ZG9jLXRvb2xzIg0K
PiA+ICBMSUNFTlNFID0gIkdQTHYzKyINCj4gPiAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9MDc3ZWY2NGVjM2FjMjU3ZmIwZDc4NjUzMWNmMjY5MzEiDQo+ID4NCj4gPiAt
REVQRU5EUyA9ICJncm9mZi1uYXRpdmUgb3BlbmphZGUtbmF0aXZlIg0KPiA+ICtERVBFTkRTID0g
Imdyb2ZmLW5hdGl2ZSBvcGVuamFkZS1uYXRpdmUgdGV4aW5mby1uYXRpdmUiDQo+ID4NCj4gPg0K
PiA+ICBTUkNfVVJJID0gIiR7REVCSUFOX01JUlJPUn0vbWFpbi9sL2xpbnV4ZG9jLXRvb2xzL2xp
bnV4ZG9jLXRvb2xzXyR7UFZ9Lm9yaWcudGFyLmd6IFwNCj4gDQoNCg==

