Return-Path: <saul.wold@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD5B78327
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 19:01:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 11:01:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,429,1505804400"; d="scan'208";a="151541108"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga004.jf.intel.com with ESMTP; 20 Nov 2017 11:01:27 -0800
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 20 Nov 2017 11:01:26 -0800
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.80]) by
	ORSMSX153.amr.corp.intel.com ([169.254.12.223]) with mapi id
	14.03.0319.002; Mon, 20 Nov 2017 11:01:24 -0800
From: "Wold, Saul" <saul.wold@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH][morty] gnu-efi: Fix missing space in _append
	line
Thread-Index: AQHTYjH1iO9l4IH2REuxYx67WUsN9g==
Date: Mon, 20 Nov 2017 19:01:23 +0000
Message-ID: <1511204481.933.45.camel@intel.com>
References: <20171120190028.24015-1-sgw@linux.intel.com>
In-Reply-To: <20171120190028.24015-1-sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.10.203]
MIME-Version: 1.0
Subject: Re: [PATCH][morty] gnu-efi: Fix missing space in _append line
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
X-List-Received-Date: Mon, 20 Nov 2017 19:01:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C2E4D5216AEEE4192CAFEA96605B70F@intel.com>
Content-Transfer-Encoding: base64

DQpXcm9uZyBsaXN0LCB0aGlzIGlzIGZvciBtZXRhLWludGVsLCBzb3JyeS4NCg0KU2F1IQ0KDQpP
biBNb24sIDIwMTctMTEtMjAgYXQgMTE6MDAgLTA4MDAsIFNhdWwgV29sZCB3cm90ZToNCj4gW1lP
Q1RPICMxMjM2Nl0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNhdWwgV29sZCA8c2d3QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gLS0tDQo+IA0KPiBUaGlzIGlzIG9ubHkgaW4gTW9ydHksIHNvIG5vIG1hc3Rl
ciB0aGVuIGJhY2twb3J0IG9wdGlvbg0KPiANCj4gIGNvbW1vbi9yZWNpcGVzLWJzcC9nbnUtZWZp
L2dudS1lZmlfJS5iYmFwcGVuZCB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2NvbW1vbi9yZWNpcGVzLWJz
cC9nbnUtZWZpL2dudS1lZmlfJS5iYmFwcGVuZA0KPiBiL2NvbW1vbi9yZWNpcGVzLWJzcC9nbnUt
ZWZpL2dudS1lZmlfJS5iYmFwcGVuZA0KPiBpbmRleCAxZTljZmRhLi5kYTA4NDMyIDEwMDY0NA0K
PiAtLS0gYS9jb21tb24vcmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpXyUuYmJhcHBlbmQNCj4g
KysrIGIvY29tbW9uL3JlY2lwZXMtYnNwL2dudS1lZmkvZ251LWVmaV8lLmJiYXBwZW5kDQo+IEBA
IC0xLDMgKzEsMyBAQA0KPiAgRklMRVNFWFRSQVBBVEhTX3ByZXBlbmQgOj0gIiR7VEhJU0RJUn0v
Z251LWVmaToiDQo+IC1TUkNfVVJJX2FwcGVuZF9pbnRlbC14ODYtY29tbW9uID0gImZpbGU6Ly8w
MDAxLUFkZC1HVUlELWZvci1TTUJJT1MtDQo+IDMtZW50cnktcG9pbnQtc3RydWN0dXJlLnBhdGNo
Ig0KPiArU1JDX1VSSV9hcHBlbmRfaW50ZWwteDg2LWNvbW1vbiA9ICIgZmlsZTovLzAwMDEtQWRk
LUdVSUQtZm9yLVNNQklPUy0NCj4gMy1lbnRyeS1wb2ludC1zdHJ1Y3R1cmUucGF0Y2giDQo+ICBQ
QUNLQUdFX0FSQ0hfaW50ZWwteDg2LWNvbW1vbiA9ICIke0lOVEVMX0NPTU1PTl9QQUNLQUdFX0FS
Q0h9Ig0KPiAtLSANCj4gMi4xMy41DQo+IA==

