Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58C816D8E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 20:46:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rACKklhk025675
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Nov 2013 12:46:47 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.149]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0347.000;
	Tue, 12 Nov 2013 12:46:47 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/1] linuxdoc-tools: add dependency on texinfo
Thread-Index: AQHO3MxoMpE8T+HXQ0K8OtUeO1V385oh9aGAgAADMDCAAJMSAP//iqYQ
Date: Tue, 12 Nov 2013 20:46:46 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8455BE9A7A@ALA-MBA.corp.ad.wrs.com>
References: <1383947372-20075-1-git-send-email-jslater@windriver.com>
	<1384253239.6460.0.camel@ted>
	<007BD92917A2324FA403BCF9A464CF8455BE9823@ALA-MBA.corp.ad.wrs.com>
	<1384285506.6460.33.camel@ted>
In-Reply-To: <1384285506.6460.33.camel@ted>
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
X-List-Received-Date: Tue, 12 Nov 2013 20:46:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
W21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBUdWVz
ZGF5LCBOb3ZlbWJlciAxMiwgMjAxMyAxMTo0NSBBTQ0KPiBUbzogU2xhdGVyLCBKb3NlcGgNCj4g
Q2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8xXSBsaW51eGRvYy10b29sczogYWRkIGRlcGVuZGVuY3kg
b24gdGV4aW5mbw0KPiANCj4gT24gVHVlLCAyMDEzLTExLTEyIGF0IDE5OjAyICswMDAwLCBTbGF0
ZXIsIEpvc2VwaCB3cm90ZToNCj4gPiBJIGJlbGlldmUgd2Ugd2lsbCB1c2UgdGhlIGhvc3QgbWFr
ZWluZm8sIGlmIHRoYXQgZXhpc3RzLCBzbyB3ZQ0KPiA+IHdvbid0IGF1dG9tYXRpY2FsbHkgYnVp
bGQgdGV4aW5mby1uYXRpdmUuICBCdXQsIGlmIHdlIGFyZSBidWlsZGluZw0KPiA+IGl0IGF0IHRo
ZSBzYW1lIHRpbWUgd2UgYXJlIHRyeWluZyB0byBydW4gbWFrZWluZm8sIHdlIG1pZ2h0IGdldA0K
PiA+ICJvdXIiIHZlcnNpb24gaW5zdGVhZCBvZiB0aGUgaG9zdCdzLCBhbmQgb3VyIHZlcnNpb24g
bWlnaHQgbm90IGJlDQo+ID4gZnVsbHkgaW5zdGFsbGVkLiAgQXQgbGVhc3QsIHRoYXQgbG9va3Mg
bGlrZSB3aGF0IGhhcHBlbmVkIGZvciB0aGUNCj4gPiBidWlsZCBmYWlsdXJlIHRoaXMgcGF0Y2gg
YXR0ZW1wdHMgdG8gZml4Lg0KPiANCj4gSXQgd291bGQgaGVscCB0byBoYXZlIHRoYXQgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLg0KPiANCj4gRXF1YWxseSwgZG9lcyB0aGlzIHJlYWxseSBzb2x2ZSB0
aGUgcHJvYmxlbSBvciBkb2VzIGl0IGp1c3QgbW92ZSBpdA0KPiBlbHNld2hlcmUgYXMgb3RoZXIg
YXBwbGljYXRpb25zIHByb2JhYmx5IHVzZSBtYWtlaW5mbyB0b28/IDovDQoNCkl0IGRvZXMganVz
dCBtb3ZlIGl0IGVsc2V3aGVyZS4gIEkgZG9uJ3Qga25vdyBpZiB0ZXhpbmZvIHdvdWxkIGJlIGJh
c2ljDQplbm91Z2ggdG8gZm9yY2UgaXQgdG8gYnVpbGQgZWFybHkgKEknbSBub3Qgc3VyZSBob3cg
dG8gZG8gdGhhdCksIG9yIGlmDQp3ZSBqdXN0IGV4cGVjdCBwYWNrYWdlcyB0aGF0IG5lZWQgaXQg
dG8gZGVwZW5kIG9uIGl0Lg0KDQpKb2UNCg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJk
DQoNCg==

