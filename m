Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TsDbh-0006IQ-UD
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 15:23:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Jan 2013 06:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="242981832"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga001.jf.intel.com with ESMTP; 07 Jan 2013 06:08:06 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.95]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.74]) with mapi id
	14.01.0355.002; Mon, 7 Jan 2013 14:08:05 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] libtelepathy: python-native is used during
	build
Thread-Index: AQHN7N4YUGgKklLYLUS31rOpo98dWpg95J0AgAABQZA=
Date: Mon, 7 Jan 2013 14:08:05 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161DB159@IRSMSX102.ger.corp.intel.com>
References: <1357566682-7595-1-git-send-email-cristian.iorga@intel.com>
	<1357567154.25855.22.camel@ted>
In-Reply-To: <1357567154.25855.22.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtelepathy: python-native is used during build
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
X-List-Received-Date: Mon, 07 Jan 2013 14:23:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBhbSB0YWxraW5nIGFib3V0IHBvdGVudGlhbCBwcm9ibGVtcywgbGlrZSBidWlsZGluZyBpdCB3
aXRoIHRoZSBob3N0IHB5dGhvbiwgYW5kIG5vdCB3aXRoIHB5dGhvbi1uYXRpdmUuDQoNCkl0IGlz
IG15IHVuZGVyc3RhbmRpbmcgZnJvbSBTYXVsJ3MgY29tbWVudHMgcmVsYXRlZCB0byB0ZWxlcGF0
aHktaWRsZSBwYWNrYWdlIHRoYXQgYnVpbGRpbmcgaXQgZmFpbHMgYmVjYXVzZSBpdCB1c2VzIC91
c3IvYmluL3B5dGhvbiBpbnN0ZWFkIG9mIHB5dGhvbi1uYXRpdmUuDQpJIGhhdmUgYXNzdW1lZCB0
aGF0IHRoaXMgY291bGQgaGFwcGVuIGFsc28gZm9yIGxpYnRlbGVwYXRoeSwgZ2l2ZW4gdGhhdCBp
biB0aGUgcmVzdWx0aW5nIE1ha2VmaWxlIHRoZXJlIGlzIGFuIGFzc2lnbm1lbnQgbGlrZSB0aGlz
Og0KUFlUSE9OPXB5dGhvbg0KDQpIb3BlIHRoaXMgY2xhcmlmaWVzIGl0Lg0KDQpSZWdhcmRzLA0K
Q3Jpc3RpYW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVy
ZGllIFttYWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZ10gDQpTZW50OiBN
b25kYXksIEphbnVhcnkgMDcsIDIwMTMgMzo1OSBQTQ0KVG86IElvcmdhLCBDcmlzdGlhbg0KQ2M6
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIXSBsaWJ0ZWxlcGF0aHk6IHB5dGhvbi1uYXRpdmUgaXMgdXNlZCBkdXJp
bmcgYnVpbGQNCg0KT24gTW9uLCAyMDEzLTAxLTA3IGF0IDE1OjUxICswMjAwLCBDcmlzdGlhbiBJ
b3JnYSB3cm90ZToNCj4gcHl0aG9uLW5hdGl2ZSB3YXMgbm90IHVzZWQgZHVyaW5nIHRoZSBidWls
ZC4NCj4gVGhpcyBjb3VsZCBsZWFkIHRvIHByb2JsZW1zLg0KDQpXaGF0IGtpbmQgb2YgInByb2Js
ZW1zIj8gWWVzLCBJIGNvdWxkIGdvIGFuZCBsb29rIGF0IHRoZSBidWd6aWxsYSBidXQgY29tbWl0
IG1lc3NhZ2VzIHNob3VsZCBiZSBzZWxmIHN1cHBvcnRpbmcsIGF0IGxlYXN0IHdpdGggYSBzdW1t
YXJ5Lg0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg0KDQo+IEZpeGVzIFtZT0NUTyAjMzY3OV0NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IENyaXN0aWFuIElvcmdhIDxjcmlzdGlhbi5pb3JnYUBpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS90ZWxlcGF0aHkvbGlidGVs
ZXBhdGh5XzAuMy4zLmJiIHwgICAgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS90ZWxlcGF0aHkvbGlidGVsZXBhdGh5XzAuMy4zLmJiIA0KPiBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvdGVsZXBhdGh5L2xpYnRlbGVwYXRoeV8wLjMuMy5iYg0KPiBpbmRleCBl
ZTEzMWVlLi43ZDBlZjc5IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L3RlbGVwYXRoeS9saWJ0ZWxlcGF0aHlfMC4zLjMuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS90ZWxlcGF0aHkvbGlidGVsZXBhdGh5XzAuMy4zLmJiDQo+IEBAIC0xNyw3ICsx
Nyw3IEBAIFNSQ19VUkkgPSANCj4gImh0dHA6Ly90ZWxlcGF0aHkuZnJlZWRlc2t0b3Aub3JnL3Jl
bGVhc2VzL2xpYnRlbGVwYXRoeS9saWJ0ZWxlcGF0aHktJA0KPiAgU1JDX1VSSVttZDVzdW1dID0g
IjQ5MGNhMWEwYzYxNGQ0NDY2Mzk0YjcyZDQzYmY3MzcwIg0KPiAgU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImUwZDIzMGJlODU1MTI1MTYzNTc5NzQzNDE4MjAzYzZmNmJlMmYxMGY5OGM0ZjA2NTczNWMx
ZGM5ZWQxMTU4NzgiDQo+ICANCj4gLWluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZw0KPiAraW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIHB5dGhvbm5hdGl2ZQ0KPiAgDQo+ICBGSUxFU18ke1BO
fSArPSAiJHtkYXRhZGlyfS90ZWxlcGF0aHkgXA0KPiAgCQkke2RhdGFkaXJ9L2RidXMtMSINCg0K
DQo=


