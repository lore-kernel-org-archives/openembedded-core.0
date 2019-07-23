Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB447F081
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 01:05:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jul 2019 18:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,297,1559545200"; d="scan'208";a="368702192"
Received: from pgsmsx114.gar.corp.intel.com ([10.108.55.203])
	by fmsmga006.fm.intel.com with ESMTP; 22 Jul 2019 18:05:44 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.22]) by
	pgsmsx114.gar.corp.intel.com ([169.254.4.144]) with mapi id
	14.03.0439.000; Tue, 23 Jul 2019 09:05:42 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] libical: upgrade to 3.0.5
Thread-Index: AQHVQJyQhq5ZdoRj5E+NSZy4s7qV4qbWv+aAgAAcmQCAAAGpgA==
Date: Tue, 23 Jul 2019 01:05:41 +0000
Message-ID: <393734e9ff3b6095b159744b01405a0b0616269d.camel@intel.com>
References: <20190722144809.14972-1-ross.burton@intel.com>
	<f4a6845ad7408e22bb84a85da103f53ffd5b1736.camel@intel.com>
	<CAMKF1srhurgFYqP0sEgdHn7jpYY44ihY=3r2Y=hRz_R21Rzi1w@mail.gmail.com>
In-Reply-To: <CAMKF1srhurgFYqP0sEgdHn7jpYY44ihY=3r2Y=hRz_R21Rzi1w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.21.220]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libical: upgrade to 3.0.5
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
X-List-Received-Date: Tue, 23 Jul 2019 01:05:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <72A041D4B8ED5D42BDAF35B6B672031A@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDE5LTA3LTIyIGF0IDE3OjU5IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
TW9uLCBKdWwgMjIsIDIwMTkgYXQgNDoxNyBQTSBNaXR0YWwsIEFudWogPGFudWoubWl0dGFsQGlu
dGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gT24gTW9uLCAyMDE5LTA3LTIyIGF0IDE1OjQ4ICswMTAw
LCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4gPiA+IC1MSUNFTlNFID0gIkxHUEx2Mi4xIHwgTVBMLTEu
MCINCj4gDQo+IHRoaXMgc2hvdWxkIGJlIE1QTC0yLjAgfCBMR1BMLTIuMQ0KPiANCj4gPiA+IC1M
SUNfRklMRVNfQ0hLU1VNID0NCj4gPiA+ICJmaWxlOi8vQ09QWUlORzttZDU9ZDRmYzU4MzA5ZDhl
ZDQ2NTg3YWM2M2JiNDQ5ZDgyZjggXA0KPiA+ID4gLQ0KPiA+ID4gZmlsZTovL0xJQ0VOU0U7bWQ1
PWQxYTA4OTFjZDNlNTgyYjNlMmVjOGZlNjNiYWRiYmI2Ig0KPiA+ID4gK0xJQ0VOU0UgPSAiTEdQ
THYyLjEgfCBNUEwtMiINCj4gPiA+ICtMSUNfRklMRVNfQ0hLU1VNID0NCj4gPiA+ICJmaWxlOi8v
TElDRU5TRTttZDU9MTkxMGEyYTc2ZGRmNmE5YmEzNjkxODI0OTQxNzBkODcgXA0KPiA+ID4gKw0K
PiA+ID4gZmlsZTovL0xJQ0VOU0UuTEdQTDIxLnR4dDttZDU9OTMzYWRiNTYxZjE1OWU3YzNkYTA3
OTUzNmYwZWQ4NzEgXA0KPiA+ID4gKw0KPiA+ID4gZmlsZTovL0xJQ0VOU0UuTVBMMi50eHQ7bWQ1
PTk3NDFjMzQ2ZWVmNTYxMzExNjNlMTNiOWRiMTI0MWIzIg0KPiA+IA0KPiA+IFNob3VsZCB0aGlz
IGJlIE1QTC0yLjAgaW5zdGVhZD8gVGhpcyBpcyBjYXVzaW5nIHdhcm5pbmdzOg0KPiANCj4gdGhl
IGxpY2Vuc2UgaXMgTVBMLTIuMCBidXQgdGhlIGxpY2Vuc2UgZmlsZSBuYW1lIGlzIE1QTDIudHh0
IHNvIHRoaXMNCj4gc2VlbXMgZmluZS4NCg0KSSBtZWFudCB0aGUgZmllbGQgaW4gTElDRU5TRS4g
UXVvdGVkIHRoZSB3cm9uZyB0ZXh0Lg0KDQpUaGFua3MuDQo=

