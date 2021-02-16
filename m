Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.3444.1613447828356329909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 19:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: he2Lqd2F9vOX38z80Zm/LcHh+xbzG1lfrVUN7UfnyVfiH5O0mauLrXMMWC8lH9viU/7zXXsNAu
 mMgw7RqWEVuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="244278952"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; 
   d="scan'208";a="244278952"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 19:57:02 -0800
IronPort-SDR: 6ki49NTM+vWKc/2QKBs2TcSnvtJZrNa9KSdrV11ykmqNnoiKQMOzLjAExuKz8CbtvKFHE7T5dj
 Qrd7+lvVcyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; 
   d="scan'208";a="426134982"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2021 19:57:01 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 16 Feb 2021 11:57:00 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.002;
 Tue, 16 Feb 2021 11:57:00 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jpewhacker@gmail.com"
	<jpewhacker@gmail.com>
Subject: Re: [OE-core][PATCH] libomxil: Fix up commercial license flag
Thread-Topic: [OE-core][PATCH] libomxil: Fix up commercial license flag
Thread-Index: AQHXAV9lfRyfuEYGn0uI2bYD49RwsapY672AgAC69QA=
Date: Tue, 16 Feb 2021 03:57:00 +0000
Message-ID: <8fc2f4ea2c7f876557519b5717e30560b6137c79.camel@intel.com>
References: <20210212165157.21896-1-JPEWhacker@gmail.com>
	 <7a213c0e-3abe-d100-e38e-3d4ef77a5f6c@gmail.com>
In-Reply-To: <7a213c0e-3abe-d100-e38e-3d4ef77a5f6c@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C5C61B90720CF48AF2E7F61B47BC991@intel.com>
Content-Transfer-Encoding: base64

