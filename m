Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T9SZJ-00016g-Jt
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 05:15:49 +0200
Received: from mail75-tx2-R.bigfish.com (10.9.14.253) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.23; Thu, 6 Sep 2012 03:03:24 +0000
Received: from mail75-tx2 (localhost [127.0.0.1])	by mail75-tx2-R.bigfish.com
	(Postfix) with ESMTP id DCF112E015D;
	Thu,  6 Sep 2012 03:03:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -5
X-BigFish: VS-5(zzbb2dI98dI9371Ic89bh936eI1432I1418Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h93fhd25hf0ah107ah10d2hbe9i1155h)
Received: from mail75-tx2 (localhost.localdomain [127.0.0.1]) by mail75-tx2
	(MessageSwitch) id 1346900602816954_15246;
	Thu,  6 Sep 2012 03:03:22 +0000 (UTC)
Received: from TX2EHSMHS024.bigfish.com (unknown [10.9.14.245])	by
	mail75-tx2.bigfish.com (Postfix) with ESMTP id B8D1120046;
	Thu,  6 Sep 2012 03:03:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS024.bigfish.com
	(10.9.99.124) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 6 Sep 2012 03:03:22 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.37]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Wed, 5 Sep 2012 22:03:21 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Kang Kai <Kai.Kang@windriver.com>
Thread-Topic: [OE-core] [PATCH 0/8] Patches for LSB perl test
Thread-Index: AQHNi9nqoGWfjEQCwUmQg5f+OU9BXpd88+cAgAAAdIA=
Date: Thu, 6 Sep 2012 03:03:21 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6540C4@039-SN1MPN1-003.039d.mgd.msft.net>
References: <cover.1346406022.git.kai.kang@windriver.com>
	<504617C7.7090905@linux.intel.com>
	<70CC66F5C30A414DADDA6973E4CA391A653064@039-SN1MPN1-003.039d.mgd.msft.net>
	<50481202.8000901@windriver.com>
In-Reply-To: <50481202.8000901@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"Zhenfeng.Zhao@windriver.com" <Zhenfeng.Zhao@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Patches for LSB perl test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 03:15:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD23C782FF0522409A218F0DB2069DE5@mgd.freescale.com>
Content-Transfer-Encoding: base64

