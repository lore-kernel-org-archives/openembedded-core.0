Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 877A27DE99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 02:08:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4G27T4S011695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 19:07:40 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.163]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0439.000;
	Wed, 15 May 2019 19:07:19 -0700
From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
To: =?utf-8?B?TWFydGluIEh1bmRlYsO4bGw=?= <martin@geanix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [V3][Oe-core][PATCH] sysstat: Add
	PACKAGECONFIG[cron] for '--enable-install-cron' option
Thread-Index: AQHVCuzLuPtuYyOdI0G4gMGZHzEvNaZtAjsA
Date: Thu, 16 May 2019 02:07:18 +0000
Message-ID: <C2A454FDE6C23F41BD5011E2458C46C9F30CC9BA@ALA-MBD.corp.ad.wrs.com>
References: <20190515064209.230282-1-Haiqing.Bai@windriver.com>
	<9aed4d4c-5b2a-77d0-0040-1999b8767015@geanix.com>
In-Reply-To: <9aed4d4c-5b2a-77d0-0040-1999b8767015@geanix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.182]
MIME-Version: 1.0
Subject: Re: [V3][PATCH] sysstat: Add PACKAGECONFIG[cron] for '--enable-install-cron' option
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
X-List-Received-Date: Thu, 16 May 2019 02:08:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzLCAgd2lsbCB1cGRhdGUgaW4gbmV3IHJyLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogTWFydGluIEh1bmRlYsO4bGwgW21haWx0bzptYXJ0aW5AZ2Vhbml4LmNvbV0g
DQpTZW50OiAyMDE55bm0NeaciDE15pelIDE1OjA3DQpUbzogQmFpLCBIYWlxaW5nOyByb3NzLmJ1
cnRvbkBpbnRlbC5jb207IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
ClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1YzXVtPZS1jb3JlXVtQQVRDSF0gc3lzc3RhdDogQWRk
IFBBQ0tBR0VDT05GSUdbY3Jvbl0gZm9yICctLWVuYWJsZS1pbnN0YWxsLWNyb24nIG9wdGlvbg0K
DQpIaSwNCg0KT24gMTUvMDUvMjAxOSAwOC40MiwgSGFpcWluZyBCYWkgd3JvdGU6DQo+IElmICdj
cm9uJyBpcyBhZGRlZCBpbnRvIFBBQ0tBR0VDT05GSUcsIGZvciBzeXN2aW5pdCwgdGhlIHJlbGF0
ZWQNCj4gY3JvbiBzY3JpcHRzIHdpbGwgYmUgaW5zdGFsbGVkOyBmb3Igc3lzdGVtZCwgdGhlIHNl
cnZpY2VzIG9mDQo+IGRhdGEgY29sbGVjdCBhbmQgc3VtbWFyeSB3aWxsIGJlIGluc3RhbGxlZC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhaXFpbmcgQmFpIDxIYWlxaW5nLkJhaUB3aW5kcml2ZXIu
Y29tPg0KPiAtLS0NCj4gICBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0Lmlu
YyB8IDQgKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQv
c3lzc3RhdC5pbmMgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0LmluYw0K
PiBpbmRleCAwYmM3ZTE0ZDM2Li43OTU1NWU2Y2YzIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0LmluYw0KPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc3lzc3RhdC9zeXNzdGF0LmluYw0KPiBAQCAtMTksNiArMTksNyBAQCBpbmhlcml0IGF1
dG90b29scy1icm9rZW5zZXAgZ2V0dGV4dCBzeXN0ZW1kDQo+ICAgDQo+ICAgUEFDS0FHRUNPTkZJ
RyA/Pz0gIiINCj4gICBQQUNLQUdFQ09ORklHW2xtLXNlbnNvcnNdID0gIi0tZW5hYmxlLXNlbnNv
cnMsLS1kaXNhYmxlLXNlbnNvcnMsbG1zZW5zb3JzLGxtc2Vuc29ycy1saWJzZW5zb3JzIg0KPiAr
UEFDS0FHRUNPTkZJR1tjcm9uXSA9ICItLWVuYWJsZS1pbnN0YWxsLWNyb24gLS1lbmFibGUtY29w
eS1vbmx5LC0tZGlzYWJsZS1pbnN0YWxsLWNyb24gLS1kaXNhYmxlLWNvcHktb25seSINCj4gICAN
Cj4gICBFWFRSQV9PRUNPTkYgKz0gIi0tZGlzYWJsZS1zdHJpcHBpbmciDQo+ICAgDQo+IEBAIC01
OSw3ICs2MCw2IEBAIHBrZ19wb3N0aW5zdF8ke1BOfSAoKSB7DQo+ICAgICAgICAgICBmaQ0KPiAg
IH0NCj4gICANCj4gLQ0KPiAtRklMRVNfJHtQTn0gKz0gIiR7bGliZGlyfS9zYSINCj4gK0ZJTEVT
XyR7UE59ICs9ICIke2xpYmRpcn0vc2EgJHtzeXN0ZW1kX3VuaXRkaXJ9L3N5c3RlbS8qIg0KDQpZ
b3UgY2FuIHVzZSAiJHtzeXN0ZW1kX3N5c3RlbV91bml0ZGlyfSIgaW5zdGVhZCBvZiANCiIke3N5
c3RlbWRfdW5pdGRpcn0vc3lzdGVtLyIuIEFuZCBhbHNvIG5vIG5lZWQgdG8gYXBwZW5kIHRoZSBh
c3Rlcmlzay4NCg0KLy8gTWFydGluDQo=

