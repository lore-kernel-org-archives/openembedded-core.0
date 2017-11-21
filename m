Return-Path: <saul.wold@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 212BD78683
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 15:32:51 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2017 07:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,432,1505804400"; d="scan'208";a="151817769"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by orsmga004.jf.intel.com with ESMTP; 21 Nov 2017 07:32:53 -0800
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Tue, 21 Nov 2017 07:32:52 -0800
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.80]) by
	ORSMSX111.amr.corp.intel.com ([169.254.12.55]) with mapi id
	14.03.0319.002; Tue, 21 Nov 2017 07:32:52 -0800
From: "Wold, Saul" <saul.wold@intel.com>
To: "Yang, Liezhi (Wind River)" <liezhi.yang@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"MacLeod, Randy (Wind River)" <randy.macleod@windriver.com>, "Huang, Jackie
	(Wind River)" <jackie.huang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "Xu, Chi (Wind River)" <chi.xu@windriver.com>
Thread-Topic: =?utf-8?B?W09FLWNvcmVdIFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDfigJkxNw==?=
Thread-Index: AdNiE+uMjF/H6i7ZR+6+RPIDMgrCyQAlkamAABSGAAAACTBMAA==
Date: Tue, 21 Nov 2017 15:32:51 +0000
Message-ID: <1511278370.933.50.camel@intel.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
	<45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
	<1511262584.862.32.camel@linuxfoundation.org>
