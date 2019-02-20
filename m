Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9CFBC6C227
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 06:34:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2019 22:34:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; d="scan'208";a="116297398"
Received: from pgsmsx106.gar.corp.intel.com ([10.221.44.98])
	by orsmga007.jf.intel.com with ESMTP; 19 Feb 2019 22:34:07 -0800
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.167]) by
	PGSMSX106.gar.corp.intel.com ([169.254.9.56]) with mapi id
	14.03.0415.000; Wed, 20 Feb 2019 14:27:41 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2 v7] test-case-mgmt
Thread-Index: AQHUxttIuwYb6D1IKEyU0QOXDjzg8qXjv9EAgABRY4CABCopgA==
Date: Wed, 20 Feb 2019 06:27:40 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04348186FF8@PGSMSX109.gar.corp.intel.com>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
	<f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
	<8f788c03bb214b6b23dacec18b9efbc32d6bf81c.camel@linuxfoundation.org>
	<8f156c0c1b0cc7fe18bd25a03a8f5f0cdc4f422d.camel@linuxfoundation.org>
In-Reply-To: <8f156c0c1b0cc7fe18bd25a03a8f5f0cdc4f422d.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTg5N2E5MTYtM2EyNy00MzNlLThkZWUtN2JlOWJjZTNiMWI2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUGFxZzFTNFNXakplWEZvbjFLZDVBQlFoYzdxdDZxbFp2dkI1cEtPdE9WU0QrTmhpRThodnQ3YkhleDE2R0U5bCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Wed, 20 Feb 2019 06:34:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUlAsDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIGFsbCB5b3VyIGhlbHAgYW5kIGlucHV0
cyEgDQpXb3VsZCB5b3UgbGlrZSB1cyB0byB0YWtlIGFsbCB0aGUgaW1wcm92ZW1lbnRzIGZyb20g
eW91ciBicmFuY2ggdG8gbWVyZ2Ugb3Igc3F1YXNoIHdpdGggdGhlIGJhc2UgcGF0Y2hzZXQgYW5k
IG1vdmUgZm9yd2FyZCB3aXRoIHRoZSBvbmUgcmVtYWluaW5nIGltcHJvdmVtZW50IGJlbG93PyAN
Cg0KPiA+ICogUmV2aXNpdCBhbmQgcmVkbyB0aGUgd2F5IHRoZSBnaXQgYnJhbmNoIGhhbmRsaW5n
IGlzIGhhcHBlbmluZy4NCj4gPiBXZSANCj4gPiAgIHJlYWxseSB3YW50IHRvIG1vZGVsIGhvdyBv
ZS1idWlsZC1wZXJmLXJlcG9ydCBoYW5kbGVzIGdpdCByZXBvcyANCj4gPiBmb3INCj4gPiAgIGNv
bXBhcmlzb25zOg0KPiA+ICAgLSBJdHMgYWJsZSB0byBxdWVyeSBkYXRhIGZyb20gZ2l0IHJlcG9z
IHdpdGhvdXQgY2hhbmdpbmcgdGhlIA0KPiA+IGN1cnJlbnQNCj4gPiAgICAgd29ya2luZyBicmFu
Y2gsIA0KPiA+ICAgLSBpdCBjYW4gc2VhcmNoIG9uIHRhZyBmb3JtYXRzIHRvIGZpbmQgY29tcGFy
aXNvbiBkYXRhDQoNCkJlc3QgcmVnYXJkcywNClllb2ggRWUgUGVuZw0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnXSANClNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMTgsIDIwMTkg
Njo0NiBBTQ0KVG86IFllb2gsIEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+OyBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSCAwLzIgdjddIHRlc3QtY2FzZS1tZ210DQoNCk9uIFN1biwgMjAxOS0wMi0xNyBh
dCAxNzo1NCArMDAwMCwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4gRGVzcGl0ZSBteSBjaGFu
Z2VzIHRoZXJlIGFyZSB0aGluZ3MgdGhhdCBzdGlsbCBuZWVkIHRvIGJlIGRvbmUuDQo+ID4gRXNz
ZW50aWFsIHRoaW5ncyB3aGljaCBuZWVkIHRvIGhhcHBlbiBiZWZvcmUgdGhpcyBjb2RlIG1lcmdl
czoNCj4gPiANCj4gPiAqIG9lLWdpdC1hcmNoaXZlIGlzIGltcG9ydGluZyB1c2luZyB0aGUgY29t
bWl0L2JyYW5jaCBvZiB0aGUgY3VycmVudA0KPiA+ICAgcmVwbywgbm90IHRoZSBkYXRhIGluIHRo
ZSByZXN1bHRzIGZpbGUuDQoNCkFsc28gbm93IGZpeGVkLiBJIHB1dCBteSBwYXRjaGVzIGludG8g
bWFzdGVyLW5leHQgdG9vLg0KDQpXaXRoIHRoaXMgd29ya2luZywgSSB3YXMgYWJsZSB0byBydW4g
c29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZjoNCg0KZm9yIEQgaW4gJDEvKjsgZG8NCiAgICBy
ZXN1bHR0b29sIHN0b3JlICREICQyIC0tYWxsb3ctZW1wdHkgZG9uZQ0KDQpvbiB0aGUgYXV0b2J1
aWxkZXIncyByZWNlbnQgcmVzdWx0cyB3aGljaCBsZWFkIHRvIHRoZSBjcmVhdGlvbiBvZiB0aGlz
DQpyZXBvc2l0b3J5Og0KDQpodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC5jZ2kveW9j
dG8tdGVzdHJlc3VsdHMvDQoNCg0KPiA+ICogUmV2aXNpdCBhbmQgcmVkbyB0aGUgd2F5IHRoZSBn
aXQgYnJhbmNoIGhhbmRsaW5nIGlzIGhhcHBlbmluZy4NCj4gPiBXZSANCj4gPiAgIHJlYWxseSB3
YW50IHRvIG1vZGVsIGhvdyBvZS1idWlsZC1wZXJmLXJlcG9ydCBoYW5kbGVzIGdpdCByZXBvcyAN
Cj4gPiBmb3INCj4gPiAgIGNvbXBhcmlzb25zOg0KPiA+ICAgLSBJdHMgYWJsZSB0byBxdWVyeSBk
YXRhIGZyb20gZ2l0IHJlcG9zIHdpdGhvdXQgY2hhbmdpbmcgdGhlIA0KPiA+IGN1cnJlbnQNCj4g
PiAgICAgd29ya2luZyBicmFuY2gsIA0KPiA+ICAgLSBpdCBjYW4gc2VhcmNoIG9uIHRhZyBmb3Jt
YXRzIHRvIGZpbmQgY29tcGFyaXNvbiBkYXRhDQoNCldoaWNoIG1lYW5zIHdlIG5vdyBuZWVkIHRv
IG1ha2UgdGhlIGdpdCBicmFuY2ggZnVuY3Rpb25hbGl0eSBvZiB0aGUgcmVwb3J0IGFuZCByZWdy
ZXNzaW9uIGNvbW1hbmRzIGNvbXBhcmUgd2l0aCB0aGUgYWJvdmUgcmVwbywgc28gd2UncmUgYSBz
dGVwIGNsb3NlciB0byBnZXR0aW5nIHRoaWUgbWVyZ2VkLg0KDQpVbHRpbWF0ZWx5IHdlJ2xsIGF1
dG8tcG9wdWxhdGUgdGhlIGFib3ZlIHJlcG8gYnkgaGF2aW5nIHRoZSBhdXRvYnVpbGRlciBydW4g
YSAic3RvcmUiIGNvbW1hbmQgYXQgdGhlIGVuZCBvZiBpdHMgcnVucy4NCg0KSSBoYXZlIGEgZmVl
bGluZyBJIG1heSBoYXZlIGJyb2tlbiB0aGUgcmVzdWx0dG9vbCBzZWxmdGVzdHMgc28gdGhhdCBp
cyBzb21ldGhpbmcgZWxzZSB3aGljaCB3aWxsIG5lZWQgdG8gYmUgZml4ZWQgYmVmb3JlIGFueXRo
aW5nIG1lcmdlcy4gVGltZSBmb3IgbWUgdG8gc3RlcCBhd2F5IGZyb20gdGhlIGtleWJvYXJkIGZv
ciBhIGJpdCB0b28uDQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQoNCg==

