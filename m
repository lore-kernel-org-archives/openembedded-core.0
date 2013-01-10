Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TtCah-0004A5-VP
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 08:30:32 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2013 23:15:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,442,1355126400"; d="scan'208";a="275229673"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2013 23:15:05 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.95]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.13]) with mapi id
	14.01.0355.002; Thu, 10 Jan 2013 07:15:03 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] connman: upgrade to 1.10
Thread-Index: AQHN7oxxxi0xp9BDFE6xsoeD6eNchZhBRF8AgADh8MA=
Date: Thu, 10 Jan 2013 07:15:03 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161DC46C@IRSMSX102.ger.corp.intel.com>
References: <1357751495-28236-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LZwxy0E-ODr61YK4T9Qn+jkqqsPeW06vm8O7pmE-cMAfg@mail.gmail.com>
In-Reply-To: <CAJTo0LZwxy0E-ODr61YK4T9Qn+jkqqsPeW06vm8O7pmE-cMAfg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Thu, 10 Jan 2013 07:30:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KV2VsbCwgSSBoYXZlIHRoZSBwcmlvciBhcnQgc3RhbmQgYnkgbWUuDQpUaGUg
c2FtZSB0ZWNobmlxdWUgaXMgYXBwbGllZCBmb3IgbmV0YmFzZS4NCg0KQW5kLCBpbiB0aGlzIHNw
ZWNpZmljIGNhc2UsIGNvbm5tYW4gc2hvdWxkIGJlIG1hY2hpbmUgc3BlY2lmaWMuDQpDYW4geW91
IHBsZWFzZSBnaXZlIG1lIG1vcmUgZGV0YWlsPw0KDQpUaGUgY29uZmlndXJhdGlvbiBmaWxlIHdp
bGwgaGF2ZSBvbmx5IHRoZSBpbnRlcmZhY2UgYmxhY2tsaXN0IGVuYWJsZWQgaW4gY2FzZSBvZiBh
IHFlbXUqIG1hY2hpbmUuDQoNClJlZ2FyZHMsDQpDcmlzdGlhbg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogQnVydG9uLCBSb3NzIFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwu
Y29tXSANClNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAwOSwgMjAxMyA3OjQzIFBNDQpUbzogSW9y
Z2EsIENyaXN0aWFuDQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGNvbm5tYW46IHVwZ3JhZGUgdG8gMS4x
MA0KDQpPbiA5IEphbnVhcnkgMjAxMyAxNzoxMSwgQ3Jpc3RpYW4gSW9yZ2EgPGNyaXN0aWFuLmlv
cmdhQGludGVsLmNvbT4gd3JvdGU6DQo+ICtkb19pbnN0YWxsX2FwcGVuZCgpIHsNCj4gKyAgICAj
QmxhY2tsaXN0IGV0aG4gbmV0d29yayBpbnRlcmZhY2UgaW4gY2FzZSBvZiBxZW11KiBtYWNoaW5l
cw0KPiArICAgIGNhc2UgIiR7TUFDSElORX0iIGluDQoNClRoaXMgbWFrZXMgY29ubm1hbiBtYWNo
aW5lLXNwZWNpZmljLCB3aGljaCBpc24ndCBhIGdvb2QgdGhpbmcuICBUaGlzIGNvbmZpZ3VyYXRp
b24gZmlsZSBzaG91bGQgYmUgc3BsaXQgb3V0IGludG8gYSBzZXBhcmF0ZSBwYWNrYWdlLg0KDQpS
b3NzDQo=


