Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 40226605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 23:57:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2019 16:57:07 -0700
X-ExtLoop1: 1
Received: from pgsmsx104.gar.corp.intel.com ([10.221.44.91])
	by orsmga004.jf.intel.com with ESMTP; 29 May 2019 16:57:06 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.53]) by
	PGSMSX104.gar.corp.intel.com ([169.254.3.63]) with mapi id
	14.03.0415.000; Thu, 30 May 2019 07:57:06 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libva: upgrade 2.4.0 -> 2.4.1
Thread-Index: AQHVETR533i/zxHxJ0CaGODH3avRAqaCS+mA
Date: Wed, 29 May 2019 23:57:05 +0000
Message-ID: <3328a2dcbfb0d82223ba69d212a9caaf88cb45f5.camel@intel.com>
References: <20190523064551.3865-1-anuj.mittal@intel.com>
In-Reply-To: <20190523064551.3865-1-anuj.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.186.5]
MIME-Version: 1.0
Subject: Re: [PATCH] libva: upgrade 2.4.0 -> 2.4.1
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
X-List-Received-Date: Wed, 29 May 2019 23:57:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B51BCC3052155F4DBBF633C25EAB9FA0@intel.com>
Content-Transfer-Encoding: base64

UGluZw0KDQpPbiBUaHUsIDIwMTktMDUtMjMgYXQgMTQ6NDUgKzA4MDAsIEFudWogTWl0dGFsIHdy
b3RlOg0KPiBDaGFuZ2VzIGluIHRoaXMgcmVsZWFzZToNCj4gDQo+IDk3OWEzNTEgW2NvbW1vbl0g
QWRkIEEyUkdCMTAgZm91cmNjIGRlZmluaXRpb24NCj4gMjJjYmE3OSBidWlsZDogbWVzb246IGVu
YWJsZXMgdmEgbWVzc2FnaW5nIGFuZCB2aXNpYmlsaXR5DQo+IGI4OWY2ZWMgdmEvdmFfdHJhY2U6
IGFkZCB0cmFjZSBzdXBwb3J0IGZvciBSSVIocm9sbGluZyBpbnRyYQ0KPiByZWZyZXNoKS4NCj4g
ODQ0YjkwYyB2YS92YV90cmFjZTogYWRkIHRyYWNlIHN1cHBvcnQgZm9yIFJPSShyZWdpb24gb2Yg
aW50ZXJlc3QpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW51aiBNaXR0YWwgPGFudWoubWl0dGFs
QGludGVsLmNvbT4NCj4gLS0tDQo+ICAuLi4vcmVjaXBlcy1ncmFwaGljcy9saWJ2YS97bGlidmFf
Mi40LjAuYmIgPT4gbGlidmFfMi40LjEuYmJ9IHwgNA0KPiArKy0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAgcmVuYW1lIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9saWJ2YS97bGlidmFfMi40LjAuYmIgPT4NCj4gbGlidmFfMi40LjEuYmJ9ICg5
MiUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZh
XzIuNC4wLmJiDQo+IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuNC4xLmJi
DQo+IHNpbWlsYXJpdHkgaW5kZXggOTIlDQo+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9saWJ2YS9saWJ2YV8yLjQuMC5iYg0KPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2xpYnZhL2xpYnZhXzIuNC4xLmJiDQo+IGluZGV4IGZmYTFhYjhmN2IuLjUyNTcyMWYwYWUg
MTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YV8yLjQuMC5i
Yg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi40LjEuYmINCj4g
QEAgLTE5LDggKzE5LDggQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICINCj4gZmlsZTovL0NPUFlJTkc7
bWQ1PTJlNDg5NDBmOTRhY2IwYWY1ODJlNWVmMDM1Mzc4MDBmIg0KPiAgDQo+ICBTUkNfVVJJID0g
Ig0KPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvJHtCUE59L3JlbGVhc2VzL2Rvd25sb2FkLyR7
UFZ9LyR7QlB9LnRhci5iejINCj4gIg0KPiAgDQo+IC1TUkNfVVJJW21kNXN1bV0gPSAiY2ZjNjlj
MmE1ZjUyNmRkMTg1OGUwOThmYjhlZWJmYTYiDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAi
OTkyNjMwNTZjMjE1OTNhMjZmMmVjZTgxMmFlZTZmZTYwMTQyYjQ5ZTZjZDQ2Y2IzM2M4ZGRkZjE4
ZmMxOTM5MSINCj4gK1NSQ19VUklbbWQ1c3VtXSA9ICI1YjVhY2U5ZGUzZjA3Y2I3YjhmNGQxOWI2
OTc5YWRmMCINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICJlOWUwNTM5MDg1OTFiMTIxNzkz
ZWFhNWQ4YWEzNzY3NWI0Y2QzYWY0YjEyZjFmMzc3ZGZmNDc2N2YzOWNlZTcwIg0KPiAgDQo+ICBV
UFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xpYnZhL3JlbGVh
c2VzIg0KPiAgDQo+IC0tIA0KPiAyLjIwLjENCj4gDQoNCg==

