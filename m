Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CAEE65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 16:44:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2JGixqQ009588
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Mar 2015 09:44:59 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.14]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0224.002;
	Thu, 19 Mar 2015 09:44:59 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] ltp: find all .debug directories
Thread-Index: AQHQYcui6TtHmJkZi0aouvkxsIYOD50jWpyAgAConzA=
Date: Thu, 19 Mar 2015 16:44:59 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84776A1D91@ALA-MBA.corp.ad.wrs.com>
References: <1426718042-18369-1-git-send-email-jslater@windriver.com>
	<CAMKF1so99EyEXQhDT9kp+NPp1Zu0HHWMov6-wJU3MV5bUksnxg@mail.gmail.com>
In-Reply-To: <CAMKF1so99EyEXQhDT9kp+NPp1Zu0HHWMov6-wJU3MV5bUksnxg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.76]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ltp: find all .debug directories
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
X-List-Received-Date: Thu, 19 Mar 2015 16:45:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTgsIDIwMTUg
NDozNyBQTQ0KPiBUbzogU2xhdGVyLCBKb3NlcGgNCj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Np
b25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW29l
LWNvcmVdW1BBVENIIDEvMV0gbHRwOiBmaW5kIGFsbCAuZGVidWcgZGlyZWN0b3JpZXMNCj4gDQo+
IE9uIFdlZCwgTWFyIDE4LCAyMDE1IGF0IDM6MzQgUE0sIEpvZSBTbGF0ZXIgPGpzbGF0ZXJAd2lu
ZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4gIElOSElCSVRfUEFDS0FHRV9TVFJJUCA9ICIxIg0KPiA+
ICsjIEhvd2V2ZXIsIHRlc3RfYXJjaF9zdHJpcHBlZCBpcyBhbHJlYWR5IHN0cmlwcGVkLCBzby4u
Lg0KPiA+ICtJTlNBTkVfU0tJUF8ke1BOfSArPSAiYWxyZWFkeS1zdHJpcHBlZCINCj4gPiArDQo+
IA0KPiBDYW4gdGhpcyBiZSBhdm9pZGVkIGluIHRoZSBjb21wb25lbnQgbWFrZSBzeXN0ZW0gaW5z
dGVhZA0KDQpEbyB5b3UgbWVhbiBub3Qgc3RyaXAgaXQgd2hlbiB3ZSBidWlsZCBpdD8gIEkgaGVz
aXRhdGUgdG8gaGF2ZSBzb21lIG5hbWVkIF9zdHJpcHBlZA0Kbm90IGJlLiAgU2luY2Ugbm9ib2R5
IHNlZW1zIHVwc2V0IGJ5IHRoZSBjdXJyZW50IHFhICJlcnJvciIsIEkgZ3Vlc3Mgd2UgY291bGQg
YWxzbw0KanVzdCBpZ25vcmUgaXQuDQoNCkpvZQ0KDQo=

