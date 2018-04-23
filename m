Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F291745B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 10:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CB45F18401;
	Mon, 23 Apr 2018 12:18:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id bVKaPvAuFbTu; Mon, 23 Apr 2018 12:18:44 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8ED3E18297;
	Mon, 23 Apr 2018 12:18:44 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 702281A070;
	Mon, 23 Apr 2018 12:18:44 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 633591A06F;
	Mon, 23 Apr 2018 12:18:44 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 23 Apr 2018 12:18:44 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 56C4B19AE;
	Mon, 23 Apr 2018 12:18:44 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Mon, 23 Apr 2018 12:18:44 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Mon, 23 Apr 2018 12:18:44 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] State of Sumo
Thread-Index: AQHT2PK3QGUlYhNSeUCXkqYzqXhxrKQKNVgAgACG+ACAA2heQA==
Date: Mon, 23 Apr 2018 10:18:43 +0000
Message-ID: <52719ef4cc00465f946c97294e72e822@XBOX02.axis.com>
References: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
	<d00e521ea4cf4fc3962a9e10e0bcc6c2@XBOX02.axis.com>
	<CAJTo0LbAYsY3Zps89-0Q1s8VUC3zJBPqLDb-Hb1KJXOkhQUoDg@mail.gmail.com>
In-Reply-To: <CAJTo0LbAYsY3Zps89-0Q1s8VUC3zJBPqLDb-Hb1KJXOkhQUoDg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of Sumo
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
X-List-Received-Date: Mon, 23 Apr 2018 10:18:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0
bzpyb3NzLmJ1cnRvbkBpbnRlbC5jb21dDQo+IFNlbnQ6IGRlbiAyMSBhcHJpbCAyMDE4IDEwOjA4
DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4N
Cj4gQ2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gU3RhdGUgb2YgU3Vtbw0KPiANCj4gT24gMjAgQXBy
aWwgMjAxOCBhdCAyMzo0MiwgUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IDxwZXRlci5ramVsbGVyc3Rl
ZHRAYXhpcy5jb20+IHdyb3RlOg0KPiA+IE5vdCBzdXJlIHdoYXQgdGhlIHN0YXR1cyBpcyBmb3Ig
cGF0Y2hlcyBmb3IgYml0YmFrZSBpdHNlbGYsIGJ1dCBJDQo+IGhhdmUNCj4gPiBvbmUgcGVuZGlu
ZyAoImxpYi9iYi91dGlsczogcHJldmVudCBtb3ZlZmlsZSBmcm9tIGNoYW5naW5nIGRlc3QgZGly
DQo+ID4gcGVybWlzc2lvbnMiIHNlbnQgdG8gYml0YmFrZS1kZXZlbCBvbiBBcHJpbCAxMCksIHdo
aWNoIEkgd2FzIGhvcGluZw0KPiA+IHdvdWxkIG1ha2UgaXQgaW50byBTdW1vLiBUaGUgZWZmZWN0
IHdoZW4gdGhlIGJ1ZyBzdHJpa2VzIGlzIHByZXR0eQ0KPiA+IHdlaXJkLCBpbiBvdXIgY2FzZSBp
dCBjYXVzZXMgL2V0YyB0byBlbmQgdXAgd2l0aCBtb2RlIDY0NCByYXRoZXIgdGhhbg0KPiA+IDc1
NSB3aGVuIGJ1aWxkaW5nIGFuIFNESyBpbiBhIERvY2tlciBjb250YWluZXIuLi4NCj4gDQo+IEkg
d291bGRuJ3QgY2FsbCB0aGF0IGEgcmVsZWFzZSBibG9ja2VyLCBzbyBpZiB3ZSdyZSBnb29kIHRv
IGdvIG9uDQo+IE1vbmRheSB0aGF0IGNhbiBnbyB0byBtYXN0ZXIgaW5zdGVhZCBhbmQgYmUgYmFj
a3BvcnRlZCB0byB0aGUgU3Vtbw0KPiBicmFuY2ggYXNhcC4NCj4gDQo+IFJvc3MNCg0KV2VsbCwg
SSBjYW5ub3QgZGlzYWdyZWUgd2l0aCB5b3Ugb24gdGhlIHN0YXR1cyBvZiB0aGUgcGF0Y2ggdnMg
dGhlIA0KcmVsZWFzZSBzdGF0ZSBvZiBPRS1Db3JlLiBIb3dldmVyLCBpdCBoYXMgYmVlbiBhIGxp
dHRsZSBiaXQgDQpkaXNhcHBvaW50aW5nIHRvIHNlZSBtb3JlIGludmFzaXZlIHBhdGNoZXMgYmVp
bmcgcG9zdGVkIHRvIHRoZSBtYWlsaW5nIA0KbGlzdCBhbmQgc3Vic2VxdWVudGx5IGJlaW5nIGlu
dGVncmF0ZWQsIHdoaWxlIHRoaXMgcXVpdGUgdHJpdmlhbCBwYXRjaCANCmhhcyBiZWVuIG5lZ2xl
Y3RlZC4NCg0KLy9QZXRlcg0KDQo=

