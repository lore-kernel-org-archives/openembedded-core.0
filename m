Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.162.1594164782890505766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 16:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: unK7/sNHQ0Q1SyyA1Ophu1URGU++365wZDXYkWZwIj2vz4ZmK/y4PuNQ2MnpNEc/feqV4Ofhc+
 EpA5ni1ogkmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="135948728"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; 
   d="scan'208";a="135948728"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 16:33:01 -0700
IronPort-SDR: YGVFIZRYg8SO1H4xvEIQXndSjpLy8AU+V4BqbjhR7ntgYxTo2oZAu4PUC2aUfRSsJaxaR6aJ85
 0RTwsEfw9qGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; 
   d="scan'208";a="314469354"
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
  by orsmga008.jf.intel.com with ESMTP; 07 Jul 2020 16:33:00 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.140]) by
 pgsmsx113.gar.corp.intel.com ([169.254.6.145]) with mapi id 14.03.0439.000;
 Wed, 8 Jul 2020 07:32:59 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [zeus][PATCH 00/10] zeus pull request - cover letter only
Thread-Topic: [OE-core] [zeus][PATCH 00/10] zeus pull request - cover letter
 only
Thread-Index: AQHWUypWrJifkoF60EWtc0S/8g1ZPaj8QXKA
Date: Tue, 7 Jul 2020 23:32:59 +0000
Message-ID: <83a163fa3433ef7f663b2904229da2cd8a6a2c5d.camel@intel.com>
References: <161F017D25C28593.23085@lists.openembedded.org>
In-Reply-To: <161F017D25C28593.23085@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.182.72]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4FF03A2E3ED5B4BB060EE24D0051371@intel.com>
Content-Transfer-Encoding: base64

