Return-Path: <william.c.randle@intel.com>
X-Greylist: delayed 572 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 20 Aug 2016 20:23:24 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 23F076B6EA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 20:23:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 20 Aug 2016 13:13:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,551,1464678000"; 
	d="scan'208,217";a="868792699"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga003.jf.intel.com with ESMTP; 20 Aug 2016 13:13:54 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.201]) by
	ORSMSX103.amr.corp.intel.com ([169.254.5.248]) with mapi id
	14.03.0248.002; Sat, 20 Aug 2016 13:13:53 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] xserver-xf86-config: pre-load int10 and exa
	modules
Thread-Index: AQHR+x9edn7ZnpdmWkSOjwYvzDE9gg==
Date: Sat, 20 Aug 2016 20:13:52 +0000
Message-ID: <1471724031.2858.5.camel@intel.com>
References: <20160820150300.15345-1-raj.khem@gmail.com>
	<20160820150300.15345-2-raj.khem@gmail.com>
In-Reply-To: <20160820150300.15345-2-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.88.194]
MIME-Version: 1.0
Subject: Re: [PATCH] xserver-xf86-config: pre-load int10 and exa modules
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
X-List-Received-Date: Sat, 20 Aug 2016 20:23:25 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_147172403128585camelintelcom_"

--_000_147172403128585camelintelcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBwYXRjaCBpcyBvbmx5IGEgcGFydGlhbCBzb2x1dGlvbiwgYXMgdGhlIGxpYmludDEwIG1v
ZHVsZSBpcyBub3QgaW5zdGFsbGVkIHNvIGl0IGNhbid0IGJlIGxvYWRlZC4NCg0KICAgIC1CaWxs
DQoNCk9uIFNhdCwgMjAxNi0wOC0yMCBhdCAwODowMyAtMDcwMCwgS2hlbSBSYWogd3JvdGU6DQoN
Cm11c2wgZG9lc24ndCBsaWtlIGxhenkgbG9hZGluZyB0aGF0IHhvcmcgdXNlcywgdGhlcmVmb3Jl
DQpsb2FkIHRoZSBuZWVkZWQgbW9kdWxlcyBleHBsaWNpdGx5DQoNCltZT0NUTyAjMTAxNjldDQoN
ClNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb208bWFpbHRvOnJhai5r
aGVtQGdtYWlsLmNvbT4+DQotLS0NCiAuLi4veG9yZy14c2VydmVyL3hzZXJ2ZXIteGY4Ni1jb25m
aWcvMTAtcHJlbG9hZC1tb2R1bGVzLmNvbmYgICAgICAgICAgIHwgMyArKy0NCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteGY4Ni1jb25maWcvMTAtcHJl
bG9hZC1tb2R1bGVzLmNvbmYgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hz
ZXJ2ZXIteGY4Ni1jb25maWcvMTAtcHJlbG9hZC1tb2R1bGVzLmNvbmYNCmluZGV4IDdjZWI2ZmQu
LjEzMjQ1OWMgMTAwNjQ0DQotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVy
L3hzZXJ2ZXIteGY4Ni1jb25maWcvMTAtcHJlbG9hZC1tb2R1bGVzLmNvbmYNCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14Zjg2LWNvbmZpZy8xMC1wcmVs
b2FkLW1vZHVsZXMuY29uZg0KQEAgLTMsNyArMyw4IEBAIFNlY3Rpb24gIk1vZHVsZSINCiAgICAg
TG9hZCAiZmIiDQogICAgIExvYWQgInNoYWRvdyINCiAgICAgTG9hZCAic2hhZG93ZmIiDQorICAg
IExvYWQgImludDEwIg0KICAgICBMb2FkICJ2YmUiDQogICAgIExvYWQgInZnYWh3Ig0KKyAgICBM
b2FkICJleGEiDQogRW5kU2VjdGlvbg0KLQ0KLS0NCjIuOS4zDQoNCg0K

