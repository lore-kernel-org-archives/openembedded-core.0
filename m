Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1RdUXH-0005XZ-Hs
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 23:21:20 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2011 14:13:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104808617"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2011 14:13:01 -0800
Received: from orsmsx106.amr.corp.intel.com (10.22.225.133) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Dec 2011 14:13:01 -0800
Received: from orsmsx102.amr.corp.intel.com ([169.254.1.40]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.229]) with mapi id
	14.01.0355.002; Wed, 21 Dec 2011 14:13:01 -0800
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gdb-cross-canadian: build gdb with python
	support
Thread-Index: AQHMv73BRnV7Jz5h/0Sko7j0yygYLpXm2zvg
Date: Wed, 21 Dec 2011 22:12:59 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C2401D155@ORSMSX102.amr.corp.intel.com>
References: <1324044340-21898-1-git-send-email-eric@eukrea.com>
	<4EF19E06.6030004@eukrea.com>
In-Reply-To: <4EF19E06.6030004@eukrea.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH] gdb-cross-canadian: build gdb with python	support
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
X-List-Received-Date: Wed, 21 Dec 2011 22:21:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgRXJpYywNCg0KQ2FuIHlvdSBzdWJtaXQgdGhlIHBhdGNoIGFnYWluc3QgcXQgbGF5ZXIgb3Ig
bWV0YS1vZSBpbnN0ZWFkIG9mIG9lLWNvcmUsIHNpbmNlIHB5dGhvbiBlbmFibGVkIGdkYiBzaG91
bGRuJ3QgYmUgdHVybmVkIG9uIGJ5IGRlZmF1bHQgaW4gb2UtY29yZSBiYXNlZCBvbiBpdHMgdXNh
Z2UsIHF0Y3JlYXRvciwgZXRjLg0KDQpUaGFua3MsDQpKZXNzaWNhDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBFcmljIELDqW5hcmQNClNlbnQ6IFdlZG5lc2RheSwg
RGVjZW1iZXIgMjEsIDIwMTEgMTI6NTEgQU0NClRvOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBh
Ym91dCB0aGUgb2UtY29yZSBsYXllcg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGdk
Yi1jcm9zcy1jYW5hZGlhbjogYnVpbGQgZ2RiIHdpdGggcHl0aG9uIHN1cHBvcnQNCg0KTGUgMTYv
MTIvMjAxMSAxNTowNSwgRXJpYyBCw6luYXJkIGEgw6ljcml0IDoNCj4gKiBweXRob24gc3VwcG9y
dCBpcyBuZWVkZWQgZm9yIHByb3ZpZGluZyBmaW5lciBzY3JpcHRpbmcgY29udHJvbA0KPiBpbiBn
ZGIsIGFuZCBmb3IgcmVtb3RlIGNvbnRyb2xpbmcgZ2RiIGZvciBleGFtcGxlIGZyb20gcXRjcmVh
dG9yDQo+ICogZ2RiL2NvbmZpZ3VyZSB0cmllcyB0byBhdXRvZGV0ZWN0IHB5dGhvbiB1c2luZyBw
eXRob24gZXhlY3V0YWJsZQ0KPiB3aXRoIC0taW5jbHVkZXMgLS1sZGZsYWdzIC0tZXhlYy1wcmVm
aXggdG8gZ2V0IHRoZSByaWdodCBmbGFncw0KPiBBcyBpdCdzIGRpZmZpY3VsdCB0byBhY2hpZXZl
IGluIE9FJ3MgY29udGV4dCwgd2UgZ2VuZXJhdGUgYQ0KPiBzY3JpcHQgd2hpY2ggd2lsbCByZXR1
cm4gdGhlIHJpZ2h0IHZhbHVlcyBhbmQgbWFrZSBnZGIncyBidWlsZA0KPiBzeXN0ZW0gaGFwcHku
IFRoaXMgaWRlYSB3YXMgdGFrZW4gZnJvbSB0aGUgZm9sbG93aW5nIGFydGljbGUgOg0KPiBodHRw
Oi8vd3d3Lm1lbnRieS5jb20vZG91Zy1ldmFucy0yL3B5dGhvbi1lbmFibGVkLWdkYi1vbi13aW5k
b3dzLWFuZC1yZWxvY2F0aW9uLmh0bWwNCj4gKiB0ZXN0ZWQgdXNpbmcgYW5nc3Ryb20mICBhcm12
NyB0YXJnZXQmICBxdGNyZWF0b3IgMjAxMDA1JiAgMi40LjANCj4NCj4gU2lnbmVkLW9mZi1ieTog
RXJpYyBCw6luYXJkPGVyaWNAZXVrcmVhLmNvbT4NCj4gQ2M6IGZjb29wZXJAdGkuY29tDQo+IC0t
LQ0KPiAgIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLWNyb3NzLWNhbmFkaWFuLmluYyB8
ICAgMjAgKysrKysrKysrKysrKysrKysrKy0NCj4gICAxIGZpbGVzIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2RiL2dkYi1jcm9zcy1jYW5hZGlhbi5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2RiL2dkYi1jcm9zcy1jYW5hZGlhbi5pbmMNCj4gaW5kZXggZWMwNzQ4ZS4uZTBlNmUzMCAx
MDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItY3Jvc3MtY2FuYWRp
YW4uaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLWNyb3NzLWNhbmFk
aWFuLmluYw0KPiBAQCAtNCw0ICs0LDIyIEBAIERFU0NSSVBUSU9OID0gImNyb3NzLWNhbmFkaWFu
IGdkYiBmb3IgJHtUQVJHRVRfQVJDSH0gdGFyZ2V0IC0gR05VIGRlYnVnZ2VyIg0KPiAgIFBOID0g
ImdkYi1jcm9zcy1jYW5hZGlhbi0ke1RSQU5TTEFURURfVEFSR0VUX0FSQ0h9Ig0KPiAgIEJQTiA9
ICJnZGIiDQo+DQo+IC1ERVBFTkRTID0gIm5jdXJzZXMtbmF0aXZlc2RrIGV4cGF0LW5hdGl2ZXNk
ayBnZXR0ZXh0LW5hdGl2ZXNkayByZWFkbGluZS1uYXRpdmVzZGsiDQo+ICtERVBFTkRTID0gIm5j
dXJzZXMtbmF0aXZlc2RrIGV4cGF0LW5hdGl2ZXNkayBnZXR0ZXh0LW5hdGl2ZXNkayByZWFkbGlu
ZS1uYXRpdmVzZGsgcHl0aG9uLW5hdGl2ZXNkayINCj4gK1JERVBFTkRTICs9ICJweXRob24tbmF0
aXZlc2RrLWNvcmUgcHl0aG9uLW5hdGl2ZXNkay1sYW5nIHB5dGhvbi1uYXRpdmVzZGstcmUgXA0K
PiArICAgICAgICAgICAgIHB5dGhvbi1uYXRpdmVzZGstY29kZWNzIHB5dGhvbi1uYXRpdmVzZGst
bmV0Y2xpZW50Ig0KPiArDQo+ICtFWFRSQV9PRUNPTkZfYXBwZW5kID0gIi0td2l0aC1weXRob249
JHtXT1JLRElSfS9weXRob24iDQo+ICsNCj4gK2RvX2NvbmZpZ3VyZV9wcmVwZW5kKCkgew0KPiAr
Y2F0PiAgJHtXT1JLRElSfS9weXRob248PCAgRU9GDQo+ICsjISAvYmluL3NoDQo+ICtjYXNlICJc
JDIiIGluDQo+ICsgICAgICAgIC0taW5jbHVkZXMpIGVjaG8gIi1JJHtTVEFHSU5HX0RJUn0vJHtI
T1NUX0FSQ0h9LW5hdGl2ZXNkayR7SE9TVF9WRU5ET1J9LSR7SE9TVF9PU30ke2V4ZWNfcHJlZml4
fS9pbmNsdWRlL3B5dGhvbiR7UFlUSE9OX0JBU0VWRVJTSU9OfS8iIDs7DQo+ICsgICAgICAgIC0t
bGRmbGFncykgZWNobyAiLUwke1NUQUdJTkdfRElSfS8ke0hPU1RfQVJDSH0tbmF0aXZlc2RrJHtI
T1NUX1ZFTkRPUn0tJHtIT1NUX09TfSR7bGliZGlyfS9weXRob24ke1BZVEhPTl9CQVNFVkVSU0lP
Tn0vY29uZmlnL2NvbmZpZyAtbHB0aHJlYWQgLWxkbCAtbHV0aWwgLWxtIC1scHl0aG9uJHtQWVRI
T05fQkFTRVZFUlNJT059IiA7Ow0KPiArICAgICAgICAtLWV4ZWMtcHJlZml4KSBlY2hvICIvdXNy
IiA7Ow0KPiArICAgICAgICAqKSBleGl0IDEgOzsNCj4gK2VzYWMNCj4gK2V4aXQgMA0KPiArRU9G
DQo+ICsgICAgICAgIGNobW9kICt4ICR7V09SS0RJUn0vcHl0aG9uDQo+ICt9DQo+IFwgTm8gbmV3
bGluZSBhdCBlbmQgb2YgZmlsZQ0KDQphbnkgY29tbWVudCBjb25jZXJuaW5nIHRoaXMgcGF0Y2gg
Pw0KDQpUaGFua3MNCkVyaWMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCk9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KT3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcv
Y2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=