UGluZw0KDQpPbiBNb24sIDIwMjAtMDctMDYgYXQgMDg6MTMgKzA4MDAsIEFudWogTWl0dGFsIHdy
b3RlOg0KPiBQbGVhc2UgbWVyZ2UgdGhlc2UgY2hhbmdlcyBpbiB6ZXVzLiBDbGVhbiBhLWZ1bGwg
b24gYXV0b2J1aWxkZXINCj4gZXhjZXB0IGENCj4gYml0YmFrZS1zZWxmdGVzdCBmYWlsdXJlIGZp
eCBmb3Igd2hpY2ggaGFzIGJlZW4gbWVyZ2VkLg0KPiANCj4gVGhhbmtzLA0KPiANCj4gQW51ag0K
PiANCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiBlZTk1YTM5OTI4NWFi
YmRlODRlMDE0OGNhOTU3YjU5ZDY1YmNhZDBhOg0KPiANCj4gICBtZXNhOiBmaXggbWVzb24gY29u
ZmlndXJlIGZpeCB3aGVuICdkcmknIGlzIGV4Y2x1ZGVkIGZyb20NCj4gUEFDS0FHRUNPTkZJRyAo
MjAyMC0wNS0yOSAwODozMjo0NCArMDgwMCkNCj4gDQo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0Og0KPiANCj4gICBnaXQ6Ly9wdXNoLm9wZW5lbWJlZGRlZC5vcmcvb3Bl
bmVtYmVkZGVkLWNvcmUtY29udHJpYiBzdGFibGUvemV1cy0NCj4gbmV4dA0KPiANCj4gQWxleGFu
ZGVyIEthbmF2aW4gKDIpOg0KPiAgIHB5dGhvbjM6IG1ha2UgZ2RibSBvcHRpb25hbA0KPiAgIHB5
dGhvbjM6IHVuLWJyZWFrIGRpc2FibGluZyB0aGUgcmVhZGxpbmUgUEFDS0FHRUNPTkZJRw0KPiAN
Cj4gTGVlIENoZWUgWWFuZyAoMSk6DQo+ICAgcWVtdTogZml4IENWRS0yMDIwLTEwNzAyICYgQ1ZF
LTIwMjAtMTM3NjUNCj4gDQo+IExpbGkgTGkgKDEpOg0KPiAgIGtlcm5lbC5iYmNsYXNzOiBGaXgg
TW9kdWxlLnN5bXZlcnMgc3VwcG9ydA0KPiANCj4gUGV0ZXIgS2plbGxlcnN0ZWR0ICgxKToNCj4g
ICByZWxvY2F0YWJsZS5iYmNsYXNzOiBBdm9pZCBhbiBleGNlcHRpb24gaWYgYW4gZW1wdHkgcGtn
Y29uZmlnIGRpcg0KPiAgICAgZXhpc3QNCj4gDQo+IFJpY2hhcmQgTGVpdG5lciAoMSk6DQo+ICAg
a2VybmVsLWZpdGltYWdlOiBpbnRyb2R1Y2UgRklUX1NJR05fQUxHDQo+IA0KPiBoYWlxaW5nICgy
KToNCj4gICBnbnV0bHM6IGZpeGVkIENWRS0yMDIwLTEzNzc3DQo+ICAgbGlicGFtOiBSZW1vdmUg
b3B0aW9uICdvYnNjdXJlJyBmcm9tIGNvbW1vbi1wYXNzd29yZA0KPiANCj4gamFzb24ubGF1ICgx
KToNCj4gICBsaWJqcGVnLXR1cmJvOiBGaXggQ1ZFLTIwMjAtMTM3OTANCj4gDQo+IHdlbmxpbi5r
YW5nQHdpbmRyaXZlci5jb20gKDEpOg0KPiAgIG5mcy11dGlsczogZml4IENWRS0yMDE5LTM2ODkN
Cj4gDQo+ICBtZXRhL2NsYXNzZXMva2VybmVsLWZpdGltYWdlLmJiY2xhc3MgICAgICAgICAgfCAg
IDYgKy0NCj4gIG1ldGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcyAgICAgICAgICAgICAgICAgICB8
ICAgMiArLQ0KPiAgbWV0YS9jbGFzc2VzL3JlbG9jYXRhYmxlLmJiY2xhc3MgICAgICAgICAgICAg
IHwgIDIwICstLQ0KPiAgLi4uYXRkLXRha2UtdXNlci1pZC1mcm9tLXZhci1saWItbmZzLXNtLnBh
dGNoIHwgMTAyICsrKysrKysrKysrKysNCj4gIC4uLi9uZnMtdXRpbHMvbmZzLXV0aWxzXzIuNC4x
LmJiICAgICAgICAgICAgICB8ICAgMSArDQo+ICAuLi5yZXBvcnQtbWlzc2luZy1kZXBlbmRlbmNp
ZXMtZm9yLWRpc2EucGF0Y2ggfCAgMzEgKysrKw0KPiAgLi4udHV0aWxzLXByZWZpeC1pcy1pbnNp
ZGUtc3RhZ2luZy1hcmVhLnBhdGNoIHwgICAyICstDQo+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjNfMy43LjcuYmIgfCAgMTkgKystDQo+ICBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LmluYyAgICAgICAgICAgfCAgIDIgKw0KPiAgLi4uL3FlbXUvcWVtdS9DVkUt
MjAyMC0xMDcwMi5wYXRjaCAgICAgICAgICAgIHwgIDUyICsrKysrKysNCj4gIC4uLi9xZW11L3Fl
bXUvQ1ZFLTIwMjAtMTM3NjUucGF0Y2ggICAgICAgICAgICB8ICA0OCArKysrKysNCj4gIC4uLi9w
YW0vbGlicGFtL3BhbS5kL2NvbW1vbi1wYXNzd29yZCAgICAgICAgICB8ICAgNSArLQ0KPiAgLi4u
YnVmLW92ZXJydW4tY2F1c2VkLWJ5LWJhZC1iaW5hcnktUFBNLnBhdGNoIHwgIDgxICsrKysrKysr
KysrDQo+ICAuLi4vanBlZy9saWJqcGVnLXR1cmJvXzIuMC4zLmJiICAgICAgICAgICAgICAgfCAg
IDEgKw0KPiAgLi4uL2dudXRscy9nbnV0bHMvQ1ZFLTIwMjAtMTM3NzctYS5wYXRjaCAgICAgIHwg
IDkwICsrKysrKysrKysrKw0KPiAgLi4uL2dudXRscy9nbnV0bHMvQ1ZFLTIwMjAtMTM3NzctYi5w
YXRjaCAgICAgIHwgMTM3DQo+ICsrKysrKysrKysrKysrKysrKw0KPiAgLi4uL2dudXRscy9nbnV0
bHMvQ1ZFLTIwMjAtMTM3NzctYy5wYXRjaCAgICAgIHwgIDY4ICsrKysrKysrKw0KPiAgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjYuMTMuYmIgIHwgICAzICsNCj4gIDE4IGZp
bGVzIGNoYW5nZWQsIDY1MCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtDQo+
IHV0aWxzLzAwMDEtc3RhdGQtdGFrZS11c2VyLWlkLWZyb20tdmFyLWxpYi1uZnMtc20ucGF0Y2gN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMvMDAxNy0NCj4gc2V0dXAucHktZG8tbm90LXJlcG9ydC1taXNzaW5nLWRlcGVuZGVuY2llcy1m
b3ItZGlzYS5wYXRjaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvQ1ZFLTIwMjAtDQo+IDEwNzAyLnBhdGNoDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9DVkUtMjAyMC0NCj4gMTM3NjUucGF0
Y2gNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9maWxl
cy8wMDAxLXJkcHBtLmMtDQo+IEZpeC1idWYtb3ZlcnJ1bi1jYXVzZWQtYnktYmFkLWJpbmFyeS1Q
UE0ucGF0Y2gNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0
bHMvZ251dGxzL0NWRS0yMDIwLQ0KPiAxMzc3Ny1hLnBhdGNoDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy9DVkUtMjAyMC0NCj4gMTM3Nzct
Yi5wYXRjaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRs
cy9nbnV0bHMvQ1ZFLTIwMjAtDQo+IDEzNzc3LWMucGF0Y2gNCj4gDQo+IA0K
