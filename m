Return-Path: <sipke.vriend@xilinx.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe001.messaging.microsoft.com [65.55.88.11])
	by mail.openembedded.org (Postfix) with ESMTP id 044F961EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 05:13:18 +0000 (UTC)
Received: from mail58-tx2-R.bigfish.com (10.9.14.234) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.22; Thu, 22 Aug 2013 05:13:18 +0000
Received: from mail58-tx2 (localhost [127.0.0.1])	by mail58-tx2-R.bigfish.com
	(Postfix) with ESMTP id D7D9110007E;
	Thu, 22 Aug 2013 05:13:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: -3
X-BigFish: VPS-3(zz98dI9371I542I1432Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah1de096h8275bh8275dh1de097hz2fh95h839h93fhd24hf0ah119dh1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h906i1155h192ch)
Received-SPF: pass (mail58-tx2: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=sipke.vriend@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail58-tx2 (localhost.localdomain [127.0.0.1]) by mail58-tx2
	(MessageSwitch) id 1377148395659107_20927;
	Thu, 22 Aug 2013 05:13:15 +0000 (UTC)
Received: from TX2EHSMHS044.bigfish.com (unknown [10.9.14.254])	by
	mail58-tx2.bigfish.com (Postfix) with ESMTP id 98607300058;
	Thu, 22 Aug 2013 05:13:15 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by TX2EHSMHS044.bigfish.com
	(10.9.99.144) with Microsoft SMTP Server id 14.16.227.3;
	Thu, 22 Aug 2013 05:13:12 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from <sipke.vriend@xilinx.com>)	id 1VCNCq-0004GS-Hw;
	Wed, 21 Aug 2013 22:13:12 -0700
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: Philip Balister <philip@balister.org>
Thread-Topic: [meta-xilinx] linux-dtb.inc
Thread-Index: AQHOnsH6/Hr7+Slv4U2b6RH2abB+0ZmgpoLQ
Date: Thu, 22 Aug 2013 05:13:11 +0000
References: <52154615.9080608@balister.org>
In-Reply-To: <52154615.9080608@balister.org>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.9]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <2c0369b0-d730-474a-92d7-903edb9dad72@TX2EHSMHS044.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "meta-xilinx@yoctoproject.org" <meta-xilinx@yoctoproject.org>,
	"OpenEmbedded Core Mailing List
	\(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-xilinx] linux-dtb.inc
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
X-List-Received-Date: Thu, 22 Aug 2013 05:13:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUGhpbGlwLA0KK0NjIG9wZW5lbWJlZGRlZC1jb3JlLg0KDQpJIGJlbGlldmUgb3BlbmVtYmVk
ZGVkLWNvcmUgY2hhbmdlZCBmcm9tIHVzaW5nIERUQyBkaXJlY3RseSwgIA0KdG8gdXNpbmcgaW4g
a2VybmVsIG1ha2UgdG8gZ2VuZXJhdGUgRFRCcyBzcGVjaWZpZWQgaW4gDQpLRVJORUxfREVWSUNF
VFJFRS4NCmh0dHA6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS9jb21t
aXQvP2lkPTcyOTgwZDViYjQ2NWYwNjQwZWQ0NTFkMWViYjljNWQyYTIxMGFkMGMNCg0KVGhpcyBy
ZWdyZXNzZWQgbWV0YS14aWxpbnggYW5kIGZvciBub3cgdGhlIGZpeCB5b3UgZGlzY3VzcyBjb3Jy
ZWN0cyANCnRoYXQsIGJ1dCB5b3UgYXJlIGNvcnJlY3QgaW4gdGhpbmtpbmcgdGhhdCBpdCBtYXkg
bm90IGJlIGFuIGlkZWFsIA0Kc29sdXRpb24uDQpodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcv
Y2dpdC9jZ2l0LmNnaS9tZXRhLXhpbGlueC9jb21taXQvP2lkPWFkNTEzOWVmOTFjN2ExZjRhMzIy
NjEyMzg0MjZmODY2MWViNTc4NzENClRoaXMgZml4IGlzIHByb3ZpZGluZyB0aGUgYWJpbGl0eSBm
b3IgdGhlIG1ldGEteGlsaW54IHVzZXIgdG8gYnVpbGQgYm90aCANCmluIGtlcm5lbCB0cmVlIERU
UyAoYXMgcGVyIHRoZSBuZXcgb2UtY29yZSB3YXkpIGFuZCBvciB0aGUgZXhpc3RpbmcgDQptZXRh
LXhpbGlueCByZWNpcGUgc3BhY2UgRFRTcy4NCg0KSSBzdXNwZWN0IG1vc3QgQlNQIHByb3ZpZGVy
cyBjYW4gbGl2ZSB3aXRoIGluIGtlcm5lbCB0cmVlIERUU3MsIGJ1dCANCml0IGlzIHVzZWZ1bCBm
b3IgbWV0YS14aWxpbnggdG8gaGF2ZSB0aGUgYWJpbGl0eSB0byBidWlsZCByZWNpcGUgc3BhY2Ug
DQpEVFNzIGFzIFhpbGlueCBhcmNoaXRlY3R1cmVzLCBkdWUgdG8gdGhlaXIgbmF0dXJlLCBhcmUg
Y29uZmlndXJhYmxlIA0KKGVzcGVjaWFsbHkgZm9yIGtjNzA1LXRyZC1taWNyb2JsYXplIGFuZCBh
bnkgZnV0dXJlIG1pY3JvYmxhemUgDQptYWNoaW5lcyBhZGRlZCB0byBtZXRhLXhpbGlueCkuIA0K
DQpBcyB5b3UgY29ycmVjdGx5IG5vdGVkLCB0aGUgc2FtZSBpbmNsdWRlIGZpbGUgbmFtZSBpcyB1
c2VkIGFzIHRoaXMgaXMgDQplZmZlY3RpdmVseSB0aGUgcHJldmlvdXMgZHRiIGdlbmVyYXRpb24g
c2NyaXB0IGZyb20gb3BlbmVtYmVkZGVkLWNvcmUsDQptaW51cyBzb21lIGR1cGxpY2F0aW9uLiBJ
dCB3YXMgaW50ZW50aW9uYWwgdG8ga2VlcCB0aGUgc2FtZSBmaWxlIG5hbWUgDQpzbyB0aGUgJ2Nv
bm5lY3Rpb24nIGlzIHNlZW4uDQoNCkFueSBhbHRlcm5hdGUgbWV0aG9kcyBrbm93IGZvciBidWls
ZGluZyBpbiByZWNpcGUgc3BhY2UgRFRTcyB3aXRoaW4gDQpvcGVuZW1iZWRkZWQtY29yZSB3aWxs
IGJlIG11Y2ggYXBwcmVjaWF0ZWQuIA0KDQpSZWdhcmRzDQpTaXBrZQ0KDQo+LS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj5PbiAgVGh1cnNkYXksIDIyIEF1Z3VzdCAyMDEzIDg6NTggQU0gQmVo
YWxmIE9mIFBoaWxpcCBCYWxpc3RlciB3cm90ZToNCj4NCj5PRS1jb3JlIGFuZCBtZXRhLXhpbGlu
eCBib3RoIGhhdmUgbGludXgtZHRiLmluYyBmaWxlcywgYnV0IHRoZXkgYXJlDQo+ZGlmZmVyZW50
Lg0KPg0KPmh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngvbWV0YS14aWxpbngvYmxvYi9tYXN0ZXIv
cmVjaXBlcy1rZXJuZWwvbGludXgvDQo+bGludXgtZHRiLmluYw0KPg0KPmFuZA0KPg0KPmh0dHA6
Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS90cmVlL21ldGEvcmVjaXBl
cy1rZXJuZWwvDQo+bGludXgvbGludXgtZHRiLmluYw0KPg0KPlVuZGVyc3RhbmRpbmcgaG93IHRo
ZXNlIHdvcmsgaXMgbm90IHNvbWV0aGluZyBJIGFtIGdvb2QgYXQsIGJ1dCBJIGFtDQo+Y29uY2Vy
bmVkIHdoZW4gSSBzZWUgYSBCU1AgZG9pbmcgc29tZXRoaW5nIHNpbWlsYXIgYnV0IGRpZmZlcmVu
dCB0byB0aGUNCj5jb3JlIGxheWVycy4gV2hhdCBhcmUgdGhlIGNoYW5jZXMgd2UgY2FuIHVuZGVy
c3RhbmQgdGhlIGRpZmZlcmVuY2VzIGFuZA0KPnNlZSBhYm91dCBjb25zb2xpZGF0aW5nIHRoZSBk
aWZmZXJlbmNlcyBpbiBvZS1jb3JlPw0KPg0KPlBoaWxpcA0KPl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+bWV0YS14aWxpbnggbWFpbGluZyBsaXN0DQo+
bWV0YS14aWxpbnhAeW9jdG9wcm9qZWN0Lm9yZw0KPmh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZy9saXN0aW5mby9tZXRhLXhpbGlueA0KPg0KPg0KCgo=



