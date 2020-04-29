Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.831.1588134932962120254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 21:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RiFJ0Hw3XkPaNRLbhrTaO5ZDNEKsGXhWe0laCZ3oKnT6NvKzMt04t9Oi9eUHCXvVq3iqJE2TnR
 4hsfp2aURs6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 21:35:31 -0700
IronPort-SDR: kvNbHsFvyYmkkWOYFWRmBx0kOlpd7wAqIcfGKfaDsxBKbW69emza8BHFMpK7f7PHn50rmZt5e1
 elOQpskjKBFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,330,1583222400"; 
   d="scan'208";a="282380139"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
  by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2020 21:35:30 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.234]) by
 PGSMSX107.gar.corp.intel.com ([169.254.7.2]) with mapi id 14.03.0439.000;
 Wed, 29 Apr 2020 12:35:29 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>, "akuster808@gmail.com"
	<akuster808@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [zeus 0/7] Merge request
Thread-Topic: [OE-core] [zeus 0/7] Merge request
Thread-Index: AQHWHQL7am2YpXFxeEmwn1xJ+uf5VKiOT6CAgACvc4A=
Date: Wed, 29 Apr 2020 04:35:28 +0000
Message-ID: <989e478d2c7a6a7be60eb805e664bd5dcf678424.camel@intel.com>
References: <cover.1587931177.git.akuster808@gmail.com>
	 <CA+chaQfuCTZYou7qcUagwBpMHS51KW2VT6yt2L1ugySLuQ7a_w@mail.gmail.com>
