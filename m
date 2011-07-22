Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qk6XM-00088f-PO
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 05:36:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2011 20:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,245,1309762800"; d="scan'208";a="31032595"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2011 20:32:19 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi;
	Thu, 21 Jul 2011 20:32:19 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2011 20:32:16 -0700
Thread-Topic: [OE-core] [PATCH 1/2] python: fix security vulnerability
Thread-Index: AcxH19/MTRbfYnzTRLmZ63QJwHVF0wAR+jOQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE54F0D2@orsmsx504.amr.corp.intel.com>
References: <cover.1311240498.git.nitin.a.kamble@intel.com>
	<db0eff4b964055b18ca5f91e55b7cf0d4a55c832.1311240498.git.nitin.a.kamble@intel.com>
	<CAMKF1so0578NyAxcwxcsw344-jmfp1otUJ+w++fCumszVsJxbQ@mail.gmail.com>
In-Reply-To: <CAMKF1so0578NyAxcwxcsw344-jmfp1otUJ+w++fCumszVsJxbQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] python: fix security vulnerability
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
X-List-Received-Date: Fri, 22 Jul 2011 03:36:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBkZXZ0b29scy9weXRob24vcHl0aG9uL3NlY3VyaXR5X2lzc3VlXzIyNTRfZml4LnBhdGNoDQo+
ID4gQEAgLTAsMCArMSwxODQgQEANCj4gPiArVXBzdHJlYW1TdGF0dXM6IEJhY2twb3J0DQo+IA0K
PiBUaGlzIHNob3VsZCBiZSBVcHN0cmVhbS1TdGF0dXMgSSBndWVzcyB0byBtYXRjaCBvdGhlciBw
YXRjaGVzIHRoYXQNCj4gc2FpZCB0aGVyZSBhcmUgZmV3IG1vcmUgYW5vbWFsaWVzDQo+IA0KPiBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG9zZnN0b29scy9kb3Nmc3Rvb2xzL2Rvc2ZzdG9vbHMtMi4x
MC1rZXJuZWwtDQo+IDIuNi5wYXRjaDoNCj4gIlVwc3RyZWFtIFN0YXR1cyINCj4gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLQ0KPiB0b29scy9maXhfdXNlX29mX2djYy5w
YXRjaDpVcHN0cmVhbVN0YXR1czoNCj4gUGVuZGluZw0KPiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZWxmdXRpbHMvZWxmdXRpbHMvZml4X2Zvcl9nY2MtDQo+IDQuNy5wYXRjaDpVcHN0cmVhbVN0YXR1
czoNCj4gcGVuZGluZw0KPiANCg0KVGhhbmtzIEtoZW0gZm9yIGNhdGNoaW5nIHRoZXNlLiBJIGhh
dmUgc2VuZGluZyBmaXhlcyBmb3IgdGhlc2UuDQoNCk5pdGluDQo=


