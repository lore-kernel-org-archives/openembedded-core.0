Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B628E771B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 12:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7B0C5183C0;
	Tue,  5 Jun 2018 14:04:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id u9RfteNDYgQ3; Tue,  5 Jun 2018 14:04:40 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C58651838E;
	Tue,  5 Jun 2018 14:04:40 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B357C1A07F;
	Tue,  5 Jun 2018 14:04:40 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6B831A07E;
	Tue,  5 Jun 2018 14:04:40 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue,  5 Jun 2018 14:04:40 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 99BBC2846;
	Tue,  5 Jun 2018 14:04:40 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 5 Jun 2018 14:04:40 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 5 Jun 2018 14:04:40 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 5 Jun 2018 14:04:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Kelly
	<mkelly@xevo.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 1/6] toolchain-scripts: retab file
Thread-Index: AQHT/Fi1WBgxHOcWSkCRFyt67Nh7pqRRcMeQ///nIoCAADm7QA==
Date: Tue, 5 Jun 2018 12:04:40 +0000
Message-ID: <a72d01504c484595ae44abe19bbf4665@XBOX02.axis.com>
References: <20180604230602.8461-1-mkelly@xevo.com>
	<20180604230602.8461-2-mkelly@xevo.com>
	<248cbe41837f42c88d3b38cefec71a4b@XBOX02.axis.com>
	<73a2a78cd6778812d9983f044f374e6c2de0b248.camel@linuxfoundation.org>