WWVzLCBJIGhhdmUgcGlja2VkIHRoaXMgYW5kIHRoZSB3ZXN0b24gY2hhbmdlLg0KDQpUaGFua3Ms
DQoNCkFudWoNCg0KT24gTW9uLCAyMDIxLTAyLTE1IGF0IDEwOjQ3IC0wNjAwLCBKb3NodWEgV2F0
dCB3cm90ZToNCj4gQ2FuIHRoaXMgcGxlYXNlIGJlIGJhY2twb3J0ZWQgdG8gZ2F0ZXNnYXJ0aD8N
Cj4gDQo+IE9uIDIvMTIvMjEgMTA6NTEgQU0sIEpvc2h1YSBXYXR0IHdyb3RlOg0KPiA+IFRoZSBj
b21tZXJjaWFsIGxpY2Vuc2UgZmxhZyBvbiBsaWJvbXhpbCBpcyBzZXQgYmVjYXVzZSBpdCBtYXkN
Cj4gPiBpbmNsdWRlDQo+ID4gdGhlIEFkYXB0aXZlIE11bHRpLVJhdGUgYXVkaW8gY29kZWMgKEFN
UikgdXNpbmcgRkZtZXBnLCB3aGljaCBpcw0KPiA+IHBhdGVudA0KPiA+IGVuY3VtYmVyZWQuDQo+
ID4gDQo+ID4gSXQgdHVybnMgb3V0IHRoaXMgY29tcG9uZW50IGlzIGRpc2FibGVkIGJ5IGRlZmF1
bHQgaW4gdGhlIHJlY2lwZTsNCj4gPiBhZGQgYQ0KPiA+IFBBQ0tBR0VDT05GSUcgdG8gZW5hYmxl
IGl0IGFuZCB0cmlnZ2VyIHRoZSAiY29tbWVyY2lhbCINCj4gPiBMSUNFTlNFX0ZMQUdTIG9uDQo+
ID4gaXQuIFRoaXMgbWFrZSB0aGUgZGVmYXVsdCBidWlsZCBjb25maWd1cmF0aW9uIGNsZWFuIHVu
bGVzcyBhIHVzZXINCj4gPiBzcGVjaWZpY2FsbHkgYXNrcyBmb3IgQU1SIHN1cHBvcnQsIGFuZCBw
cmV2ZW50cyB0aGVtIGZyb20gbWFya2luZw0KPiA+IHRoZQ0KPiA+IHJlY2lwZSB3aXRoIHRoZSAi
Y29tbWVyaWNhbCIgZmxhZyB1bm5lY2Vzc2FyaWx5IHdoaWNoIGNvdWxkIGhpZGUNCj4gPiBwb3Rl
bnRpYWwgcHJvYmxlbXMgbGF0ZXIgb24uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zaHVh
IFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgIG1ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2xpYm9teGlsL2xpYm9teGlsXzAuOS4zLmJiIHwgNiArKysrKy0NCj4gPiDC
oCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYm9teGlsL2xpYm9teGls
XzAuOS4zLmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJvbXhpbC9saWJvbXhp
bF8wLjkuMy5iYg0KPiA+IGluZGV4IDIwNjFjMjgwZTQuLjgyY2RhZjU0YzcgMTAwNjQ0DQo+ID4g
LS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlib214aWwvbGlib214aWxfMC45LjMuYmIN
Cj4gPiArKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJvbXhpbC9saWJvbXhpbF8wLjku
My5iYg0KPiA+IEBAIC00LDcgKzQsNyBAQCBERVNDUklQVElPTiA9ICJCZWxsYWdpbyBpcyBhbiBv
cGVuc291cmNlDQo+ID4gaW1wbGVtZW50YXRpb24gb2YgdGhlIEtocm9ub3MgT3Blbk1BWCBcDQo+
ID4gwqAgSE9NRVBBR0UgPSAiaHR0cDovL29teGlsLnNvdXJjZWZvcmdlLm5ldC8iDQo+ID4gwqAg
DQo+ID4gwqAgTElDRU5TRSA9ICJMR1BMdjIuMSsiDQo+ID4gLUxJQ0VOU0VfRkxBR1MgPSAiY29t
bWVyY2lhbCINCj4gPiArTElDRU5TRV9GTEFHUyA9ICIke0BiYi51dGlscy5jb250YWlucygnUEFD
S0FHRUNPTkZJRycsICdhbXInLA0KPiA+ICdjb21tZXJjaWFsJywgJycsIGQpfSINCj4gPiDCoCBM
SUNfRklMRVNfQ0hLU1VNID0NCj4gPiAiZmlsZTovL0NPUFlJTkc7bWQ1PWFlNmYwZjRkYmM3YWMx
OTNiNTBmMzIzYTZhZTE5MWNiwqBcDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgDQo+ID4gZmlsZTovL3NyYy9vbXhjb3JlLmg7YmVnaW5saW5lPTE7ZW5kbGlu
ZT0yNzttZDU9ODA2YjFlNTU2NmMwNjQ4NmZlOGU0MmI0NjFlMDNhOTANCj4gPiAiDQo+ID4gwqAg
DQo+ID4gQEAgLTI4LDYgKzI4LDEwIEBAIFBST1ZJREVTICs9ICJ2aXJ0dWFsL2xpYm9teGlsIg0K
PiA+IMKgIA0KPiA+IMKgIENGTEFHUyArPSAiLWZjb21tb24iDQo+ID4gwqAgDQo+ID4gK1BBQ0tB
R0VDT05GSUcgPz89ICIiDQo+ID4gKw0KPiA+ICtQQUNLQUdFQ09ORklHW2Ftcl0gPSAiLS1lbmFi
bGUtYW1yLCwiDQo+ID4gKw0KPiA+IMKgICMNCj4gPiDCoCAjIFRoZSAuc28gZmlsZXMgdW5kZXIg
JHtsaWJkaXJ9L2JlbGxhZ2lvIGFyZSBub3QgaW50ZW5kZWQgdG8gYmUNCj4gPiB2ZXJzaW9uZWQg
YW5kIHN5bWxpbmtlZC4NCj4gPiDCoCAjIE1ha2Ugc3VyZSB0aGV5IGdldCBwYWNrYWdlZCBpbiB0
aGUgbWFpbiBwYWNrYWdlLg0KDQo=
