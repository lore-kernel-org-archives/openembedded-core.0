Return-Path: <sipke.vriend@xilinx.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe001.messaging.microsoft.com [65.55.88.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1A96081A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 05:06:50 +0000 (UTC)
Received: from mail76-tx2-R.bigfish.com (10.9.14.225) by
	TX2EHSOBE013.bigfish.com (10.9.40.33) with Microsoft SMTP Server id
	14.1.225.23; Thu, 30 May 2013 05:06:51 +0000
Received: from mail76-tx2 (localhost [127.0.0.1])	by mail76-tx2-R.bigfish.com
	(Postfix) with ESMTP id 45A352E0280;
	Thu, 30 May 2013 05:06:51 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 3
X-BigFish: VPS3(zz98dI9371I542I1432Izz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz17326ah18602eh8275bh8275dhz2fh95h668h839h93fhd24hf0ah119dh1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh906i192cn1155h)
Received-SPF: pass (mail76-tx2: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=sipke.vriend@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail76-tx2 (localhost.localdomain [127.0.0.1]) by mail76-tx2
	(MessageSwitch) id 1369890409462877_14027;
	Thu, 30 May 2013 05:06:49 +0000 (UTC)
Received: from TX2EHSMHS036.bigfish.com (unknown [10.9.14.250])	by
	mail76-tx2.bigfish.com (Postfix) with ESMTP id 611D226004B;
	Thu, 30 May 2013 05:06:49 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by TX2EHSMHS036.bigfish.com
	(10.9.99.136) with Microsoft SMTP Server id 14.1.225.23;
	Thu, 30 May 2013 05:06:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from <sipke.vriend@xilinx.com>)	id 1Uhv4a-0002Fi-SB;
	Wed, 29 May 2013 22:06:48 -0700
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [yocto] meta-xilinx moved to meta-xilinx-community
Thread-Index: AQHOWDI9x11MlMDWW0qqXxbu7StZTZkc2NkggAClJ4D//6n6gA==
Date: Thu, 30 May 2013 05:06:47 +0000
References: <F001008B-B137-40CA-B102-2FFBC49C2302@gmail.com>
	<e349520e-8fb7-4ad6-b588-535dc997e6d5@DB8EHSMHS008.ehs.local>
	<CAMKF1sr5LaBMCEgnMTXPx8Z+0Vma=AVKTQhYLMfOxutyABzVNw@mail.gmail.com>
In-Reply-To: <CAMKF1sr5LaBMCEgnMTXPx8Z+0Vma=AVKTQhYLMfOxutyABzVNw@mail.gmail.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.162.128]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <ac66bb57-89b7-430a-b468-cede6bec675e@TX2EHSMHS036.ehs.local>
X-OriginatorOrg: xilinx.com
Cc: Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	meta-xilinx Mailing List <meta-xilinx@yoctoproject.org>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	David Holsgrove <dholsgrove@xilinx.com>,
	John Williams <jwilliams@xilinx.com>, Nathan Rossi <nrossi@xilinx.com>,
	Mike Matera <matera@xilinx.com>
