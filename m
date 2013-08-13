Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 623406B25A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 14:59:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Aug 2013 07:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,870,1367996400"; d="scan'208";a="386414083"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2013 07:59:35 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 13 Aug 2013 15:57:45 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.233]) with mapi id
	14.03.0123.003; Tue, 13 Aug 2013 15:57:45 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [CONSOLIDATED PULL 00/24] Review & ACK
Thread-Index: AQHOmDKjyG32iJDe0U208DHSZmqdbpmTKcUA
Date: Tue, 13 Aug 2013 14:57:44 +0000
Message-ID: <1376405864.7774.9.camel@firebird.rb.intel.com>
References: <cover.1376404196.git.sgw@linux.intel.com>
In-Reply-To: <cover.1376404196.git.sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.73]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/24] Review & ACK
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
X-List-Received-Date: Tue, 13 Aug 2013 14:59:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <51F144FBB93A624293605995194B51E4@intel.com>
Content-Transfer-Encoding: base64

DQoNCk9uIFR1ZSwgMjAxMy0wOC0xMyBhdCAwNzozNiAtMDcwMCwgU2F1bCBXb2xkIHdyb3RlOg0K
PiBQYXVsLCBSb3NzOg0KPiANCj4gV2UgYXJlIHN0aWxsIGluIFJldmlldyBhbmQgQUNLIG1vZGUs
IHNvIHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzLg0KPiANCj4gSSBoYXZlIGluY2x1ZGVkIHRo
ZSBkcGtnIGZpeCBmb3IgRmVkb3JhIDE5Lg0KPiANCj4gVGhpcyBhbHNvIGhhcyBzb21lIHBhdGNo
IGZvciB0aGUgUUEgVGVzdHMgYW5kIFBhdWwncyBHc3RyZWFtZXINCj4gcGF0Y2hlcy4NCj4gDQoN
ClNhdWwsIHlvdSBhbHdheXMgbW92ZSB0b28gZmFzdCBmb3IgbWUgOikgSSB3YXMgbG9va2luZyBv
biBNVVQgYnVpbGQgb24NCkFCIGFuZCBzb21lIGhvc3RzIChEZWJpYW4pIHNlZW1lZCB0byBmYWls
ZWQgY29uc3RhbnRseSBnZXR0aW5nIElQLCAgYW5kDQpJIHRvb2sgbWUgYSB3aGlsZSB0byBmaW5k
IHRoZSBwcm9ibGVtLiANCj4gU3RlZmFuIFN0YW5hY2FyICgzKToNCj4gICBvZXFhL3V0aWxzL3Fl
bXVydW5uZXI6IGdldCBpcCBvbGQgZmFzaGlvbmVkIHdheSBhbmQgdXNlIHRjcCBzZXJpYWwNCj4g
ICAgIGNvbnNvbGUNCg0KU2VudCB2MiBvZiB0aGF0IGFuZCB1cGRhdGVkIHRoZSBvcmlnaW5hbCBi
cmFuY2gsIGNoYW5naW5nIHBzIHRvIHVzZSAtd3cNCmFzIEkgZGlzY292ZXJlZCB0aGUgaGFyZCB3
YXkgdGhhdCBpdCBiZWhhdmVzIGRpZmZlcmVudGx5LiBwcyBtYW4gcGFnZQ0Kc2F5czoNCiJJZiBw
cyBjYW4gbm90IGRldGVybWluZSBkaXNwbGF5IHdpZHRoLCBhcyB3aGVuIG91dHB1dCBpcyByZWRp
cmVjdGVkDQoocGlwZWQpIGludG8gYSBmaWxlIG9yIGFub3RoZXIgY29tbWFuZCwgdGhlDQpvdXRw
dXQgd2lkdGggaXMgdW5kZWZpbmVkIChpdCBtYXkgYmUgODAsIHVubGltaXRlZCwgZGV0ZXJtaW5l
ZCBieSB0aGUNClRFUk0gdmFyaWFibGUsIGFuZCBzbyBvbikuIiBTZWVtcyBkaXN0cm8gaGFzIGFu
IGVmZmVjdCB0b28uLi4NCg0KQ2hlZXJzLA0KU3RlZmFuDQoNCg0K

