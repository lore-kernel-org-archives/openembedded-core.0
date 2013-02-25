Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U9sag-0006yP-Gi
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 08:35:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Feb 2013 23:18:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,732,1355126400"; d="scan'208";a="267113965"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2013 23:18:55 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.108]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.48]) with mapi id
	14.01.0355.002; Mon, 25 Feb 2013 07:18:53 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] connman: enable connman client
Thread-Index: AQHOETifbYRAaCvDQ0eC1/cks2ycTpiHHqYAgAMOh0A=
Date: Mon, 25 Feb 2013 07:18:52 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16205BC1@IRSMSX102.ger.corp.intel.com>
References: <1361563821-7683-1-git-send-email-cristian.iorga@intel.com>
	<7EF31BEB21E340DBAFB08ABD4321A269@intel.com>
In-Reply-To: <7EF31BEB21E340DBAFB08ABD4321A269@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: enable connman client
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
X-List-Received-Date: Mon, 25 Feb 2013 07:35:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gUm9zcywNCg0KMS4gQXMgZmFyIGFzIEkgaGF2ZSBzZWVuLCBidWlsZGluZyB0aGUgY29u
bm1hbmN0bCBpcyB0aGUgZGVmYXVsdCwgdGhlcmUgaXMgbm8gLS1lbmFibGUtY2xpZW50Lg0KCU1h
eWJlIEkgYW0gd3JvbmcsIEkgaGF2ZSBleHRyYWN0ZWQgdGhpcyBpbmZvIGZyb20gdGhlIGRvY3Vt
ZW50YXRpb24uDQoyLiBMaWtlIHlvdSBzYWlkLCBhdCB0aGUgbW9tZW50LCB0aGUgY2xpZW50IGV4
ZWN1dGFibGUgaXMgcHJvZHVjZWQgZGlyZWN0bHkgaW4gdGhlIHNvdXJjZSBkaXJlY3RvcnksIGhl
bmNlIG15IGluc3RhbGwgY29tbWFuZC4NCglJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCB3aWxs
IGJlIHRoZSBzYW1lIHRoaW5nIGlmIEkgY2hhbmdlIGludG8gYnVpbGQgZGlyZWN0b3J5Pw0KDQpS
ZWdhcmRzLA0KQ3Jpc3RpYW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJv
c3MgQnVydG9uIFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXSANClNlbnQ6IFNhdHVyZGF5
LCBGZWJydWFyeSAyMywgMjAxMyAxMDozNCBBTQ0KVG86IElvcmdhLCBDcmlzdGlhbg0KQ2M6IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV0gW1BBVENIXSBjb25ubWFuOiBlbmFibGUgY29ubm1hbiBjbGllbnQNCg0KSGkgQ3Jpc3Rp
YW4sDQoNCk9uIEZyaWRheSwgMjIgRmVicnVhcnkgMjAxMyBhdCAyMDoxMCwgQ3Jpc3RpYW4gSW9y
Z2Egd3JvdGU6IA0KPiAtIC0tZGlzYWJsZS1jbGllbnQgXA0KDQpJJ2QgcHJlZmVyIHRvIHNlZSBh
biBleHBsaWNpdCAtLWVuYWJsZS1jbGllbnQgaGVyZSB0byBtYWtlIGl0IGNsZWFyIHdoYXQgd2Un
cmUgdHVybmluZyBvbiBhbmQgb2ZmLg0KIA0KPiArIGluc3RhbGwgLW0gMDc1NSAke1N9L2NsaWVu
dC9jb25ubWFuY3RsICR7RH0ke2JpbmRpcn0NCg0KJHtTfSAoc291cmNlKSBzaG91bGQgYmUgJHtC
fSAoYnVpbGQpLCBhbHRob3VnaCBhdCB0aGUgbW9tZW50IHRoZXkgYXJlIHRoZSBzYW1lIGRpcmVj
dG9yeSBJJ3ZlIGJlZW4gc2xvd2x5IHdvcmtpbmcgb24gY2hhbmdpbmcgdGhhdC4NCg0KQWxzbyB0
aGUgZmFjdCB0aGF0IHlvdSBoYXZlIHRvIGRvIHRoaXMgaXMgZGVwcmVzc2luZy4gIEkgd29uZGVy
IHdoeSB1cHN0cmVhbSBkb2Vzbid0IHdhbnQgdG8gaW5zdGFsbCBhbnkgb2YgdGhlIHRvb2xzPw0K
DQpSb3NzIA0KDQoNCg==


