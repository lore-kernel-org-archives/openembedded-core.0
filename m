Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C084F77A27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 01:21:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2H1LQvw025985
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 16 Mar 2017 18:21:27 -0700
Received: from ALA-MBC.corp.ad.wrs.com ([fe80::fcbe:9b7:1141:89a1]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Thu, 16 Mar 2017 18:21:26 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][v2][PATCH 1/1] build-compare: add date to PV
Thread-Index: AQHSnnlwphqOQZtzeE2b2xuJZk1V8qGXtgsAgADHfAD//7xlQA==
Date: Fri, 17 Mar 2017 01:21:25 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF2982D8@ALA-MBC.corp.ad.wrs.com>
References: <1489684755-27165-1-git-send-email-jslater@windriver.com>
	<007BD92917A2324FA403BCF9A464CF84CF2971C7@ALA-MBC.corp.ad.wrs.com>
	<1489702420.13980.130.camel@linuxfoundation.org>
In-Reply-To: <1489702420.13980.130.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.160]
MIME-Version: 1.0
Subject: Re: [v2][PATCH 1/1] build-compare: add date to PV
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
X-List-Received-Date: Fri, 17 Mar 2017 01:21:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
W21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBUaHVy
c2RheSwgTWFyY2ggMTYsIDIwMTcgMzoxNCBQTQ0KPiBUbzogU2xhdGVyLCBKb3NlcGg7IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbb2UtY29yZV1bdjJdW1BBVENIIDEvMV0gYnVpbGQtY29tcGFyZTogYWRkIGRhdGUgdG8g
UFYNCj4gDQo+IE9uIFRodSwgMjAxNy0wMy0xNiBhdCAxNzoyOCArMDAwMCwgU2xhdGVyLCBKb3Nl
cGggd3JvdGU6DQo+ID4gR2l2ZW4gdGhhdCBQViBmb3IgKl9naXQgcmVjaXBlcyBzaG91bGQgbm93
IGJlIHNwZWNpZmllZCBhbmQNCj4gPiBzdGFydCB3aXRoIGEgdmVyc2lvbiwgaXQgd291bGQgYmUg
bmljZSB0byBzaG9ydGVuIChvciBlbGltaW5hdGUpDQo+ID4gU1JDUFYuwqDCoEF0IGxlYXN0IGdl
dCByaWQgb2YgdGhlIEFVVE9JTkMuwqDCoFBlcmhhcHMgc2hvcnRlbiB0aGUNCj4gPiBhbW91bnQg
b2YgU1JDUkVWIGluY2x1ZGVkLsKgwqBUaGUgcG9pbnQgaXMgdGhhdCBhcyBjdXJyZW50bHkNCj4g
PiBjb21wdXRlZCwgUFYgd2lsbCBiZSBmYXIgbG9uZ2VyIHRoYW4gdGhlIHVzZWZ1bCBpbmZvcm1h
dGlvbg0KPiA+IGl0IHByb3ZpZGVzLg0KPiANCj4gSSB0aG91Z2h0IHdlIGFscmVhZHkgZGlkPw0K
PiANCj4gZS5nLiBmb3IgdGhlIGtlcm5lbCB5b3Ugc2VlIHBhY2thZ2VzIGxpa2U6DQo+IA0KPiBr
ZXJuZWwtbW9kdWxlLXh0LXUzMi00LjEwLjAteW9jdG8tc3RhbmRhcmRfNC4xMCtnaXQwKzgwNWVh
NDQwYzdfYjI1OWE1ZDc0NC0NCj4gcjAuMzBfcWVtdXg4Nl82NC5pcGsNCj4gDQo+IHdoaWNoIGhh
cyBzZXZlcmFsIHNob3J0ZW5lZCBoYXNoZXMgaW4gaXQuDQoNCkkgZ3Vlc3MgaXQgbWF0dGVycyB3
aGVyZSB5b3UgbG9vay4gIEZvciB0aGluZ3MgbGlrZSBycG0ncyB5b3Ugc2VlICIuLi4rZ2l0MCsu
Li4iLiAgRm9yIHRoaW5ncw0KbGlrZSBpdGVtcyBnZW5lcmF0ZWQgYnkgdGhlIGFyY2hpdmVyIHlv
dSBzZWUgIi4uLitnaXRBVVRPSU5DKy4uLiIuICBJbiBlaXRoZXIgY2FzZSwgdGhlDQpjaGFyYWN0
ZXJzIGFwcGVuZGVkIHRvICJnaXQiIGRvIG5vdCBzZWVtIHRvIGJlIHVzZWZ1bC4gIEFuZCwgc2lu
Y2UgdGhlIDgwNS4uLiBhbmQgYjI1Li4uDQpoYXNoZXMgYXJlIGp1c3QgYW5lY2RvdGFsIGJlY2F1
c2UgdGhlIDx2ZXJzaW9uPi15b2N0byBkZXRlcm1pbmVzIHZlcnNpb24gc2VxdWVuY2UsIHRoZXkg
Y291bGQNCmJlIG11Y2ggc2hvcnRlci4NCg0KSm9lDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IFJp
Y2hhcmQNCg==

