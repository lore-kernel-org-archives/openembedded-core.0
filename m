Return-Path: <chee.yang.lee@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 97F537DE04
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 02:23:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 19:23:09 -0700
X-ExtLoop1: 1
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
	by orsmga008.jf.intel.com with ESMTP; 15 May 2019 19:23:07 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.93]) by
	pgsmsx113.gar.corp.intel.com ([169.254.6.39]) with mapi id
	14.03.0415.000; Thu, 16 May 2019 10:23:07 +0800
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "trini@konsulko.com" <trini@konsulko.com>
Thread-Topic: [OE-core] [PATCH 0/4] add wic based image installer
Thread-Index: AQHVC45LE07e76mEQUyhb0dZOcItrg==
Date: Thu, 16 May 2019 02:23:05 +0000
Message-ID: <F8C782DB-A692-407F-A6DF-AFAC51D14854@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.a.190512
x-originating-ip: [172.30.199.100]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/4] add wic based image installer
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
X-List-Received-Date: Thu, 16 May 2019 02:23:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED3172D8E96B2D419FB860F2B8C3BEAB@intel.com>
Content-Transfer-Encoding: base64

SGkgVG9tLCANCg0KV291bGQgeW91IG1pbmQgdG8gc2hhcmUgd2l0aCBtZSBob3cgeW91IG1ha2Ug
dGhlIGluc3RhbGxlciBpbWFnZSB1c2luZyB3aWM/IA0KDQogICAgLS0tLS0tLS0gRm9yd2FyZGVk
IE1lc3NhZ2UgLS0tLS0tLS0NCiAgICBGcm9tOiBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29t
Pg0KICAgIFRvOiBjaGVlLnlhbmcubGVlQGludGVsLmNvbQ0KICAgIENjOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQogICAgU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0ggMC80XSBhZGQgd2ljIGJhc2VkIGltYWdlIGluc3RhbGxlcg0KICAgIERhdGU6IFdlZCwg
MTUgTWF5IDIwMTkgMTE6MzM6NDMgLTA0MDANCiAgICANCiAgICBPbiBXZWQsIE1heSAwOCwgMjAx
OSBhdCAwMjo0MDo1OFBNICswODAwLCBjaGVlLnlhbmcubGVlQGludGVsLmNvbQ0KICAgIHdyb3Rl
Og0KICAgIA0KICAgID4gRnJvbTogQ2hlZSBZYW5nIExlZSA8Y2hlZS55YW5nLmxlZUBpbnRlbC5j
b20+DQogICAgPiANCiAgICA+IEV4aXN0aW5nIGluc3RhbGxhYmxlIGltYWdlIChoZGRpbWcvSVNP
KSBoYXMgbGltaXQgb2YgNEdCIHNpemUsIHNvIHRvDQogICAgPiBidWlsZCBsYXJnZXIgaW5zdGFs
bGFibGUgaW1hZ2UsIHdlIGNhbiBidWlsZCBpdCBpbiB3aWMgYmFzZWQgaW1hZ2UuDQogICAgPiAN
CiAgICA+IDIgcGFydGl0aW9uIG5lZWRlZCBmb3IgaW5zdGFsbGFibGUgaW1hZ2UNCiAgICA+ICAt
IGZpcnN0IHBhcnRpdGlvbiBidWlsZCB1c2luZyBzb3VyY2UgcGx1Z2luIGJvb3RpbWctZWZpIGFu
ZA0KICAgID4gY29uZmlndXJlIHRvIHJ1biBpbnN0YWxsDQogICAgPiAgLSBzZWNvbmQgcGFydGl0
aW9uIGJ1aWxkIHdpdGggcm9vdC5pbWcsIHN5c3RlbWQtYm9vdCBhbmQga2VybmVsIHRvDQogICAg
PiBiZSBpbnN0YWxsIG9uIHRhcmdldCBtYWNoaW5lICh0aGlzIHBhcnRpdGlvbiBidWlsZCB1c2lu
ZyBuZXcgc291cmNlDQogICAgPiBwbHVnaW4gaW5zdGFsbGVyLXBhcnRpdGlvbikNCiAgICA+IA0K
ICAgID4gVGhlc2UgcGF0Y2hlczoNCiAgICA+ICAtIGFkZCBuZXcgc291cmNlIHBsdWdpbiBmb3Ig
c2Vjb25kIHBhcnRpdGlvbg0KICAgID4gIC0gYWRkIG5ldyAud2tzDQogICAgPiAgLSBhZGQgbmV3
IHdpYyBkZXBlbmRlbmN5IGFuZCBzZXQgZGVmYXVsdCB2YWx1ZSBmb3IgcmVxdWlyZWQgdmFyaWFi
bGUNCiAgICA+ICAtIGFsbG93IHNvdXJjZSBwbHVnaW4gYm9vdGltZy1lZmkgdG8gY29uZmlndXJl
IHRvIGluc3RhbGwNCiAgICA+IA0KICAgID4gDQogICAgPiBUbyBidWlsZCB0aGUgaW1hZ2UsIHNl
dCBXS1NfRklMRT0id2ljLWluc3RhbGxlci53a3MuaW4iIGluDQogICAgPiBsb2NhbC5jb25mLg0K
ICAgIA0KICAgIEknbSBjb25mdXNlZCBhcyB0byB3aHkgd2UgbmVlZCBtb3N0IG9mIHRoZXNlIGNo
YW5nZXMgdG8gc3VwcG9ydCB0aGUgZW5kDQogICAgZ29hbC4gIFRoZSBlbmhhbmNlbWVudCB0byBi
b290aW1nLWVmaSBtYWtlcyBjb25jZXB0dWFsIHNlbnNlLiAgSSBkb24ndA0KICAgIHNlZSB3aHkg
d2UgbmVlZCBhIG5ldyBwbHVnaW4gdG8gZG8gdGhlIHJlc3QsIGhvd2V2ZXIuICBXaGF0J3MgYmVp
bmcNCiAgICBkb25lDQogICAgaGVyZSB0aGF0IHdlIGRvbid0IGFscmVhZHkgZG8gdG9kYXk/ICBJ
IHNheSB0aGlzIGhhdmluZyBtYWRlIGluc3RhbGxlcg0KICAgIGltYWdlcyBmb3IgRUZJIG1hY2hp
bmVzIHVzaW5nIHdpYyAoaW4gc3VtbywgZXZlbikuICBUaGFua3MhDQogICAgDQogICAgLS0gDQog
ICAgVG9tDQogICAgLS0gDQogICAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCiAgICBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCiAgICBPcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQogICAgaHR0cDovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0KICAgIA0K
ICAgIA0KDQo=