In-Reply-To: <1511262584.862.32.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.10.203]
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDfigJkxNw==?=
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
X-List-Received-Date: Tue, 21 Nov 2017 15:32:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F49A3B5AF3578F4CB81D8E0E613161CE@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE3LTExLTIxIGF0IDExOjA5ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gTW9uLCAyMDE3LTExLTIwIGF0IDIwOjIyIC0wNTAwLCBSYW5keSBNYWNMZW9kIHdyb3Rl
Og0KPiA+IE9uIDIwMTctMTEtMjAgMTA6MzYgQU0sIEpvbGxleSwgU3RlcGhlbiBLIHdyb3RlOg0K
PiA+ID4gQ3VycmVudCBEZXYgUG9zaXRpb246IFlQIDIuNSBQbGFubmluZyBhbmQgTTEgZGV2ZWxv
cG1lbnQNCj4gPiA+IE5leHQgRGVhZGxpbmU6IFlQIDIuNSBNMSBjdXQgb2ZmIG9mIDEyLzQvMTcN
Cj4gPiA+ICANCj4gPiA+IFNXQVQgdGVhbSByb3RhdGlvbjogSnVybyAtPiBQYXVsIG9uIE5vdi4x
NywgMjAxNy4NCj4gPiA+IFNXQVQgdGVhbSByb3RhdGlvbjogUGF1bCAtPiBUb2RvciBvbiBOb3Yu
IDI0LCAyMDE3Lg0KPiA+ID4gaHR0cHM6Ly93aWtpLnlvY3RvcHJvamVjdC5vcmcvd2lraS9Zb2N0
b19CdWlsZF9GYWlsdXJlX1N3YXRfVGVhbQ0KPiA+ID4gIA0KPiA+ID4gS2V5IFN0YXR1cy9VcGRh
dGVzOg0KPiA+ID4gwrcgICAgICAgIFRoZXJlIGlzIG5vIHJlYWwgY2hhbmdlIHRvIHRoZSBzdGF0
dXMgZnJvbSBsYXN0IHdlZWsuIFdlDQo+ID4gPiBjb250aW51ZSB0byBzdWZmZXIgaW50ZXJtaXR0
ZW50IGJ1aWxkIGZhaWx1cmVzIGFuZCBhcmUgY29udGludWluZw0KPiA+ID4gdG8gYXR0ZW1wdCB0
byBkZWJ1ZyB0aGVzZS4NCj4gPiA+IMK3ICAgICAgICBDdXJyZW50bHkgb3BlbiBpc3N1ZXMgYXJl
Og0KPiA+IA0KPiA+ICANCj4gPiBTb21lIFVTLWJhc2VkIHBlb3BsZSBtYXkgYmUgb24gaG9saWRh
eSBsYXRlciB0aGlzIHdlZWsgc28gSSdtDQo+ID4gb2ZmZXJpbmcgDQo+ID4gaGVscCBmcm9tIHRo
ZSBmcm96ZW4gTm9ydGhsYW5kIGFuZCBtb3JlIGltcG9ydGFudGx5IGZyb20gdGhlIHRlYW0NCj4g
PiBpbg0KPiA+IEJlaWppbmcuIDstKQ0KPiA+IA0KPiA+ID4gbyAgIHFlbXVwcGMgY29udGludWVz
IHRvIGRlbW9uc3RyYXRlIHJhbmRvbSBoYW5ncyBpbiBib290ICBpbg0KPiA+ID4gdXNlcnNwYWNl
DQo+ID4gDQo+ID4gIA0KPiA+IElzIHdlIGNhbiBjcmVhdGUgYSBkZWZlY3QgZm9yIHRoaXMgYW5k
IHBvaW50IC8gY29weSB0aGUgd2lraSBub3Rlcw0KPiA+IGludG8gaXQsIHRoYXQNCj4gPiB3b3Vs
ZCBoZWxwLg0KPiA+ICAgIGh0dHBzOi8vd2lraS55b2N0b3Byb2plY3Qub3JnL3dpa2kvUWVtdXBw
Y19Cb290X0hhbmdzDQo+ID4gDQo+ID4gSSB0aGluayBJIGhhZCBhc2tlZCBDaGkgdG8gc2VlIGlm
IGhlIGNvdWxkIHJlcHJvZHVjZSB0aGlzIGEgd2VlayBvcg0KPiA+IHR3byBhZ28uDQo+ID4gV2hl
biB0aGUgbGFjayBvZiBlbnRyb3B5IHByb2JsZW0gd2FzIGlkZW50aWZpZWQgYW5kIGZpeCwgbWFu
eQ0KPiA+IHBlb3BsZQ0KPiA+IHRob3VnaHQNCj4gPiB0aGlzIGhhbmcgd2VudCBhd2F5IGFzIHdl
bGwuIENoaSBjYW4geW91IHJlYWQgdGhlIHdpa2kgcmVwb3J0IGFuZA0KPiA+IHNlZQ0KPiA+IGlm
IHlvdQ0KPiA+IGNhbiBhZGQgYW55dGhpbmcgdG8gdGhlbT8NCj4gDQo+IEdvb2QgbmV3cyBpcyB0
aGF0IHRoZSBxZW11cHBjIGlzc3VlIGhhcyBiZWVuIGlkZW50aWZpZWQgYXMgYSBidWcgaW4NCj4g
cWVtdSBwcGMgbG9ja2luZyB3aGljaCBicmVha3MgdGltZXIgaW50ZXJydXB0IGhhbmRsaW5nLiBJ
J3ZlIHBvc3RlZA0KPiBvbg0KPiB0aGUgcWVtdSBtYWlsaW5nIGxpc3QgYXNraW5nIGZvciBoZWxw
IGluIHZlcmlmeWluZyB3aGF0IEkgdGhpbmsgaXMNCj4gaGFwcGVuaW5nLg0KPiANCj4gSSBoYXZl
IGEgcGF0Y2ggcmVhZHkgdG8gbWVyZ2Ugd2hpY2ggc2hvdWxkIGFkZHJlc3MgdGhpcyBvbmUsIGp1
c3QNCj4gY2xlYW5pbmcgdXAgbXkgZW52aXJvbm1lbnQgYW5kIGRvaW5nIHNvbWUgZnVydGhlciBz
dHJlc3MgdGVzdGluZy4NCj4gDQpUaGlzIGlzIGdyZWF0IG5ld3MgaG9wZWZ1bGx5IHlvdSB3aWxs
IGhlYXIgYmFjayBmcm9tIHRoZSBxZW11IE1MDQp2ZXJpZnlpbmcgeW91ciBwYXRjaC4NCg0KPiBb
VGhlcmUgaXMgYSBkZWZlY3Qgc29tZXdoZXJlIGZvciB0aGlzIGJ0dywgSSBjcmVhdGVkIHRoZSB3
aWtpIGFzIGl0DQo+IHdhcw0KPiBhIGJldHRlciBwbGFjZSB0byBkdW1wIGFuZCB1cGRhdGUgaW5m
b3JtYXRpb24gYXMgd2UgbGVhcm50IHdoYXQgaXQNCj4gaXMvaXMgbm90IHdpdGhvdXQgaGF2aW5n
IHRvIGZvbGxvdyBhIHRyYWluIG9mIHRob3VnaHQgdXBkYXRpbmcgaW4gdGhlDQo+IGJ1Z3ppbGxh
XS4NCj4gDQo+ID4gPiBvICAgSXNzdWVzIHdpdGggNC4xMy4xMCBob3N0IGtlcm5lbHMgYm9vdGlu
ZyBrdm0geDg2IGd1ZXN0cyBvbg0KPiA+ID4gVHVtYmxld2VlZCAoU3VzZSkgYW5kIEZlZG9yYSAy
NiAoYXR0ZW1wdGluZyB0byBzZWUgaWYgNC4xMy4xMg0KPiA+ID4gaGVscHMpDQo+ID4gDQo+ID4g
IA0KPiA+IFJvYmVydCwgY2FuIHlvdSB0ZXN0IEZlZG9yYSAyNi4gSXQgd291bGQgaGVscCB0byBo
YXZlIGEgZGVmZWN0IG9wZW4NCj4gPiB3aXRoIHN0ZXBzIHRvIHJlcHJvZHVjZSBvcg0KPiA+IHNv
bWV0aGluZyBhYm91dCB0aGUgdHlwaWNhbCB3b3JrZmxvdy8gYnVpbGQgdGltZS8gZGF5IG9mIHRo
ZSB3ZWVrLw0KPiA+IHBoYXNlIG9mIHRoZSBtb29uLiANCj4gDQo+IEZXSVcgd2UgaGF2ZSBub3Rp
Y2VkIHRoYXQgdGhlIGNob2ljZSBvZiBrZXJuZWwgdGltZXJzIHNlZW1zIHRvIHZhcnkNCj4gaW4N
Cj4gdGhlIHg4Nl82NCBib290cyBidXQgbm90IHdpdGggYSBwYXR0ZXJuIHRoYXQgbWF0Y2hlcyB0
aGUgaGFuZ3MuDQo+IA0KPiA+ID4gbyAgIG5mcyBpbm9kZSBjb3VudCBmb3IgdGhlIHNzdGF0ZS9k
bGRpciBzaGFyZSBhcHBlYXJzIHRvIGJyZWFrDQo+ID4gPiBwZXJpb2RpY2FsbHkgY2F1c2luZyB0
aGUgZGlzayBtb25pdG9yIHRvIGhhbHQgdGhlIGJ1aWxkcyAoYnVnDQo+ID4gPiAxMjI2NykNCj4g
PiANCj4gPiAgDQo+ID4gTGlrZWx5IHNwZWNpZmljIHRvIHRoZSBBQiBzZXJ2ZXIgc28gbm8gcGxh
bnMgdG8gZG8gYW55dGhpbmcgZm9yDQo+ID4gdGhpcw0KPiA+IGJ1Zy4NCj4gDQo+IEFncmVlZCwg
dGhpcyBvbmUgaXMgb3VyIGluZnJhc3RydWN0dXJlIHNvbWVob3cgOiguIFdlIGhhdmUgYQ0KPiB3
b3JrYXJvdW5kDQo+IGluIC1uZXh0IGZvciB0aGlzIGF0IGxlYXN0Lg0KPiANCj4gPiA+IG8gICBh
IHBlcmYgYnVpbGQgcmFjZSAoYnVnIDEyMzAyKQ0KPiA+IA0KPiA+ICAgSSdsbCB0YWtlIGEgbG9v
ayB0bzoNCj4gPiAgLSBzZWUgaWYgSSBjYW4gZHVwbGljYXRlIHRoZSBidWcgb24gYSBmYXN0IGJ1
aWxkIGhvc3QNCj4gPiAgLSBjaGVjayB1cHN0cmVhbSB0byBzZWUgaWYgdGhlIGJ1ZyBpcyBrbm93
bi9maXhlZA0KPiA+ICAtIHNlZSBpZiBJIGNhbiBzcG90IGEgcmFjZSBpbiB0aGUgYnVpbGQgcnVs
ZXMuDQo+IA0KPiBTb3VuZHMgZ29vZCwgdGhhbmtzIQ0KPiANCj4gPiA+IG8gICBBbiBleHQgZmls
ZXN5c3RlbSBjcmVhdGlvbi9zaXppbmcgaXNzdWUgKGJ1ZyAxMjMwNCkNCj4gPiANCj4gPiAgDQo+
ID4gU2F1bCwgQXJlIHlvdSBhcm91bmQgdGhpcyB3ZWVrPyBEbyB5b3UgaGF2ZSBhbnkgYWRkaXRp
b25hbA0KPiA+IGluZm9ybWF0aW9uIGJlZm9yZQ0KPiA+IGxlYXZpbmcgZm9yIFRoYW5rc2dpdmlu
Zz8NCj4gPiANCj4gPiBKYWNraWUsIA0KPiA+IENhbiB5b3UgbG9vayBhdCB0aGUgY29kZSBhcm91
bmQgdGhlIGltYWdlIGNyZWF0aW9uIGFuZCB0cnkgdG8NCj4gPiByZXByb2R1Y2UgdGhpcyBvbmU/
DQo+IA0KPiBTYXVsIGhhc24ndCBiZWVuIGFibGUgdG8gcmVwcm9kdWNlLiBJJ3ZlIGFza2VkIGF0
IHRoZSBtaW5pbXVtIHdlIGFkZA0KPiBiZXR0ZXIgbG9nZ2luZyBzbyBpZi93aGVuIHRoaXMgaGFw
cGVucyBhZ2Fpbiwgd2UgY2FuIGRlYnVnIGl0DQo+IHByb3Blcmx5DQoNClBhdGNoIHNlbnQgd2hp
Y2ggcHJvdmlkZXMgc29tZSBhZGRpdGlvbmFsIGRlYnVnZ2luZyBpbmZvcm1hdGlvbiB0byB0aGUN
CmxvZyBmaWxlcywgaWRlYWxseSwgdGhpcyB3aWxsIGJlIHNhdmVkIHdpdGggdGhlIGJ1ZyBuZXh0
IHRpbWUgdGhpcw0KaXNzdWUgb2NjdXJzLg0KDQpTYXUhDQoNCj4gbmV4dCB0aW1lLiBJIGRpZCBh
bHNvIHdvbmRlciBhYm91dCBmdXp6aW5nIHRoZSBpbWFnZSBzaXplIGNvZGUsDQo+IHdyaXRpbmcN
Cj4gc29tZSBjb2RlIHdoaWNoIHB1dHMgaW4gYWxsIHBvc3NpYmxlIGlucHV0IHZhbHVlcyBhbmQg
Y2hlY2tzIHRoZQ0KPiBzYW5pdHkNCj4gb2YgdGhlIHJlc3VsdGluZyBpbWFnZSBzaXplLiBJdHMg
dGhlIGtpbmQgb2YgcHJvYmxlbSBhIGNvbXB1dGVyIGNhbg0KPiBwcm9iYWJseSBicnV0ZSBmb3Jj
ZS4gQW55b25lIGludGVyZXN0ZWQgaW4gdHJ5aW5nIHRoYXQ/DQo+IA0KPiBDaGVlcnMsDQo+IA0K
PiBSaWNoYXJkDQo+IA0KPiA=

