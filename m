Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TwCG2-0005Oe-1L
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 14:45:24 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jan 2013 05:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,492,1355126400"; d="scan'208";a="245605561"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 05:29:55 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.82]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.218]) with mapi id
	14.01.0355.002; Fri, 18 Jan 2013 13:29:07 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 2/2] alsa-utils: upgrade to 1.0.26
Thread-Index: AQHN9XB/GIaLUEicmEWCapg2zZJ1mJhPEvOAgAABmJA=
Date: Fri, 18 Jan 2013 13:29:07 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161E974F@IRSMSX102.ger.corp.intel.com>
References: <1358509171-19924-1-git-send-email-cristian.iorga@intel.com>
	<1358509171-19924-2-git-send-email-cristian.iorga@intel.com>
	<1358515371.27799.26.camel@ted>
In-Reply-To: <1358515371.27799.26.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] alsa-utils: upgrade to 1.0.26
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
X-List-Received-Date: Fri, 18 Jan 2013 13:45:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXMgbm8gbG9uZ2VyIG5lY2Vzc2FyeSwgdGhlIGJ1aWxkIHN5c3RlbSBpZiBub3cgZml4ZWQuDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRv
OnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogRnJpZGF5LCBKYW51
YXJ5IDE4LCAyMDEzIDM6MjMgUE0NClRvOiBJb3JnYSwgQ3Jpc3RpYW4NCkNjOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSCAyLzJdIGFsc2EtdXRpbHM6IHVwZ3JhZGUgdG8gMS4wLjI2DQoNCk9uIEZyaSwgMjAxMy0w
MS0xOCBhdCAxMzozOSArMDIwMCwgQ3Jpc3RpYW4gSW9yZ2Egd3JvdGU6DQo+IFNpZ25lZC1vZmYt
Ynk6IENyaXN0aWFuIElvcmdhIDxjcmlzdGlhbi5pb3JnYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAg
Li4uL2Fsc2EvYWxzYS11dGlscy0xLjAuMjUvbmN1cnNlc2ZpeC5wYXRjaCAgICAgICAgfCAgIDQ0
IC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAuLi4tdC1sZXQtc3lzdGVtZC11bml0LXJlc3RvcmUt
dGhlLXZvbHVtZS13aC5wYXRjaCB8ICAgIDANCj4gIC4uLi9vYnNvbGV0ZV9hdXRvbWFrZV9tYWNy
b3MucGF0Y2ggICAgICAgICAgICAgICAgIHwgICAgMA0KPiAgLi4uL3VjbGliYy1leHAxMC1yZXBs
YWNlbWVudC5wYXRjaCAgICAgICAgICAgICAgICAgfCAgICAwDQo+ICAuLi4ve2Fsc2EtdXRpbHNf
MS4wLjI1LmJiID0+IGFsc2EtdXRpbHNfMS4wLjI2LmJifSB8ICAgIDcgKystLQ0KPiAgNSBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQ4IGRlbGV0aW9ucygtKSAgZGVsZXRlIG1vZGUg
MTAwNjQ0IA0KPiBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHMtMS4wLjI1
L25jdXJzZXNmaXgucGF0Y2gNCg0KV2hhdCBoYXBwZW5lZCB0byB0aGUgcGF0Y2g/DQoNCkNoZWVy
cywNCg0KUmljaGFyZA0KDQo=