Subject: Re: [yocto] meta-xilinx moved to meta-xilinx-community
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
X-List-Received-Date: Thu, 30 May 2013 05:06:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KTWV0YS14aWxpbnggaXMgYSBsYXllciBhaW1lZCBhdCBwcm92aWRpbmcgWGls
aW54IHN1cHBvcnQgZm9yIE1pY3JvYmxhemUgYW5kIFp5bnEgYXMgd2VsbCBhcyBhIGxpbWl0ZWQg
bnVtYmVyIG9mIEJTUHMgdG8gZXhlcmNpc2UgdGhvc2UgYXJjaGl0ZWN0dXJlcy4gVGhpcyBsYXll
ciBpcyBtYWludGFpbmVkIGJ5IFhpbGlueC4NCg0KTWV0YS14aWxpbngtY29tbXVuaXR5IGlzIGEg
bGF5ZXIgKHByZXZpb3VzbHkgbmFtZWQgbWV0YS14aWxpbngpIHdoaWNoIGhhcyBzdXBwb3J0IGZv
ciB0aGUgc2FtZSBhcmNoaXRlY3R1cmVzLCBidXQgYWxzbyBhIG51bWJlciBvZiBsZWdhY3kgYXJj
aGl0ZWN0dXJlcyAoc3VjaCBhcyBwb3dlcnBjKSBhbmQgYm9hcmRzIChtbDUwNykgd2hpY2ggd2ls
bCBub3QgYmUgaW4gdGhlIG1ldGEteGlsaW54IGxheWVyLiBUaGlzIGxheWVyIGlzIG1haW50YWlu
ZWQgcHJpbWFyaWx5IGJ5IEVsdmlzIERvd3Nvbi4NCg0KQ3VycmVudGx5IHRoZXJlIGlzIG92ZXJs
YXAgaW4gYXJjaGl0ZWN0dXJlcyBhbmQgc3VwcG9ydGVkIGJvYXJkcyBidXQgb3ZlciB0aW1lIHRo
ZSBtZXRhLXhpbGlueC1jb21tdW5pdHkgaGFzIHRoZSBvcHRpb24gb2YgbGF5ZXJpbmcgb24gdG9w
IG9mIG1ldGEteGlsaW54IGlmIHRoZXJlIGlzIG5vIGZ1bmN0aW9uYWwgZGlmZmVyZW5jZSwgd2hp
Y2ggd2lsbCByZWR1Y2UgdGhpcyBvdmVybGFwLiBUbyBkYXRlIGVhY2ggb2YgdGhlIGxheWVycyBo
YXMgbGV2ZXJhZ2VkIG9mZiB0aGUgb3RoZXIsIGFuZCB0aGUgbWFpbnRhaW5lcnMgYXJlIGluIGNv
bnRhY3Qgd2l0aCBlYWNoIG90aGVyLiANCldlIGhvcGUgb3ZlciB0aW1lIG1ldGEteGlsaW54IHdp
bGwgYmUgdGhlIGNvbW1vbiBiYXNlIGxheWVyIGZvciBtZXRhLXhpbGlueC1jb21tdW5pdHkgYW5k
IGFueSBvdGhlciBsYXllciBzdXBwb3J0aW5nIGZvciBleGFtcGxlIGN1c3RvbSBib2FyZHMgcnVu
bmluZyBYaWxpbnggaGFyZHdhcmUuDQoNCkFzIGEgbWFpbnRhaW5lciBvZiBtZXRhLXhpbGlueCBJ
IHdpbGwgc3VnZ2VzdCBzdGFydGluZyB3aXRoIGl0LCBidXQgdGhlIGNob2ljZSBvZiBsYXllciB3
aWxsIGRlcGVuZCBvbiB5b3VyIG5lZWQgYW5kIGl0IHdpbGwgYmUgd29ydGggY29tcGFyaW5nIHdo
ZXRoZXIgdGhlcmUgYXJlIGFkdmFuY2VkIGZlYXR1cmVzIGluIHRoZSBtZXRhLXhpbGlueC1jb21t
dW5pdHkgbGF5ZXIgdGhhdCB5b3UgcmVxdWlyZS4NCkJvdGggbGF5ZXJzIHVzZSB0aGUgc2FtZSBl
bWFpbCBsaXN0OiBtZXRhLXhpbGlueEB5b2N0b3Byb2plY3Qub3JnLCBzbyB0aGF0IGlzIGFsd2F5
cyBhIGdvb2Qgc3RhcnRpbmcgcG9pbnQgdG8gYXNrLg0KDQpSZWdhcmRzDQpTaXBrZQ0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2hlbSBSYWogW21haWx0bzpyYWoua2hlbUBn
bWFpbC5jb21dIA0KU2VudDogVGh1cnNkYXksIDMwIE1heSAyMDEzIDEyOjIyIFBNDQpUbzogU2lw
a2UgVnJpZW5kDQpDYzogWW9jdG8gRGlzY3Vzc2lvbiBNYWlsaW5nIExpc3Q7IE9wZW5FbWJlZGRl
ZCBEZXZlbG9wZXIgTWFpbGluZyBMaXN0OyBPcGVuRW1iZWRkZWQgQ29yZSBNYWlsaW5nIExpc3Q7
IG1ldGEteGlsaW54IE1haWxpbmcgTGlzdDsgTmF0aGFuIFJvc3NpOyBEYXZpZCBIb2xzZ3JvdmU7
IE1pa2UgTWF0ZXJhOyBKb2huIFdpbGxpYW1zDQpTdWJqZWN0OiBSZTogW3lvY3RvXSBtZXRhLXhp
bGlueCBtb3ZlZCB0byBtZXRhLXhpbGlueC1jb21tdW5pdHkNCg0KU2lwa2UNCg0KDQpPbiBXZWQs
IE1heSAyOSwgMjAxMyBhdCA1OjE0IFBNLCBTaXBrZSBWcmllbmQgPHNpcGtlLnZyaWVuZEB4aWxp
bnguY29tPiB3cm90ZToNCj4gSGksDQo+DQo+IHlvY3RvcHJvamVjdC5vcmcgaXMgbm93IGhvc3Rp
bmcgbWV0YS14aWxpbnggZnJvbSBYaWxpbnguDQo+IGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9y
Zy9jZ2l0L2NnaXQuY2dpL21ldGEteGlsaW54Lw0KPiBUaGlzIHJlcG9zaXRvcnkgd2FzIHByZXZp
b3VzbHkgYXQgd3d3LmdpdGh1Yi5jb20vWGlsaW54L21ldGEteGlsaW54LmdpdCwgYW5kIHdpbGwg
cmVtYWluIHRoZXJlIGFzIGEgbWlycm9yLg0KPg0KPiBUaGlzIGxheWVyIGNvbnRhaW5zIFhpbGlu
eCBoYXJkd2FyZSBzdXBwb3J0IG1ldGFkYXRhIGZvciBaeW5xIGFuZCBNaWNyb2JsYXplIGFyY2hp
dGVjdHVyZSwgY3VycmVudGx5IHdpdGggYnNwIGxheWVycyB0YXJnZXRpbmcgdGhlIGV2YWx1YXRp
b24gYm9hcmRzIHpjNzAyLCB6ZWRib2FyZCBhbmQga2M3MDUuIFRoZSBsYXllciBpcyB1bmRlciBk
ZXZlbG9wbWVudCBhbmQgZnVydGhlciBpbmZvcm1hdGlvbiBpcyBhdmFpbGFibGUgaW4gUkVBRE1F
IGZpbGVzIHdpdGhpbiB0aGUgbGF5ZXIuDQo+DQoNCkhvdyBkb2VzIGl0IHJlbGF0ZSB0byBtZXRh
LXhpbGlueC1jb21tdW5pdHkgbGF5ZXIgPw0KDQplZy4NCmh0dHA6Ly9naXQueW9jdG9wcm9qZWN0
Lm9yZy9jZ2l0L2NnaXQuY2dpL21ldGEteGlsaW54LWNvbW11bml0eS90cmVlL2NvbmYvbWFjaGlu
ZQ0KDQpjb250YWlucw0KDQp6YzcwMiB6YzcwNiBhbmQgemVkYm9hcmQgbWFjaGluZXMgYW1vbmcg
b3RoZXJzLg0KDQphbmQgdGhlIG5ldyBtZXRhLXhpbGlueCBsYXllciBjb250YWlucyBic3BzIGZv
ciB6YzcwMiBhbmQgemVkYm9hcmQgYXMgd2VsbC4NCg0KSSBkbyBub3Qga25vdyBtdWNoIGFib3V0
IHhpbGlueCBmYW1pbHkgb2YgY2hpcHMuIEJ1dCBzYXkgaWYgSSB3ZXJlIHRvDQp1c2UgemVib2Fy
ZA0Kd2hpY2ggbGF5ZXIgd291bGQgSSBjaG9vc2UgPw0KDQphbmQgaG93IGFyZSBkZXZlbG9wbWVu
dCBvZiB0aGVzZSB0d28gbGF5ZXJzIHJlbGF0ZWQgaWYgYXQgYWxsDQoNCg0KPiBSZWdhcmRzDQo+
IFNpcGtlIFZyaWVuZA0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBF
bHZpcyBEb3dzb24gW21haWx0bzplbHZpcy5kb3dzb25AZ21haWwuY29tXQ0KPiBTZW50OiBGcmlk
YXksIDI0IE1heSAyMDEzIDE6NTMgUE0NCj4gVG86IFlvY3RvIERpc2N1c3Npb24gTWFpbGluZyBM
aXN0OyBPcGVuRW1iZWRkZWQgRGV2ZWxvcGVyIE1haWxpbmcgTGlzdDsgT3BlbkVtYmVkZGVkIENv
cmUgTWFpbGluZyBMaXN0OyBtZXRhLXhpbGlueCBNYWlsaW5nIExpc3QNCj4gQ2M6IFNpcGtlIFZy
aWVuZDsgTmF0aGFuIFJvc3NpDQo+IFN1YmplY3Q6IG1ldGEteGlsaW54IG1vdmVkIHRvIG1ldGEt
eGlsaW54LWNvbW11bml0eQ0KPg0KPiBIaSwNCj4gICAgICAgVGhlIGV4aXN0aW5nIG1ldGEteGls
aW54IHJlcG8gaGFzIG1vdmVkIHRvIG1ldGEteGlsaW54LWNvbW11bml0eQ0KPg0KPiBodHRwOi8v
Z2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9tZXRhLXhpbGlueC1jb21tdW5pdHkv
DQo+DQo+IFRoaXMgbGF5ZXIgd2lsbCBjb250YWluIGNvbW11bml0eSBzdXBwb3J0IGZvciB0aGUg
WGlsaW54IHBsYXRmb3JtcywgaW5jbHVkaW5nIGxlZ2FjeSBib2FyZHMgKE1MNTA3KSBhbmQgb3Ro
ZXIgc29mdC1wcm9jZXNzb3IgYXJjaGl0ZWN0dXJlcy4NCj4NCj4gVGhpcyBwYXZlcyB0aGUgd2F5
IGZvciBhbiBvZmZpY2lhbGx5IHN1cHBvcnRlZCBtZXRhLXhpbGlueCBsYXllciwgdGhlIGRldGFp
bHMgb2Ygd2hpY2ggd2lsbCBiZSBvZmZpY2lhbGx5IGFubm91bmNlZCBieSBYaWxpbnguDQo+DQo+
IEJlc3QgcmVnYXJkcywNCj4NCj4gRWx2aXMgRG93c29uDQo+DQo+DQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IHlvY3RvIG1haWxpbmcgbGlzdA0K
PiB5b2N0b0B5b2N0b3Byb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zy9saXN0aW5mby95b2N0bw0KDQoKCg==



