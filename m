Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE8D78339
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 13:00:43 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 06:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="113086954"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by orsmga005.jf.intel.com with ESMTP; 14 Jun 2017 06:00:44 -0700
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
	IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 14 Jun 2017 14:00:43 +0100
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.126]) by
	irsmsx111.ger.corp.intel.com ([169.254.2.25]) with mapi id
	14.03.0319.002; Wed, 14 Jun 2017 14:00:43 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v4 1/7] bitbake.conf: support for merged usr
	with DISTRO_FEATURE usrmerge
Thread-Index: AQHS5QRDN0MSEOTLPkGQpONlbjq966IkQeCA
Date: Wed, 14 Jun 2017 13:00:41 +0000
Message-ID: <1497445289.39827.15.camel@intel.com>
References: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
	<1497439848-29967-2-git-send-email-amarnath.valluri@intel.com>
	<1497440938.3942.48.camel@linuxfoundation.org>
In-Reply-To: <1497440938.3942.48.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.170]
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/7] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Wed, 14 Jun 2017 13:00:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CE1FB89A44E88449A0B017888C79F7F@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTA2LTE0IGF0IDEyOjQ4ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gV2VkLCAyMDE3LTA2LTE0IGF0IDE0OjMwICswMzAwLCBBbWFybmF0aCBWYWxsdXJpIHdy
b3RlOg0KPiA+IA0KPiA+IEEgbmV3IGNvbmZpZ3VyYXRpb24gdmFyaWFibGUgJHtyb290X3ByZWZp
eH0gYWRkZWQsIHdoaWNoIHNoYWxsIGJlDQo+ID4gdXNlZCBieSBhbGwNCj4gPiBiYXNlX3tsaWIs
YmluLHNiaW59ZGlyIHZhcmlhYmxlcy4gV2hlbiB1c3JtZXJnZSBESVNUUk9fRkVBVFVSRSBpcw0K
PiA+IGVuYWJsZWQNCj4gPiAke3Jvb3RfcHJlZml4fSBwb2ludHMgdG8gJHtleGVjX3ByZWZpeH0g
b3RoZXJ3aXNlIHRvICR7YmFzZV9wcmVmaXh9DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQW1h
cm5hdGggVmFsbHVyaSA8YW1hcm5hdGgudmFsbHVyaUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
wqBtZXRhL2NvbmYvYml0YmFrZS5jb25mIHwgMTAgKysrKysrLS0tLQ0KPiA+IMKgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS9jb25mL2JpdGJha2UuY29uZiBiL21ldGEvY29uZi9iaXRiYWtlLmNvbmYNCj4g
PiBpbmRleCA1ZDVkZGVjLi44YzQ5N2ZkIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY29uZi9iaXRi
YWtlLmNvbmYNCj4gPiArKysgYi9tZXRhL2NvbmYvYml0YmFrZS5jb25mDQo+ID4gQEAgLTE3LDEx
ICsxNywxMyBAQCBleHBvcnQgYmFzZV9wcmVmaXggPSAiIg0KPiA+IMKgZXhwb3J0IHByZWZpeCA9
ICIvdXNyIg0KPiA+IMKgZXhwb3J0IGV4ZWNfcHJlZml4ID0gIiR7cHJlZml4fSINCj4gPiDCoA0K
PiA+ICtleHBvcnQgcm9vdF9wcmVmaXggPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19G
RUFUVVJFUycsDQo+ID4gJ3Vzcm1lcmdlJywgJyR7ZXhlY19wcmVmaXh9JywgJyR7YmFzZV9wcmVm
aXh9JywgZCl9Ig0KPiA+ICsNCj4gVGhpcyBpcyBhIHJlYWxseSBzbWFsbCBuaXRwaWNrIGJ1dCB3
aXRoIGNoYW5nZXMgdG8gdGhlIGNvcmUgZmlsZXMgd2UNCj4gbmVlZCB0byBnZXQgdGhpcyByaWdo
dC4gQ291bGQgeW91IGRyb3AgdGhlICJleHBvcnQgIiBhYm92ZSBwbGVhc2U/DQpTdXJlLCBJIHdp
bGwgc2VuZCB0aGUgcmV2aXNlZCBwYXRjaC4NCg0KLSBBbWFybmF0aA0K