T24gV2VkLCBTZXAgNSwgMjAxMiBhdCAxMDowMSBQTSwgS2FuZyBLYWkgPEthaS5LYW5nQHdpbmRy
aXZlci5jb20+IHdyb3RlOg0KPiBPbiAyMDEy5bm0MDnmnIgwNuaXpSAxMDo0NywgTWNDbGludG9j
ayBNYXR0aGV3LUIyOTg4MiB3cm90ZToNCj4+DQo+PiBPbiBUdWUsIFNlcCA0LCAyMDEyIGF0IDEw
OjAxIEFNLCBTYXVsIFdvbGQ8c2d3QGxpbnV4LmludGVsLmNvbT4gIHdyb3RlOg0KPj4+DQo+Pj4g
T24gMDgvMzEvMjAxMiAwMzowMCBBTSwgS2FuZyBLYWkgd3JvdGU6DQo+Pj4+DQo+Pj4+IFRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQNCj4+Pj4gYjRjNTcyNWFmNGNkODVkNTY0NGYw
MzczZTI2NzRlOTAzYzRlYWIyYjoNCj4+Pj4NCj4+Pj4gICAgIHlvY3RvLWJzcDogYWRkIG1pc3Np
bmcgeHNlcnZlci14Zjg2LWNvbmZpZyAuYmJhcHBlbmQgZm9yIHFlbXUNCj4+Pj4gKDIwMTItMDgt
MjUgMTQ6NDc6MDcgKzAxMDApDQo+Pj4+DQo+Pj4+IGFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCBy
ZXBvc2l0b3J5IGF0Og0KPj4+PiAgICAgZ2l0Oi8vZ2l0LnBva3lsaW51eC5vcmcvcG9reS1jb250
cmliIGthbmdrYWkvbHNiDQo+Pj4+ICAgICBodHRwOi8vZ2l0LnBva3lsaW51eC5vcmcvY2dpdC5j
Z2kvcG9reS1jb250cmliL2xvZy8/aD1rYW5na2FpL2xzYg0KPj4+Pg0KPj4+PiBLYW5nIEthaSAo
OCk6DQo+Pj4+ICAgICBsaWJjbGFzcy1pc2EtcGVybDogYWRkIGl0DQo+Pj4+ICAgICBwZXJsOiBw
YWNrYWdlIG1vZHVsZXMgUG9kLUh0bWwgYW5kIFRpZS1IYXNoLU5hbWVkQ2FwdHVyZQ0KPj4+PiAg
ICAgbGlicG9kLXBsYWluZXItcGVybDogYWRkIGl0DQo+Pj4+ICAgICBsaWJkdW1wdmFsdWUtcGVy
bDogYWRkIGl0DQo+Pj4+ICAgICBsaWJlbnYtcGVybDogYWRkIGl0DQo+Pj4+ICAgICBsaWJmaWxl
LWNoZWNrdHJlZS1wZXJsOiBhZGQgaXQNCj4+Pj4gICAgIGxpYmkxOG4tY29sbGF0ZS1wZXJsOiBh
ZGQgaXQNCj4+Pj4gICAgIHRhc2stY29yZS1sc2I6IGFkZCBwYWNrYWdlcw0KPj4+Pg0KPj4+PiAg
ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLTUuMTQuMi9jb25maWcuc2ggICB8ICAg
IDIgKy0NCj4+Pj4gICAgLi4uL3BlcmwvbGliY2xhc3MtaXNhLXBlcmxfMC4zNi5iYiAgICAgICAg
ICAgICAgICAgfCAgIDMyDQo+Pj4+ICsrKysrKysrKysrKysrKysrKysNCj4+Pj4gICAgLi4uL3Bl
cmwvbGliZHVtcHZhbHVlLXBlcmxfMS4xNi5iYiAgICAgICAgICAgICAgICAgfCAgIDIwDQo+Pj4+
ICsrKysrKysrKysrKw0KPj4+PiAgICBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGVybC9saWJlbnYt
cGVybF8xLjAzLmJiICAgICB8ICAgMjINCj4+Pj4gKysrKysrKysrKysrKw0KPj4+PiAgICAuLi4v
cGVybC9saWJmaWxlLWNoZWNrdHJlZS1wZXJsXzQuNDEuYmIgICAgICAgICAgICB8ICAgMzMNCj4+
Pj4gKysrKysrKysrKysrKysrKysrKysNCj4+Pj4gICAgLi4uL3BlcmwvbGliaTE4bi1jb2xsYXRl
LXBlcmxfMS4wMi5iYiAgICAgICAgICAgICAgfCAgIDIyDQo+Pj4+ICsrKysrKysrKysrKysNCj4+
Pj4gICAgLi4uL3BlcmwvbGlicG9kLXBsYWluZXItcGVybF8xLjAzLmJiICAgICAgICAgICAgICAg
fCAgIDI0DQo+Pj4+ICsrKysrKysrKysrKysrDQo+Pj4+ICAgIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC90YXNrcy90YXNrLWNvcmUtbHNiLmJiICAgICAgIHwgICAgOSArKysrKy0NCj4+Pj4gICAgOCBm
aWxlcyBjaGFuZ2VkLCAxNjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4gICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0DQo+Pj4+IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wZXJsL2xpYmNs
YXNzLWlzYS1wZXJsXzAuMzYuYmINCj4+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+Pj4+IG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9wZXJsL2xpYmR1bXB2YWx1ZS1wZXJsXzEuMTYuYmINCj4+Pj4g
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wZXJsL2xpYmVudi1w
ZXJsXzEuMDMuYmINCj4+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+Pj4+IG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9wZXJsL2xpYmZpbGUtY2hlY2t0cmVlLXBlcmxfNC40MS5iYg0KPj4+PiAgICBj
cmVhdGUgbW9kZSAxMDA2NDQNCj4+Pj4gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BlcmwvbGliaTE4
bi1jb2xsYXRlLXBlcmxfMS4wMi5iYg0KPj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4+Pj4g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BlcmwvbGlicG9kLXBsYWluZXItcGVybF8xLjAzLmJiDQo+
Pj4+DQo+Pj4gS2FuZywNCj4+Pg0KPj4+IEdpdmVuIHRoYXQgTFNCIDUuMCBpcyBjb21pbmcgb3V0
IHRoYXQgcmVtb3ZlcyBtYW55IG9mIHRoZXNlIHJlcXVpcmVtZW50cywNCj4+PiBkb2VzIGl0IHJl
YWxseSBtYWtlIHNlbnNlIHRvIGFkZCB0aGVzZSBhbmQgdGhlbiByZW1vdmUgdGhlbSBhZ2FpbiBp
biBhDQo+Pj4gZnV0dXJlIHJlbGVhc2UuIEkgdW5kZXJzdGFuZCB3ZSBhcmUgdHJ5aW5nIHRvIGJl
IGFzDQo+Pj4gY29tcGxpYW50IGFzIHBvc3NpYmxlIHRvIExTQiwgYnV0IHRoaXMgbWF5IGJlc3Qg
YmUgaW4gYSBtZXRhLWxzYiBsYXllci4NCj4+DQo+PiBJcyBhIG1ldGEtbHNiIGxheWVyIGNvbWlu
Zz8gV2lsbCBpdCBiZSBhcGFydCBvZiBwb2t5Pw0KPg0KPg0KPiBJIHNlbmQgYSBwYXRjaCB0byBj
cmVhdGUgbWV0YS1sc2IgbGF5ZXIgaW4gcG9reSwgYW5kIEkgdGhpbmsgdGhhdCBpcyB3aGF0DQo+
IFNhdWwgd2FudHMuDQoNClRoYXQncyBmaW5lIGl0IGp1c3Qgd2FzIG5vdCBjbGVhciB0byBtZSBp
ZiB0aGF0IHdhcyBnb2luZyB0byBsaXZlIG9uDQphcyBhIHNlcGFyYXRlIGxheWVyIG9yIGJlIGlu
IHBva3kgYnkgZGVmYXVsdC4gSXQgd291bGQgYmUgbmljZSBpZiB0aGlzDQpmb2xsb3dlZCB0aGUg
c2FtZSByb3V0ZSBhcyBtZXRhLXlvY3RvIGhhcy4NCg0KLU0NCg0KPg0KPiBSZWdhcmRzLA0KPiBL
YWkNCj4NCj4NCj4+DQo+PiAtTQ0KPj4NCj4+PiBTYXUhDQo+Pj4NCj4+Pg0KPj4+DQo+Pj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+PiBPcGVuZW1i
ZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4+PiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+Pj4gaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWls
bWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo+DQo+DQo+DQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1h
aWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IGh0dHA6Ly9saXN0cy5saW51eHRvZ28ub3JnL2NnaS1iaW4vbWFpbG1hbi9saXN0aW5mby9vcGVu
ZW1iZWRkZWQtY29yZQ==



