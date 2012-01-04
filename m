Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RiO2p-000249-49
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 11:26:08 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jan 2012 02:18:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103206884"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2012 02:18:43 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 4 Jan 2012 18:18:42 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.223]) with mapi id
	14.01.0355.002; Wed, 4 Jan 2012 18:18:41 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Recent xserver-kdrive failure and util-macros update
Thread-Index: AQHMyrpV9iIcebyvSES4ckrFYb9QSpX7/XTA
Date: Wed, 4 Jan 2012 10:18:40 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A191323DAD1@SHSMSX102.ccr.corp.intel.com>
References: <4F03FFB2.8040606@linux.intel.com> <4F040CC7.7070500@windriver.com>
In-Reply-To: <4F040CC7.7070500@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: Recent xserver-kdrive failure and util-macros update
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
X-List-Received-Date: Wed, 04 Jan 2012 10:26:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WGlhb2ZlbmcgWWFuIHdyb3RlIG9uIDIwMTItMDEtMDQ6DQo+IE9uIDIwMTLlubQwMeaciDA05pel
IDE1OjI4LCBTYXVsIFdvbGQgd3JvdGU6DQo+PiANCj4+IFdlIHNlZW0gdG8gaGF2ZSBhIHJlbGF0
aXZlbHkgbmV3IGZhaWx1cmUgaW4geHNlcnZlci1rZHJpdmUsIHdoaWNoDQo+PiBhcHBlYXJlZCBp
biB0aGUgbGFzdCBzZXQgb2YgY2hhbmdlLiBJIHRyaWVkIHRvIHJ1biB0aG91Z2ggYSBiaXNlY3QN
Cj4+IGJ1dCB3YXMgbm90IGFibGUgdG8gZmluZCB0aGUgcHJvYmxlbS4NCj4+IA0KPj4gVGhlIHBy
b2JsZW0gc2VlbXMgdG8gYmUgcmVsYXRlZCB0byBjb25maWd1cmUuYWMgc2V0dGluZyBvZg0KPj4g
WFNFUlZFUl9DRkxBR1M9JyQoQ1dBUk5GTEFHUyknIGFuZCB0aGVuIHVzaW5nIC1XZXJyb3I9YWRk
cmVzcywgd2hpY2ggaXMNCj4+IHdoYXQgY2F1c2VzIHRoZSBmYWlsdXJlLg0KSGkgU2F1bCwNCkNh
biB3ZSBwYXRjaCB0aGlzIHRvIG1ha2UgaXQgbm90IGZhaWw/DQpJJ2xsIHRyeSB0byBsb29rIGlu
dG8gdGhpcy4uLg0KDQo+PiBUaGlzIHNlZW1zIHRvIGJlIHJlbGF0ZWQgdG8gdGhlIHV0aWwtbWFj
cm9zIHVwZGF0ZSB0byAxLjE2LCB3aGljaA0KPj4gYWRkcyBtb3JlIHdhcm5pbmdzIHRvIGVycm9y
cy4gU2luY2Ugd2UgYXJlIHN0aWxsIHVzaW5nIHRoZSBvbGRlcg0KPj4geHNlcnZlci1rZHJpdmUs
IHRoZXJlIGFyZSB3YXJuaW5ncyB0aGF0IGFyZSBub3cgZXJyb3JzIHdpdGggdGhlIHVwZGF0ZS4N
Cj4+IA0KPj4gV2UgY291bGQgcGF0Y2ggdGhlIGN1cnJlbnQgeHNlcnZlci1rZHJpdmUsIHJldmVy
dCB0aGUgMS4xNiB1cGRhdGUgdG8NCj4+IHV0aWwtbWFjcm9zIG9yIHVwZGF0ZSB4c2VydmVyLWtk
cml2ZSAod2hpY2ggaXMgaW4gdGhlIHdvcmtzLCBidXQgSQ0KPj4gdGhpbmsgaGFkIHNvbWUgaXNz
dWVzKS4gVGhpcyBhbHNvIHNlZW1zIHRvIGFmZmVjdCB0aGUgbGlieHAgcGFja2FnZQ0KPj4gb24g
eDg2LTY0Lg0KSSBkb24ndCBzZWUgYW55IGxpYnhwIGZhaWx1cmUoSSBidWlsZCBsaWJ4cCB3aXRo
IE1BQ0hJTkU9cWVtdXg4NiBvbiBhbiANClg4Ni02NCBob3N0KS4gQnkgc2F5aW5nICJvbiB4ODYt
NjQiLCBkaWQgeW91IG1lYW4gInFlbXV4ODYtNjQiPw0KDQo+PiANCj4+IFRob3VnaHRzLCBJIGtu
b3cgd2UgZG9uJ3QgbGlrZSB0byByZXZlcnQsIGJ1dCB3ZSBtYXkgaGF2ZSB0byBpbiB0aGlzDQo+
PiBjYXNlIGFzIHdlIGRvbid0IGhhdmUgdGhlIGtkcml2ZSB1cGRhdGUgeWV0IGFuZCB3b3VsZCBu
ZWVkIHRvDQo+PiBmdXJ0aGVyIGludmVzdGlnYXRlIHRoZSBsaWJ4cCBmYWlsdXJlLg0KPiBIaSBT
YXVsLA0KPiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiBteSBwcmV2aW91cyBwYXRjaGVzIHRv
IHVwZGF0ZQ0KPiB4c2VydmVyLWtkcml2ZSA/DQo+IGh0dHA6Ly9naXQucG9reWxpbnV4Lm9yZy9j
Z2l0LmNnaS9wb2t5LWNvbnRyaWIvbG9nLz9oPXhpYW9mZW5nL3VwZGF0ZQ0KSSBjYW4gYnVpbGQg
WGlhb2ZlbmcncyB4c2VydmVyLWtkcml2ZSAxLjExLjIgZmluZSB3aXRoIHV0aWwtbWFjcm9fMS4x
Ni4NCkNhbiB3ZSB1c2UgdGhlIG5ldyB4c2VydmVyLWtkcml2ZXIgYW5kIHJlbW92ZSB0aGUgb2xk
IG9uZT8NCg0KVGhhbmtzLA0KLS0gRGV4dWFuDQoNCg==