In-Reply-To: <73a2a78cd6778812d9983f044f374e6c2de0b248.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v3 1/6] toolchain-scripts: retab file
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
X-List-Received-Date: Tue, 05 Jun 2018 12:04:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiA1IGp1
bmkgMjAxOCAxMjozNw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3Rl
ZHRAYXhpcy5jb20+OyBNYXJ0aW4gS2VsbHkNCj4gPG1rZWxseUB4ZXZvLmNvbT47IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0ggdjMgMS82XSB0b29sY2hhaW4tc2NyaXB0czogcmV0YWIgZmlsZQ0KPiANCj4gT24g
VHVlLCAyMDE4LTA2LTA1IGF0IDEwOjA5ICswMDAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6
DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogb3BlbmVtYmVk
ZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBbbWFpbHRvOm9w
ZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxm
DQo+ID4gPiBPZg0KPiA+ID4gTWFydGluIEtlbGx5DQo+ID4gPiBTZW50OiBkZW4gNSBqdW5pIDIw
MTggMDE6MDYNCj4gPiA+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gPiBTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIIHYzIDEvNl0gdG9vbGNoYWluLXNj
cmlwdHM6IHJldGFiIGZpbGUNCj4gPiA+DQo+ID4gPiBUd28gZnVuY3Rpb25zIGlzIHVzZXMgYSBt
aXggb2Ygc3BhY2VzIGFuZCB0YWJzLiBUaGUgcmVzdCBvZiB0aGUNCj4gPiA+IGZpbGUNCj4gPiA+
IHVzZXMgdGFicywgc28gc3dpdGNoIHRvIHRhYnMgdW5pZm9ybWx5Lg0KPiA+ID4NCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IE1hcnRpbiBLZWxseSA8bWtlbGx5QHhldm8uY29tPg0KPiA+ID4gLS0tDQo+
ID4gPiAgbWV0YS9jbGFzc2VzL3Rvb2xjaGFpbi1zY3JpcHRzLmJiY2xhc3MgfCAyMCArKysrKysr
KysrLS0tLS0tLS0tLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL3Rv
b2xjaGFpbi1zY3JpcHRzLmJiY2xhc3MNCj4gPiA+IGIvbWV0YS9jbGFzc2VzL3Rvb2xjaGFpbi1z
Y3JpcHRzLmJiY2xhc3MNCj4gPiA+IGluZGV4IDcxZGE1ZTU0MDkuLmE3MjQzNjE2N2MgMTAwNjQ0
DQo+ID4gPiAtLS0gYS9tZXRhL2NsYXNzZXMvdG9vbGNoYWluLXNjcmlwdHMuYmJjbGFzcw0KPiA+
ID4gKysrIGIvbWV0YS9jbGFzc2VzL3Rvb2xjaGFpbi1zY3JpcHRzLmJiY2xhc3MNCj4gPiA+IEBA
IC0xMjIsNyArMTIyLDcgQEAgdG9vbGNoYWluX2NyZWF0ZV9wb3N0X3JlbG9jYXRlX3NjcmlwdCgp
IHsNCj4gPiA+ICAJcm0gLWYgJHNjcmlwdA0KPiA+ID4gIAl0b3VjaCAkc2NyaXB0DQo+ID4gPg0K
PiA+ID4gLSAgICBjYXQgPj4gJHNjcmlwdCA8PEVPRg0KPiA+ID4gKwljYXQgPj4gJHNjcmlwdCA8
PEVPRg0KPiA+ID4gIGlmIFsgLWQgIiR7U0RLUEFUSE5BVElWRX0vcG9zdC1yZWxvY2F0ZS1zZXR1
cC5kLyIgXTsgdGhlbg0KPiA+ID4gICAgICBmb3IgcyBpbiAke1NES1BBVEhOQVRJVkV9L3Bvc3Qt
cmVsb2NhdGUtc2V0dXAuZC8qLnNoOyBkbw0KPiA+ID4gICAgICAgICAgXCRzICJcJDEiDQo+ID4N
Cj4gPiBUaGlzIHBhcnQgc2hvdWxkIGJlIGluZGVudGVkIHVzaW5nIHRhYnMgYXMgd2VsbC4NCj4g
Pg0KPiA+ID4gQEAgLTE2NiwxMyArMTY2LDEzIEBAIHRvb2xjaGFpbl9jcmVhdGVfc2RrX3NpdGVj
b25maWcgKCkgew0KPiA+ID4gIHRvb2xjaGFpbl9jcmVhdGVfc2RrX3NpdGVjb25maWdbdmFyZGVw
c2V4Y2x1ZGVdID0NCj4gPiA+ICJUT09MQ0hBSU5fQ09ORklHU0lURV9TWVNST09UQ0FDSEUiDQo+
ID4gPg0KPiA+ID4gIHB5dGhvbiBfX2Fub255bW91cyAoKSB7DQo+ID4gPiAtICAgIGltcG9ydCBv
ZS5jbGFzc2V4dGVuZA0KPiA+ID4gLSAgICBkZXBzID0gIiINCj4gPiA+IC0gICAgZm9yIGRlcCBp
biAoZC5nZXRWYXIoJ1RPT0xDSEFJTl9ORUVEX0NPTkZJR1NJVEVfQ0FDSEUnKSBvcg0KPiA+ID4g
IiIpLnNwbGl0KCk6DQo+ID4gPiAtICAgICAgICBkZXBzICs9ICIgJXM6ZG9fcG9wdWxhdGVfc3lz
cm9vdCIgJSBkZXANCj4gPiA+IC0gICAgICAgIGZvciB2YXJpYW50IGluIChkLmdldFZhcignTVVM
VElMSUJfVkFSSUFOVFMnKSBvcg0KPiA+ID4gIiIpLnNwbGl0KCk6DQo+ID4gPiAtICAgICAgICAg
ICAgY2xzZXh0ZW5kID0gb2UuY2xhc3NleHRlbmQuQ2xhc3NFeHRlbmRlcih2YXJpYW50LCBkKQ0K
PiA+ID4gLSAgICAgICAgICAgIG5ld2RlcCA9IGNsc2V4dGVuZC5leHRlbmRfbmFtZShkZXApDQo+
ID4gPiAtICAgICAgICAgICAgZGVwcyArPSAiICVzOmRvX3BvcHVsYXRlX3N5c3Jvb3QiICUgbmV3
ZGVwDQo+ID4gPiAtICAgIGQuYXBwZW5kVmFyRmxhZygnZG9fY29uZmlndXJlJywgJ2RlcGVuZHMn
LCBkZXBzKQ0KPiA+ID4gKwlpbXBvcnQgb2UuY2xhc3NleHRlbmQNCj4gPiA+ICsJZGVwcyA9ICIi
DQo+ID4gPiArCWZvciBkZXAgaW4gKGQuZ2V0VmFyKCdUT09MQ0hBSU5fTkVFRF9DT05GSUdTSVRF
X0NBQ0hFJykgb3INCj4gPiA+ICIiKS5zcGxpdCgpOg0KPiA+ID4gKwkJZGVwcyArPSAiICVzOmRv
X3BvcHVsYXRlX3N5c3Jvb3QiICUgZGVwDQo+ID4gPiArCQlmb3IgdmFyaWFudCBpbiAoZC5nZXRW
YXIoJ01VTFRJTElCX1ZBUklBTlRTJykgb3INCj4gPiA+ICIiKS5zcGxpdCgpOg0KPiA+ID4gKwkJ
CWNsc2V4dGVuZCA9DQo+ID4gPiBvZS5jbGFzc2V4dGVuZC5DbGFzc0V4dGVuZGVyKHZhcmlhbnQs
IGQpDQo+ID4gPiArCQkJbmV3ZGVwID0gY2xzZXh0ZW5kLmV4dGVuZF9uYW1lKGRlcCkNCj4gPiA+
ICsJCQlkZXBzICs9ICIgJXM6ZG9fcG9wdWxhdGVfc3lzcm9vdCIgJQ0KPiBuZXdkZXANCj4gPiA+
ICsJZC5hcHBlbmRWYXJGbGFnKCdkb19jb25maWd1cmUnLCAnZGVwZW5kcycsIGRlcHMpDQo+ID4N
Cj4gPiBUaGlzIGlzIFB5dGhvbiBjb2RlLiBJIGJlbGlldmUgdGhlIE9FLUNvcmUgc3RhbmRhcmQg
aXMgZm9yIFB5dGhvbg0KPiA+IGNvZGUNCj4gPiB0byBiZSBpbmRlbnRlZCB1c2luZyBmb3VyIHNw
YWNlcyAod2hlcmVhcyBzaGVsbCBjb2RlIHNob3VsZCBiZQ0KPiA+IGluZGVudGVkDQo+ID4gdXNp
bmcgdGFicykuDQo+IA0KPiBJIG5vdGljZWQgdGhpcyBsYXN0IGJpdCBhbmQgc2ltcGx5IGRyb3Bw
ZWQgdGhhdCBwYXRjaCBodW5rLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQpZb3Ug
bWlnaHQgd2FudCB0byB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIHRoZW4gYXMgd2VsbCwgYXMg
aXQgcmVmZXJzIA0KdG8gdGhlIHR3byBmdW5jdGlvbnMgdGhhdCBhcmUgbW9kaWZpZWQsIHdoaWNo
IGlzIG5vIGxvbmdlciB0aGUgY2FzZS4NCg0KLy9QZXRlcg0KDQo=

