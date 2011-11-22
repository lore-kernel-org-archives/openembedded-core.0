Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RSwO7-0004cH-SJ
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 20:52:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Nov 2011 11:45:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,554,1315206000"; d="scan'208";a="94213502"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2011 11:45:43 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Tue, 22 Nov 2011 11:45:42 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2011 11:45:41 -0800
Thread-Topic: [OE-core] [PATCH 4/8] libtool: upgrade from 2.4 to 2.4.2
Thread-Index: Acykr/y4MIzNcKdxQVq+65uUkVRxzAEnuBPg
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3BF4C7E@orsmsx504.amr.corp.intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
	<806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
	<839d81b7f8239d5c3fb01646653d3414ba03dd23.1321470758.git.nitin.a.kamble@intel.com>
	<CAMKF1srTzN83+xUVu3NJyNacFAXB9Tu82adE9XZwQ6yE_RC2pA@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E39E9243@orsmsx504.amr.corp.intel.com>
	<CAMKF1soWxtrLcydQVq6R5mpCke8tYgO3dzSB_6Jw7sc5W3LcLA@mail.gmail.com>
In-Reply-To: <CAMKF1soWxtrLcydQVq6R5mpCke8tYgO3dzSB_6Jw7sc5W3LcLA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 4/8] libtool: upgrade from 2.4 to 2.4.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Nov 2011 19:52:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBLaGVtIFJh
ag0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDE2LCAyMDExIDI6MzQgUE0NCj4gVG86IFBh
dGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIIDQvOF0gbGlidG9vbDogdXBncmFkZSBmcm9tIDIuNCB0byAy
LjQuMg0KPiANCj4gT24gV2VkLCBOb3YgMTYsIDIwMTEgYXQgMjoyNiBQTSwgS2FtYmxlLCBOaXRp
biBBDQo+IDxuaXRpbi5hLmthbWJsZUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gS2hlbSwN
Cj4gPiDCoCBJIGRpZCBub3Qgc2VlIHRoYXQgY29tbWl0LCBhbmQgSSBmaW5kIHRoZSBvZWNvcmUv
eW9jdG8gaXMgc3RpbGwNCj4gYmVoaW5kIGZvciB0aGUgdmVyc2lvbiBvZiBsaWJ0b29sIHJlY2lw
ZS4gQW55IHJlYXNvbiB0aGF0IGNvbW1pdCBpcyBub3QNCj4gaW4gb2Vjb3JlPw0KPiA+DQo+ID4g
VGhhbmtzLA0KPiANCj4gdGhlcmUgd2VyZSBzb21lIGZlZWRiYWNrIG9uIHRoZSBwYXRjaCBJIGhh
dmUgdG8gbG9vayB0aHJ1IGl0Lg0KDQoNCkhpIEtoZW0sDQogIEFueSB1cGRhdGUgb24gdGhlIGxp
YnRvb2wgdXBncmFkZSBjb21taXQ/IFlvdXIgYW5kIG15IGNoYW5nZXMgYXJlIGRvaW5nIHNhbWUg
dGhpbmdzLCBSaWNoYXJkIGFsc28gaGFzIHNvbWUgY2hhbmdlcyBmb3IgMi40LiBXZSBuZWVkIHRv
IG1lcmdlIGFsbCB0aGVzZSBjaGFuZ2VzIGZvciB0aGUgbGlidG9vbCB1cGdyYWRlLg0KDQpUaGFu
a3MsDQpOaXRpbg0KDQoNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5saW51eHRv
Z28ub3JnL2NnaS1iaW4vbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0K


