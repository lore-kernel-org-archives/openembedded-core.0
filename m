Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=VA3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RQxRd-0004fE-TI
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 09:35:42 +0100
Received: from mail130-va3-R.bigfish.com (10.7.14.248) by
	VA3EHSOBE001.bigfish.com (10.7.40.21) with Microsoft SMTP Server id
	14.1.225.22; Thu, 17 Nov 2011 08:13:39 +0000
Received: from mail130-va3 (localhost [127.0.0.1])	by
	mail130-va3-R.bigfish.com (Postfix) with ESMTP id 8ED4E40269;
	Thu, 17 Nov 2011 08:14:17 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz6d524hz2dh2a8h668h839h8e2h8e3h941h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail130-va3 (localhost.localdomain [127.0.0.1]) by mail130-va3
	(MessageSwitch) id 1321517657459609_8283;
	Thu, 17 Nov 2011 08:14:17 +0000 (UTC)
Received: from VA3EHSMHS022.bigfish.com (unknown [10.7.14.248])	by
	mail130-va3.bigfish.com (Postfix) with ESMTP id 6AD08260047;
	Thu, 17 Nov 2011 08:14:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS022.bigfish.com
	(10.7.99.32) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 17 Nov 2011 08:13:36 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Thu, 17 Nov 2011 02:14:07 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "niqingliang@insigma.com.cn" <niqingliang@insigma.com.cn>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] how to exclude files when packaging?
Thread-Index: AQHMpQDgLWi8p1Qaz0GOGtXgkBqzqw==
Date: Thu, 17 Nov 2011 08:14:06 +0000
Message-ID: <CAEsOVNdL3bTKA9rv6p9SEpvoY+a3b5y6Ftn=ySMVdgkW3nMm3w@mail.gmail.com>
References: <1321496999.1264.24.camel@localhost.localdomain>
In-Reply-To: <1321496999.1264.24.camel@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: how to exclude files when packaging?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 17 Nov 2011 08:35:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-ID: <FB0FFEB8AC182749A062112325201867@freescale.net>
Content-Transfer-Encoding: base64

T24gV2VkLCBOb3YgMTYsIDIwMTEgYXQgODoyOSBQTSwgTmkgUWluZ2xpYW5nDQo8bmlxaW5nbGlh
bmdAaW5zaWdtYS5jb20uY24+IHdyb3RlOg0KPiBIZWxsbywgQWxsOg0KPiAgICAgICAgSSdtIHdv
cmtpbmcgb24gb3BlbnNhZiwgd3JvdGUgYSBiYiBmaWxlIGZvciBpdCwNCj4gYW5kIGZvdW5kIHRo
YXQgdGhlIEZJTEVTXyR7UE59IGhhcyBpbmNsdWRlZCAvdXNyL2xpYi8ke1BOfS8qLg0KPiBidXQg
dGhlcmUgYXJlIHNvbWUgLmEgYW5kIC5zbyhzeW1saW5rKSBpbiAvdXNyL2xpYi8ke1BOfSwgd2hp
Y2ggd2lsbA0KPiByZXN1bHQgUUEgaXNzdWUuDQo+ICAgICAgICBob3cgdG8gZXhjbHVkZSBzb21l
IGZpbGVzIChlLmcuICouYSwgKi5zbykgaW4gRklMRVNfJHtQTn0/DQo+DQo+ICAgICAgICB0aGVy
ZSBhcmUgc29tZSBlbGYgaW4gL3Vzci9saWIvJHtQTn0gd2hvc2UgcHJlZml4IGlzIG5vdCAnbGli
Jywgc28gaWYNCj4gbm8gJ2V4Y2x1ZGUnIGZlYXR1cmUsIEkgbXVzdCByZWRlZmluZSBGSUxFU18k
e1BOfSBsaWtlIHRoaXM6DQo+ICAgICAgICBGSUxFU18ke1BOfSA9ICIvdXNyL2xpYi8ke1BOfS8q
LnNvLiogXA0KPiAgICAgICAgICAgICAgICAgICAgICAgL3Vzci9saWIvJHtQTn0vc2FmKiBcDQo+
ICAgICAgICAgICAgICAgICAgICAgICAvdXNyL2xpYi8ke1BOfS9vcGVuKiBcDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAvdXNyL2xpYi8ke1BOfS9pbW1sb2FkIFwNCj4gICAgICAgICAgICAgICAg
ICAgICAgIC91c3IvbGliLyR7UE59L25pZF90aXBjIFwNCj4gICAgICAgICAgICAgICAgICAgICAg
IC91c3IvbGliLyR7UE59L3NtZiogXA0KPiAgICAgICAgICAgICAgICAgICAgICAgL3Vzci9saWIv
JHtQTn0vY2xjLWNsaS8qIg0KDQpFeHBsaWNpdGx5IGxpc3Qgd2hhdCB5b3Ugd2FudCBpbiBGSUxF
U18ke1BOfQ0KDQpGSUxFU18ke1BOfSA9IC91c3IvbGliLyR7UE59L3NhZg0KDQpNYWtlIGFub3Ro
ZXIgUEFDS0FHRSBmb3Igb3RoZXIgZmlsZXMNCg0KUEFDS0FHRVMgPSsgJHtQTn0tbWlzYw0KRklM
RVNfJHtQTn0tbWlzYyA9IC91c3IvbGliLyR7UE59L3NhZg0KDQpNYXliZSBzb21lb25lIGVsc2Ug
Y2FuIGNoaW1lIGluIGlmIHRoZXJlIGlzIGEgd2F5IHRvIG1hc2sgY2VydGFpbiBmaWxlcy4uLg0K
DQotTQ==



