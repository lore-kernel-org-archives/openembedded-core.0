Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 175B77C704
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 12:57:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2019 04:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,372,1544515200"; d="scan'208";a="319304409"
Received: from kmsmsx155.gar.corp.intel.com ([172.21.73.106])
	by fmsmga006.fm.intel.com with ESMTP; 15 Feb 2019 04:57:07 -0800
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.205]) by
	KMSMSX155.gar.corp.intel.com ([169.254.15.138]) with mapi id
	14.03.0415.000; Fri, 15 Feb 2019 20:57:07 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH 2/2] mesa: upgrade 18.1.9 -> 18.3.3
Thread-Index: AQHUxQC41HUTsbGqh0y4dq/4BTKb3KXgSMSAgAABq4CAAIcawA==
Date: Fri, 15 Feb 2019 12:57:06 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F302290108@PGSMSX105.gar.corp.intel.com>
References: <20190215073207.30036-1-anuj.mittal@intel.com>
	<20190215073207.30036-2-anuj.mittal@intel.com>
	<CAP9ODKq0zcHhXON4xWvTTUpnYRoMHOHvwd0RSJHwQeSa2d7P7w@mail.gmail.com>
	<CANNYZj_pn3Ff0Bo+NhpSfq-psdeL9rwz0giS0NabW8Xa5S8ujg@mail.gmail.com>
In-Reply-To: <CANNYZj_pn3Ff0Bo+NhpSfq-psdeL9rwz0giS0NabW8Xa5S8ujg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjM2MTdmNDctYWZiZS00ZDJmLTk0OWYtYmZjNWI1NGZlZmI3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicUhDeXM2cHlJaVJDRUI5MEVTTWVzcnVsb3pkRWtKZ1dzMzRPMktCc21CNnd5SWRHa1BcLzYwU0ExM1hFWnp3dEsifQ==
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 12:57:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gW21haWx0bzphbGV4LmthbmF2aW5AZ21haWwuY29tXQ0KPiBTZW50OiBGcmlkYXksIEZlYnJ1
YXJ5IDE1LCAyMDE5IDA4OjUyIFBNDQo+IFRvOiBPdGF2aW8gU2FsdmFkb3IgPG90YXZpby5zYWx2
YWRvckBvc3N5c3RlbXMuY29tLmJyPg0KPiBDYzogTWl0dGFsLCBBbnVqIDxhbnVqLm1pdHRhbEBp
bnRlbC5jb20+OyBGYWJpbyBCZXJ0b24NCj4gPGZhYmlvLmJlcnRvbkBvc3N5c3RlbXMuY29tLmJy
PjsgUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gPG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIDIvMl0gbWVzYTogdXBncmFkZSAxOC4xLjkgLT4gMTguMy4zDQo+IA0K
PiBPbiBGcmksIDE1IEZlYiAyMDE5IGF0IDEzOjQ2LCBPdGF2aW8gU2FsdmFkb3IgPG90YXZpby5z
YWx2YWRvckBvc3N5c3RlbXMuY29tLmJyPg0KPiB3cm90ZToNCj4gDQo+ID4gSSB0aGluayB0aGlz
IHBhdGNoIHNob3VsZCBiZSBzcGxpdCBvZmYuIEZpcnN0IHdlIHNob3VsZCB1cGdyYWRlIHRvIHRo
ZQ0KPiA+IG5ld2VyIHJlbGVhc2UgYW5kIGxhdGVyIGNvbnZlcnQgaXQgdG8gdXNlIG1lc29uLg0K
PiA+DQo+ID4gVGhpcyBhbGxvd3MgZm9yIGJldHRlciByZXZpZXcgYW5kIHRlc3RpbmcuDQo+ID4N
Cj4gPiBJZiBkZXNpcmVkLCB3ZSBjYW4gZG8gdGhlIHVwZ3JhZGUgb24gb3VyIHNpZGUgYW5kIEFu
dWogY2FuIGhhbmRsZSB0aGUNCj4gPiBtZXNvbiBjb252ZXJ0aW9uLCBuZXh0LiBEb2VzIGl0IG1h
a2Ugc2Vuc2U/DQo+IA0KPiBOb3QgcmVhbGx5LCBpbiBteSBvcGluaW9uLCBpdCdzIGp1c3QgbW9y
ZSBmcmljdGlvbiBhbmQgY29vcmRpbmF0aW9uLCBhbmQgZGVsYXlzLiBJdCdzDQo+IGJldHRlciB0
byBqdXN0IGZpeCB0aGUgaXNzdWVzIHdpdGggdGhlIGV4aXN0aW5nIHBhdGNoLg0KPiBJJ2xsIHNl
bmQgYSBmaXhlZCB2ZXJzaW9uIGluIGEgZmV3IG1pbnV0ZXMuDQo+IA0KDQpUaGFua3MgQWxleC4g
DQoNCkkgZGlkbuKAmXQgd2FudCB0byBzcGVuZCB0aW1lIGluIHJlZnJlc2hpbmcgcGF0Y2hlcyBp
biBvbmUgY29tbWl0IGFuZCB0ZXN0aW5nIGFuZCBtYWtpbmcgc3VyZSB0aGV5IHdlcmUgY29ycmVj
dCB3aGVuIHNvbWUgb2YgdGhlbSB3ZXJlIGdvaW5nIHRvIGJlIHJlbW92ZWQgaW4gbmV4dC4gU28g
SSB0b29rIHRoaXMgYXBwcm9hY2guDQoNClRoYW5rcywNCkFudWoNCg==

