Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TtDbJ-0005eu-7T
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 09:35:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Jan 2013 00:19:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,443,1355126400"; d="scan'208";a="242185588"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by azsmga001.ch.intel.com with ESMTP; 10 Jan 2013 00:19:43 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.95]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.74]) with mapi id
	14.01.0355.002; Thu, 10 Jan 2013 08:19:40 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] connman: upgrade to 1.10
Thread-Index: AQHN7oxxxi0xp9BDFE6xsoeD6eNchZhBRF8AgADh8MCAAAyXAIAABTOw
Date: Thu, 10 Jan 2013 08:19:40 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161DC512@IRSMSX102.ger.corp.intel.com>
References: <1357751495-28236-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LZwxy0E-ODr61YK4T9Qn+jkqqsPeW06vm8O7pmE-cMAfg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB161DC46C@IRSMSX102.ger.corp.intel.com>
	<7782F5CBD39246A3A6204E6FE729FD71@intel.com>
In-Reply-To: <7782F5CBD39246A3A6204E6FE729FD71@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: upgrade to 1.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 08:35:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gUm9zcywNCg0KSSBzYXcgdGhlIGNoYW5nZSBpbiBuZXRiYXNlIHJlY2lwZSB0aGF0IENv
bnN0YW50aW4gc3VibWl0dGVkIGFzIGEgcGF0Y2guDQpIb3dldmVyLCB0aGF0IHBhdGNoIGhhcyBu
b3QgYmVlbiBtZXJnZWQgZm9yIDQgbW9udGhzIG5vdy4gSSBkb24ndCB3YW50IHRoYXQgc2l0dWF0
aW9uIHRvIGhhcHBlbiB0byBjb25ubWFuIGFsc28uDQpSb3NzLCBTYXVsLCBwbGVhc2UgYWR2aXNl
Lg0KDQpJIGNhbiByZW1ha2UgdGhlIHBhdGNoIGFzIENvc3RpbiBkaWQgZm9yIG5ldGJhc2UsIGJ1
dCB3aWxsIGl0IGJlIG1lcmdlZD8NCkluIHRoZSBtZWFudGltZSwgbmlnaHRseSBidWlsZHMgZmFp
bCBiZWNhdXNlIGNvbm5tYW4gc2FuaXR5IHRlc3RzIGZhaWwuDQoNClJlZ2FyZHMsDQpDcmlzdGlh
bg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUm9zcyBCdXJ0b24gW21haWx0
bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dIA0KU2VudDogVGh1cnNkYXksIEphbnVhcnkgMTAsIDIw
MTMgOTo1NiBBTQ0KVG86IElvcmdhLCBDcmlzdGlhbg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBjb25u
bWFuOiB1cGdyYWRlIHRvIDEuMTANCg0KT24gVGh1cnNkYXksIDEwIEphbnVhcnkgMjAxMyBhdCAw
NzoxNSwgSW9yZ2EsIENyaXN0aWFuIHdyb3RlOg0KPiBXZWxsLCBJIGhhdmUgdGhlIHByaW9yIGFy
dCBzdGFuZCBieSBtZS4NCj4gVGhlIHNhbWUgdGVjaG5pcXVlIGlzIGFwcGxpZWQgZm9yIG5ldGJh
c2UuDQo+IA0KPiBBbmQsIGluIHRoaXMgc3BlY2lmaWMgY2FzZSwgY29ubm1hbiBzaG91bGQgYmUg
bWFjaGluZSBzcGVjaWZpYy4NCj4gQ2FuIHlvdSBwbGVhc2UgZ2l2ZSBtZSBtb3JlIGRldGFpbD8N
Cj4gDQo+IFRoZSBjb25maWd1cmF0aW9uIGZpbGUgd2lsbCBoYXZlIG9ubHkgdGhlIGludGVyZmFj
ZSBibGFja2xpc3QgZW5hYmxlZCBpbiBjYXNlIG9mIGEgcWVtdSogbWFjaGluZS4NCm5ldGJhc2Ug
aXMgYSBsb3Qgc21hbGxlciB0aGFuIGNvbm5tYW4uICBXaXRoIHRoaXMgY2hhbmdlIHlvdSdyZSBy
ZWJ1aWxkaW5nIGNvbm5tYW4gcGVyLW1hY2hpbmUgaW5zdGVhZCBvZiBzaGFyaW5nIHRoZSBwYWNr
YWdlIGJldHdlZW4gY29tcGF0aWJsZSBtYWNoaW5lcywgd2l0aCB0aGUgb25seSBkaWZmZXJlbmNl
IGJlaW5nIGEgY29uZmlndXJhdGlvbiBmaWxlLg0KDQpSb3NzIA0KDQoNCg==


