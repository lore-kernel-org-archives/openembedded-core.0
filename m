Received: from [8.20.30.154] (helo=mx1.devonhealth.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <igeiser@devonit.com>) id 1U0avg-00054Z-EV
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 17:54:34 +0100
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.213.0;
	Wed, 30 Jan 2013 11:38:31 -0500
Received: from [10.0.2.7] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Wed, 30 Jan 2013 11:38:38 -0500
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from SOUTHSIDE.devonintlgroup.com ([10.0.2.2]) by
	boddingtons.devonintlgroup.com ([10.0.2.7]) with mapi; Wed, 30 Jan 2013
	11:38:38 -0500
From: Ian Geiser <igeiser@devonit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jan 2013 11:38:36 -0500
Thread-Topic: [OE-core] [PATCH] mesa-dri: add extra dri drivers
Thread-Index: Ac3+/MwUJcGsTzRdR4Wfm1jMsEe6qwACuoRQ
Message-ID: <B57A220D1EE1644685BA9AD5C790D20526BE045DE4@SOUTHSIDE.devonintlgroup.com>
References: <1359552371-27121-1-git-send-email-igeiser@devonit.com>
	<CAJTo0LbOKe5KhJyKZYPiOkEZdcGM=NJVOsgt8cc_TkqykU99sA@mail.gmail.com>
In-Reply-To: <CAJTo0LbOKe5KhJyKZYPiOkEZdcGM=NJVOsgt8cc_TkqykU99sA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-WSS-ID: 7D1793044CW1009924-01-01
Subject: Re: [PATCH] mesa-dri: add extra dri drivers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 16:54:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0
bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAzMCwg
MjAxMyAxMDoxNiBBTQ0KPiBUbzogSWFuIEdlaXNlcg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0g
bWVzYS1kcmk6IGFkZCBleHRyYSBkcmkgZHJpdmVycw0KPiANCj4gT24gMzAgSmFudWFyeSAyMDEz
IDEzOjI2LCAgPGlnZWlzZXJAZGV2b25pdC5jb20+IHdyb3RlOg0KPiA+IE9uIHg4NiB0aGUgQVRJ
IGFuZCBOVmlkaWEgZHJtIGRyaXZlcnMgYXJlIHZhbGlkIHRvIGJ1aWxkLg0KPiA+IEN1cnJlbnRs
eSB0aGVyZSBhcmUgX2FwcGVuZF94ODYgYW5kIF9hcHBlbmRfeDY0IGxpbmVzIHRoYXQgZXhwbGlj
aXRseQ0KPiA+IGFkZCBpOTE1IGFuZCBpOTY1LiAgRm9yIGNvbnNpc3RlbmN5IEkgdGhpbmsgdGhh
dCB0aGUgQVRJIGFuZCBOVmlkaWENCj4gPiBkcm0gZHJpdmVyIHNob3VsZCBiZSBhZGRlZC4gSW4g
Y2xhc3NpYyB0aGVzZSB3ZXJlIHR1bmFibGUgdmlhIHRoZQ0KPiA+IG1hY2hpbmUgY29uZmlndXJh
dGlvbiBmaWxlcy4gSSB3b3VsZCBhcmd1ZSB3ZSBzaG91bGQgZ28gYmFjayB0byB0aGF0DQo+ID4g
c28gd2Ugc2hvdWxkIG1ha2UgdGhlIERSSURSSVZFUlMgZmllbGQgc29tZXRoaW5nIHRoYXQgY2Fu
IGJlIGRlZmluZWQNCj4gPiB0aGVyZS4NCj4gPg0KPiA+ICogTWFkZSB0aGUgRFJJRFJJVkVSUyBm
aWVsZCBvdmVycmlkYWJsZS4NCj4gPiAqIEFkZCBBVEkgYW5kIE5WaWRpYSBEUkkgZHJpdmVycyB0
byB0aGUgYnVpbGQgbGlzdCBmb3INCj4gPiAgIHg4NiBhbmQgeDg2XzY0Lg0KPiANCj4gSSdtIG5v
dCBzdXJlIHdoeSB3ZSBuZWVkIHRvIG1ha2UgdGhpcyBtYWNoaW5lLXR1bmFibGUgLSB3ZSBjdXJy
ZW50bHkNCj4gYnVpbGQgYWxsIGRyaXZlcnMgaW4gbGliZHJtIChidXQgc3BsaXQgdGhlbSBiZXR3
ZWVuIHBhY2thZ2VzKSwgc28gd2h5DQo+IG5vdCBqdXN0IGVuYWJsZSBhbGwgd29ya2luZyBEUkkg
ZHJpdmVycyBpbiBNZXNhIGFuZCBzcGxpdCB0aGVtIGJldHdlZW4NCj4gcGFja2FnZXMuDQo+IA0K
PiBNYWNoaW5lIGNvbmZpZ3VyYXRpb25zIGNhbiBwdWxsIGluIHNwZWNpZmljIGRyaXZlciBwYWNr
YWdlcyAob3IgYWxsIG9mDQo+IHRoZW0pIHdpdGhvdXQgbWFraW5nIE1lc2EgaXRzZWxmIG1hY2hp
bmUtc3BlY2lmaWMuDQo+IA0KPiBDYW4geW91IHNlbmQgYSBWMiB3aXRob3V0IHRoZSBjb25kaXRp
b25hbCBhc3NpZ25tZW50ICh1bmxlc3MgeW91IGhhdmUNCj4gYW4gYXJndW1lbnQgZm9yIGtlZXBp
bmcgaXQpLCB3aXRoIGEgY29tbWl0IG1lc3NhZ2UgdGhhdCBqdXN0IGRlc2NyaWJlcw0KPiB0aGUg
cGF0Y2guDQpObywgSSB3YXMganVzdCBleHRlbmRpbmcgd2hhdCB3YXMgdGhlcmUgc28gSSBoYXZl
IG5vIHJlYWwgcHJlZmVyZW5jZS4gIEkgd2lsbCBuZWVkIHRvIGNoZWNrIGlmIGl0IGltcGFjdHMg
bm9uLXg4NiBidWlsZHMuICBJIGRvIG5vdCB0aGluayBpdCB3aWxsIGJlIGEgcHJvYmxlbSwgc2lu
Y2UgbW9zdCBub24teDg2IHN5c3RlbXMgaGF2ZSB0aGVpciBvd24gR0wgaW1wbGVtZW50YXRpb25z
LiAgSSB0aGluayBpdCB3aWxsIGp1c3QgZW5hYmxlIHN3cmFzdCBvbiBvbmVzIHRoYXQgYXJlIG5v
dCB4ODYuICBJIHdpbGwgcmVzdWJtaXQgd2l0aCBpdCBzZXQgdG8gYXV0byB3aGVyZSBpdCB3aWxs
IG9ubHkgYnVpbGQgdGhlIGFwcHJvcHJpYXRlIGRyaXZlcnMgYWZ0ZXIgSSB0ZXN0LiAgVGhhbmtz
IQ0KDQo=



