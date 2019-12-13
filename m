Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C43E7F82E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 02:55:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Dec 2019 18:55:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,308,1571727600"; d="scan'208";a="211312165"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
	by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2019 18:55:06 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.61]) by
	KMSMSX151.gar.corp.intel.com ([169.254.10.100]) with mapi id
	14.03.0439.000; Fri, 13 Dec 2019 10:55:02 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH 23/30] cups: update to 2.3.0
Thread-Index: AQHVsRiXnPGam+K6g0S0kbFHaOaUn6e22R+A
Date: Fri, 13 Dec 2019 02:55:02 +0000
Message-ID: <82565f3f2785e354cd8ac183a57448732a84f9ff.camel@intel.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-23-alex.kanavin@gmail.com>
In-Reply-To: <20191212181436.1322-23-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.17.141]
MIME-Version: 1.0
Subject: Re: [PATCH 23/30] cups: update to 2.3.0
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
X-List-Received-Date: Fri, 13 Dec 2019 02:55:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F60BFC653917074FB890258AFCB82FDD@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE5LTEyLTEyIGF0IDE5OjE0ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMS1j
dXBzLVVwZGF0ZS10by0NCj4gMS42LjEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vw
cy9jdXBzLzAwMDEtY3Vwcy1VcGRhdGUtdG8tDQo+IDEuNi4xLnBhdGNoDQo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwLi4xY2QwMmU4YjMyNA0KPiAtLS0gL2Rldi9u
dWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvMDAwMS1jdXBzLVVw
ZGF0ZS10by0xLjYuMS5wYXRjaA0KPiBAQCAtMCwwICsxLDI3IEBADQo+ICtGcm9tIGEzZjRkOGJh
OTdmNDY2OWE5NTk0M2E3ZTY1ZWI2MWFhNDRjZTc5OTkgTW9uIFNlcCAxNyAwMDowMDowMA0KPiAy
MDAxDQo+ICtGcm9tOiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRlbC5jb20+DQo+ICtEYXRlOiBU
aHUsIDEzIERlYyAyMDEyIDE5OjAzOjUyIC0wODAwDQo+ICtTdWJqZWN0OiBbUEFUQ0ggMS80XSBj
dXBzOiBVcGRhdGUgdG8gMS42LjENCg0KTG9va3MgbGlrZSBkZXZ0b29sIGNoYW5nZWQgdGhlIHN1
YmplY3Qgb2Ygb3JpZ2luYWwgcGF0Y2ggd2hpY2ggd2FzDQp1c2VfZWNob19vbmx5X2luX2luaXQu
cGF0Y2guIFBlcmhhcHMgd2Ugc2hvdWxkIGNoYW5nZSBpdCBiYWNrIHNvIHdlDQprbm93IHdoeSB3
YXMgdGhlIHBhdGNoIG5lZWRlZC4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=

