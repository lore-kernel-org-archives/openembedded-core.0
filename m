Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5272C788BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 00:00:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBM00Fg8000763
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Dec 2017 16:00:15 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.62]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Thu, 21 Dec 2017 16:00:15 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] liberation-fonts: do not
	inherit allarch
Thread-Index: AQHTeqHs/2cOO7TH702yWxiplkuaAaNO5uWA//+PSxA=
Date: Fri, 22 Dec 2017 00:00:14 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84D87A1EE0@ALA-MBC.corp.ad.wrs.com>
References: <20171221212318.242658-1-jslater@windriver.com>
	<1513895309.16507.97.camel@linuxfoundation.org>
In-Reply-To: <1513895309.16507.97.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.157.209]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] liberation-fonts: do not inherit allarch
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
X-List-Received-Date: Fri, 22 Dec 2017 00:00:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QSBudW1iZXIgb2YgcG9zdGluc3RhbGwncyBydW4gdGFyZ2V0IGJpbmFyaWVzLCB3aGV0aGVyIG9u
IHRoZSBob3N0IG9yIHRhcmdldC4gIFRoaXMgbWVhbnMgdGhleSBpbnZva2UgcWVtdSBvbiB0aGUg
aG9zdCBhbmQgdHJ5IHRvIHRlbGwgaXQgd2hlcmUgYml0cyBhcmUuICBJIHRoaW5rIGl0IG1pZ2h0
IG5vdCBiZSBuZWNlc3NhcnkgdG8gcGFzcyBleHBsaWNpdCBpbmZvcm1hdGlvbiBhYm91dCBsaWJy
YXJ5IGxvY2F0aW9ucyB0byBxZW11LCBidXQgdGhhdCBpcyB0aGUgd2F5IGl0IGlzIGRvbmUsIGFu
ZCB0aGF0IGluZm9ybWF0aW9uIGlzIGFyY2ggZGVwZW5kZW50LiAgSXQgbWlnaHQgd2VsbCBiZSB0
aGUgY2FzZSB0aGF0ICJjb25mdXNpb24iIG9jY3VycyBvbmx5IHdoZW4gbXVsdGlsaWIgaXMgZW5h
YmxlZCwgYnV0IHRoZSBwb2ludCBpcyB0aGF0IGl0IGRvZXMgaGFwcGVuLg0KDQpJIHRoaW5rIGl0
IHVzZWQgdG8gYmUgdGhlIGNhc2UgdGhhdCBhbiBhdHRlbXB0IHdhcyBtYWRlIHRvIHJ1biBuYXRp
dmUgdmVyc2lvbnMgb2YgdGFyZ2V0IHRvb2xzIGR1cmluZyBwb3N0aW5zdGFsbCwgYnV0IHRoYXQg
c2VlbXMgdG8gaGF2ZSBiZWVuIGFiYW5kb25lZCBpbiBmYXZvciBvZiB1c2luZyBxZW11LiAgVGhp
cyBtZWFucyB0aGF0IGlmIHRoZXJlIGlzIG5vIHFlbXUgc3VwcG9ydCwgcG9zdGluc3RhbGwgaXMg
ZGVmZXJyZWQgdG8gZmlyc3QgYm9vdC4gIFRoaXMgaXMgbm8gcHJvYmxlbSBleGNlcHQgZm9yIHJl
YWQtb25seSBmcydzLCBidXQgdGhleSBoYXZlIG90aGVyIHByb2JsZW1zIGFueXdheS4NCg0KSm9l
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogVGh1cnNkYXks
IERlY2VtYmVyIDIxLCAyMDE3IDI6MjggUE0NClRvOiBTbGF0ZXIsIEpvc2VwaDsgb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
b2UtY29yZV1bUEFUQ0ggMS8xXSBsaWJlcmF0aW9uLWZvbnRzOiBkbyBub3QgaW5oZXJpdCBhbGxh
cmNoDQoNCk9uIFRodSwgMjAxNy0xMi0yMSBhdCAxMzoyMyAtMDgwMCwgSm9lIFNsYXRlciB3cm90
ZToNCj4gVGhlIGZvbnRjYWNoZSBjbGFzcyBwZXJmb3JtcyBwb3N0LWluc3RhbGxhdGlvbiBjYWNo
ZSB1cGRhdGluZyBhbmQgDQo+IG5lZWRzIHRhcmdldCBhcmNoaXRlY3R1cmUgaW5mb3JtYXRpb24u
DQoNCkNhbiB5b3UgZXhwYW5kIGEgYml0IG9uIHRoaXM/IERvIHlvdSBtZWFuIHRoYXQgdGhlIHBv
c3RpbnN0YWxscyB3cml0dGVuIGludG8gdGhlIHBhY2thZ2VzIGFyZSBhcmNoIHNwZWNpZmljPyBD
YW4gd2Ugc3RvcCB0aGUgc2NyaXB0cyBiZWluZyBhcmNoIHNwZWNpZmljPw0KDQpDaGVlcnMsDQoN
ClJpY2hhcmQNCg==