In-Reply-To: <CA+chaQfuCTZYou7qcUagwBpMHS51KW2VT6yt2L1ugySLuQ7a_w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.165.134]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <09D56C5C1E244F4390DCF165F65A855A@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTA0LTI4IGF0IDIwOjA3ICswMjAwLCBNYXJ0aW4gSmFuc2Egd3JvdGU6DQo+
IEhpLA0KPiANCj4gY2FuIHlvdSBwbGVhc2UgaW5jbHVkZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdG9waWMvemV1c19wYXRjaF9xZW11X3Jl
cGxhY2UvNzMxOTcwNDk/cD0sLCwyMCwwLDAsMDo6cmVjZW50cG9zdGRhdGUlMkZzdGlja3ksLCwy
MCwyLDgwLDczMTk3MDQ5DQo+IA0KPiBvciBkaWQgSSBtaXN1bmRlcnN0b29kIHlvdXIgbGFzdCBy
ZXBseSBpbiB0aGF0IHRocmVhZD8NCg0KSSBoYXZlIGluY2x1ZGVkIGl0IGFsb25nIHdpdGggc29t
ZSBvdGhlciBwYXRjaGVzIGFuZCBpdCdkIGJlIGluIHRoZQ0KbmV4dCBtZXJnZSByZXF1ZXN0Og0K
DQpodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlLWNvbnRyaWIv
bG9nLz9oPWFudWptL3pldXMNCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gDQo+IE9uIFR1ZSwgQXBy
IDI4LCAyMDIwIGF0IDQ6MTYgQU0gYWt1c3RlciA8YWt1c3RlcjgwOEBnbWFpbC5jb20+IHdyb3Rl
Og0KPiA+IFBsZWFzZSBjb25zaWRlciB0aGVzZSBjaGFuZ2VzIGZvciB6ZXVzDQo+ID4gVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiA+IDVhYzk4Yzc3NmY5Yjc3ODA0YTBlZTgx
MmY0N2YzZWNmNTkzZTQzMmY6DQo+ID4gDQo+ID4gICBrZXJuZWxzcmMuYmJjbGFzczogRml4IGV4
dGVybmFsc3JjIHN1cHBvcnQgKDIwMjAtMDQtMDYgMTU6MTc6MDUNCj4gPiArMDgwMCkNCj4gPiAN
Cj4gPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4gPiANCj4gPiAg
IGdpdDovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlLWNvbnRyaWIgc3Rh
YmxlL3pldXMtDQo+ID4gbmV4dA0KPiA+ICAgDQo+ID4gaHR0cDovL2NnaXQub3BlbmVtYmVkZGVk
Lm9yZy9vcGVuZW1iZWRkZWQtY29yZS1jb250cmliL2xvZy8/aD1zdGFibGUvemV1cy1uZXh0DQo+
ID4gDQo+ID4gQWRyaWFuIEJ1bmsgKDEpOg0KPiA+ICAgb3BlbnNzbDogVXBncmFkZSAxLjEuMWQg
LT4gMS4xLjFlDQo+ID4gDQo+ID4gQWxleGFuZGVyIEthbmF2aW4gKDEpOg0KPiA+ICAgb3BlbnNz
bDogdXBkYXRlIHRvIDEuMS4xZg0KPiA+IA0KPiA+IERlbnlzIERteXRyaXllbmtvICgxKToNCj4g
PiAgIG9wZW5zc2w6IHJlY29tbWVuZCBjcnlwdG9kZXYtbW9kdWxlIGZvciBjb3JyZXNwb25kaW5n
DQo+ID4gUEFDS0FHRUNPTkZJRw0KPiA+IA0KPiA+IExlZSBDaGVlIFlhbmcgKDIpOg0KPiA+ICAg
Y3ZlLWNoZWNrOiBDUEUgdmVyc2lvbiAnLScgYXMgYWxsIHZlcnNpb24NCj4gPiAgIHdpYzogYWxp
Z24gbGF5ZXIgcGx1Z2luIHBhdGgNCj4gPiANCj4gPiBPdmlkaXUgUGFuYWl0ICgxKToNCj4gPiAg
IGluZXR1dGlsczogVXNlIGFsdGVybmF0aXZlcyB0byBhdm9pZCBtYW5wYWdlIGNvbmZsaWN0DQo+
ID4gDQo+ID4gUmljaGFyZCBQdXJkaWUgKDEpOg0KPiA+ICAgcHNldWRvOiBFbnN1cmUgd2UgdXNl
IG91ciBvd24gbGlic3FsaXRlDQo+ID4gDQo+ID4gIG1ldGEvY2xhc3Nlcy9jdmUtY2hlY2suYmJj
bGFzcyAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiA+ICAuLi4vaW5ldHV0aWxzL2luZXR1dGls
c18xLjkuNC5iYiAgICAgICAgICAgICAgfCAgIDYgKy0NCj4gPiAgLi4uL29wZW5zc2wvb3BlbnNz
bC9DVkUtMjAxOS0xNTUxLnBhdGNoICAgICAgIHwgNzU4IC0tLS0tLS0tLS0tLS0tDQo+ID4gLS0t
LQ0KPiA+ICAuLi4ve29wZW5zc2xfMS4xLjFkLmJiID0+IG9wZW5zc2xfMS4xLjFmLmJifSAgfCAg
IDYgKy0NCj4gPiAgLi4uL3JlY2lwZXMtY29yZS9tZXRhL2N2ZS11cGRhdGUtZGItbmF0aXZlLmJi
IHwgICAyICstDQo+ID4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvLmluYyAg
ICAgICB8ICAgMiArDQo+ID4gIHNjcmlwdHMvbGliL3dpYy9oZWxwLnB5ICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMyArLQ0KPiA+ICBzY3JpcHRzL2xpYi93aWMvcGx1Z2luYmFzZS5weSAgICAg
ICAgICAgICAgICAgfCAgMTEgKy0NCj4gPiAgOCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspLCA3NzEgZGVsZXRpb25zKC0pDQo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC9DVkUtDQo+ID4gMjAxOS0xNTUxLnBhdGNo
DQo+ID4gIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wve29wZW5zc2xf
MS4xLjFkLmJiID0+DQo+ID4gb3BlbnNzbF8xLjEuMWYuYmJ9ICg5NyUpDQo+ID4gDQo+ID4gDQo=