--_000_147172403128585camelintelcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <8C8FA34BC5F5434CAF97E934B4B59730@intel.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IGJnY29sb3I9IiNmN2Y3
ZjciIHRleHQ9IiMyYzJjMmMiIGxpbms9IiM0YTkwZDkiIHZsaW5rPSIjNGE5MGQ5Ij4NCjxkaXY+
VGhpcyBwYXRjaCBpcyBvbmx5IGEgcGFydGlhbCBzb2x1dGlvbiwgYXMgdGhlIGxpYmludDEwIG1v
ZHVsZSBpcyBub3QgaW5zdGFsbGVkIHNvIGl0IGNhbid0IGJlIGxvYWRlZC48L2Rpdj4NCjxkaXY+
PGJyPg0KPC9kaXY+DQo8ZGl2PiZuYnNwOyAmbmJzcDsgLUJpbGw8L2Rpdj4NCjxkaXY+PGJyPg0K
PC9kaXY+DQo8ZGl2Pk9uIFNhdCwgMjAxNi0wOC0yMCBhdCAwODowMyAtMDcwMCwgS2hlbSBSYWog
d3JvdGU6PC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4NCjxwcmU+bXVzbCBkb2Vzbid0
IGxpa2UgbGF6eSBsb2FkaW5nIHRoYXQgeG9yZyB1c2VzLCB0aGVyZWZvcmUNCmxvYWQgdGhlIG5l
ZWRlZCBtb2R1bGVzIGV4cGxpY2l0bHkNCg0KW1lPQ1RPICMxMDE2OV0NCg0KU2lnbmVkLW9mZi1i
eTogS2hlbSBSYWogJmx0OzxhIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPnJhai5r
aGVtQGdtYWlsLmNvbTwvYT4mZ3Q7DQotLS0NCiAuLi4veG9yZy14c2VydmVyL3hzZXJ2ZXIteGY4
Ni1jb25maWcvMTAtcHJlbG9hZC1tb2R1bGVzLmNvbmYgICAgICAgICAgIHwgMyAmIzQzOyYjNDM7
LQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoJiM0MzspLCAxIGRlbGV0aW9uKC0pDQoN
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIt
eGY4Ni1jb25maWcvMTAtcHJlbG9hZC1tb2R1bGVzLmNvbmYgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteGY4Ni1jb25maWcvMTAtcHJlbG9hZC1tb2R1bGVzLmNv
bmYNCmluZGV4IDdjZWI2ZmQuLjEzMjQ1OWMgMTAwNjQ0DQotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteGY4Ni1jb25maWcvMTAtcHJlbG9hZC1tb2R1bGVz
LmNvbmYNCiYjNDM7JiM0MzsmIzQzOyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2
ZXIveHNlcnZlci14Zjg2LWNvbmZpZy8xMC1wcmVsb2FkLW1vZHVsZXMuY29uZg0KQEAgLTMsNyAm
IzQzOzMsOCBAQCBTZWN0aW9uICZxdW90O01vZHVsZSZxdW90Ow0KICAgICBMb2FkICZxdW90O2Zi
JnF1b3Q7DQogICAgIExvYWQgJnF1b3Q7c2hhZG93JnF1b3Q7DQogICAgIExvYWQgJnF1b3Q7c2hh
ZG93ZmImcXVvdDsNCiYjNDM7ICAgIExvYWQgJnF1b3Q7aW50MTAmcXVvdDsNCiAgICAgTG9hZCAm
cXVvdDt2YmUmcXVvdDsNCiAgICAgTG9hZCAmcXVvdDt2Z2FodyZxdW90Ow0KJiM0MzsgICAgTG9h
ZCAmcXVvdDtleGEmcXVvdDsNCiBFbmRTZWN0aW9uDQotDQotLSANCjIuOS4zDQoNCjwvcHJlPg0K
PC9ibG9ja3F1b3RlPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_147172403128585camelintelcom_--
