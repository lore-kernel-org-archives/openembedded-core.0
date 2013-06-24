Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4CA61FB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 16:10:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5OGAEqm015957
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Jun 2013 09:10:14 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.195]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0342.003;
	Mon, 24 Jun 2013 09:10:14 -0700
From: "Hatle, Mark" <mark.hatle@windriver.com>
To: "'Paul Eggleton'" <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] buildtools-tarball: Change the way the SDK
	is sanitized
Thread-Index: AQHOcO/gbqxRvC/UkUmojJzD1im0NplFCL4v
Date: Mon, 24 Jun 2013 16:10:14 +0000
Message-ID: <154B64CD119D7843A9EC39EC45EE7CD88A8DA547@ALA-MBB.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.82.131]
MIME-Version: 1.0
Cc: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildtools-tarball: Change the way the SDK is sanitized
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
X-List-Received-Date: Mon, 24 Jun 2013 16:10:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_154B64CD119D7843A9EC39EC45EE7CD88A8DA547ALAMBBcorpadwrs_"

--_000_154B64CD119D7843A9EC39EC45EE7CD88A8DA547ALAMBBcorpadwrs_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U3R1cGlkIHBob25lIHdpbGwgb25seSBhbGxvdyBtZSB0byB0b3AgcG9zdC4gQW55d2F5LCB0aGF0
IGxpbmUgd2FzIGNvcGllZCBvdXQgb2YgdGhlIHBvcHVsYXRlX3NkayBiYmNsYXNzLiBTbyBpZiBp
dCBpcyBhIGJhc2gtaXNtIHRoZW4gaXQgbmVlZHMgdG8gYmUgZml4ZWQgdGhlcmUgYXMgd2VsbC4N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBhdWwgRWdnbGV0b24gW3BhdWwu
ZWdnbGV0b25AbGludXguaW50ZWwuY29tPG1haWx0bzpwYXVsLmVnZ2xldG9uQGxpbnV4LmludGVs
LmNvbT5dDQpTZW50OiBNb25kYXksIEp1bmUgMjQsIDIwMTMgMDg6MzEgQU0gUGFjaWZpYyBTdGFu
ZGFyZCBUaW1lDQpUbzogSGF0bGUsIE1hcmsNCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gYnVpbGR0b29s
cy10YXJiYWxsOiBDaGFuZ2UgdGhlIHdheSB0aGUgU0RLIGlzIHNhbml0aXplZA0KDQoNCk9uIE1v
bmRheSAyNCBKdW5lIDIwMTMgMDk6NDc6MTUgTWFyayBIYXRsZSB3cm90ZToNCj4gKyAgICAgc2Ny
aXB0PSR7MTotJHtTREtfT1VUUFVUfS8ke1NES1BBVEh9L2Vudmlyb25tZW50LXNldHVwLSR7U0RL
X1NZU319DQoNCkkgY291bGQgYmUgd3JvbmcgYnV0IEkgdGhpbmsgdGhpcyBtYXkgYmUgYSBiYXNo
aXNtLi4uDQoNCkNoZWVycywNClBhdWwNCg0KLS0NCg0KUGF1bCBFZ2dsZXRvbg0KSW50ZWwgT3Bl
biBTb3VyY2UgVGVjaG5vbG9neSBDZW50cmUNCg==

--_000_154B64CD119D7843A9EC39EC45EE7CD88A8DA547ALAMBBcorpadwrs_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDMuMi8vRU4iPg0KPGh0bWw+
DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9o
dG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVudD0iTVMg
RXhjaGFuZ2UgU2VydmVyIHZlcnNpb24gMTQuMDIuMDM0Mi4wMDEiPg0KPHRpdGxlPlJlOiBbT0Ut
Y29yZV0gW1BBVENIXSBidWlsZHRvb2xzLXRhcmJhbGw6IENoYW5nZSB0aGUgd2F5IHRoZSBTREsg
aXMgc2FuaXRpemVkPC90aXRsZT4NCjwvaGVhZD4NCjxib2R5Pg0KU3R1cGlkIHBob25lIHdpbGwg
b25seSBhbGxvdyBtZSB0byB0b3AgcG9zdC4gQW55d2F5LCB0aGF0IGxpbmUgd2FzIGNvcGllZCBv
dXQgb2YgdGhlIHBvcHVsYXRlX3NkayBiYmNsYXNzLiBTbyBpZiBpdCBpcyBhIGJhc2gtaXNtIHRo
ZW4gaXQgbmVlZHMgdG8gYmUgZml4ZWQgdGhlcmUgYXMgd2VsbC48YnI+DQo8YnI+DQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4NCjxiPkZyb206Jm5ic3A7PC9iPlBhdWwgRWdnbGV0b24g
WzxhIGhyZWY9Im1haWx0bzpwYXVsLmVnZ2xldG9uQGxpbnV4LmludGVsLmNvbSI+cGF1bC5lZ2ds
ZXRvbkBsaW51eC5pbnRlbC5jb208L2E+XTxicj4NCjxiPlNlbnQ6Jm5ic3A7PC9iPk1vbmRheSwg
SnVuZSAyNCwgMjAxMyAwODozMSBBTSBQYWNpZmljIFN0YW5kYXJkIFRpbWU8YnI+DQo8Yj5Ubzom
bmJzcDs8L2I+SGF0bGUsIE1hcms8YnI+DQo8Yj5DYzombmJzcDs8L2I+b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxicj4NCjxiPlN1YmplY3Q6Jm5ic3A7PC9iPlJlOiBb
T0UtY29yZV0gW1BBVENIXSBidWlsZHRvb2xzLXRhcmJhbGw6IENoYW5nZSB0aGUgd2F5IHRoZSBT
REsgaXMgc2FuaXRpemVkPGJyPg0KPGJyPg0KPCEtLSBDb252ZXJ0ZWQgZnJvbSB0ZXh0L3BsYWlu
IGZvcm1hdCAtLT4NCjxwPjxmb250IHNpemU9IjIiPk9uIE1vbmRheSAyNCBKdW5lIDIwMTMgMDk6
NDc6MTUgTWFyayBIYXRsZSB3cm90ZTo8YnI+DQomZ3Q7ICYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHNjcmlwdD0kezE6LSR7U0RLX09VVFBVVH0vJHtTREtQQVRIfS9lbnZpcm9ubWVudC1z
ZXR1cC0ke1NES19TWVN9fTxicj4NCjxicj4NCkkgY291bGQgYmUgd3JvbmcgYnV0IEkgdGhpbmsg
dGhpcyBtYXkgYmUgYSBiYXNoaXNtLi4uPGJyPg0KPGJyPg0KQ2hlZXJzLDxicj4NClBhdWw8YnI+
DQo8YnI+DQotLTxicj4NCjxicj4NClBhdWwgRWdnbGV0b248YnI+DQpJbnRlbCBPcGVuIFNvdXJj
ZSBUZWNobm9sb2d5IENlbnRyZTxicj4NCjwvZm9udD48L3A+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_154B64CD119D7843A9EC39EC45EE7CD88A8DA547ALAMBBcorpadwrs_--
