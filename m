Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6797ED3F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 23:44:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,572,1559491200"; d="scan'208";a="76326922"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Oct 2019 07:44:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E9DE04CE03E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 07:44:01 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0439.000; Wed, 2 Oct 2019 07:44:02 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?utf-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcnBtOiBtYWtlIHJwbSB3b3Jr?=
	=?utf-8?Q?_in_toolchain._(rev4)?=
Thread-Index: AQHVczSJa6KEBbABekmyraQEjQI1YKc9sqIggAjKd+A=
Date: Tue, 1 Oct 2019 23:44:09 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B71592@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1569368723-80048-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20190925000228.2332.28535@do>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B70BD7@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B70BD7@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: E9DE04CE03E8.AE6C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHJwbTogbWFrZSBycG0gd29yayBpbiB0b29sY2hhaW4uIChyZXY0KQ==?=
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
X-List-Received-Date: Tue, 01 Oct 2019 23:44:03 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

cGluZw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBbbWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlLWJv
dW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+
IFpoZW5nLCBSdW9xaW4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAy
NiwgMjAxOSA1OjMxIFBNDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcnBtOiBtYWtlIHJwbSB3b3Jr
IGluIHRvb2xjaGFpbi4NCj4gKHJldjQpDQo+IA0KPiBIaQ0KPiANCj4gSSBm
b3VuZCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL2ZpbGVzL3JwbS1zZXR1
cC5weSBpcyBpbiBteSBwYXRjaC4NCj4gDQo+IEJ1dCB0aGUgYXV0b21hdGVk
IHRlc3QgcmVzdWx0cyBoYXZlIGFuIGVycm9yIG1lc3NhZ2UgYXMgZm9sbG93
czoNCj4gDQo+ICAgT3V0cHV0ICAgICAgICAgICBQbGVhc2UsIGZpeCB0aGUg
bGlzdGVkIGlzc3VlczoNCj4gICAgICAgICAgICAgICAgICAgIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9ycG0vZmlsZXMvcnBtLXNldHVwLnB5IGRvZXMgbm90
IGV4aXN0DQo+IA0KPiBEb2VzIGFueW9uZSBoYXZlIGFueSBzdWdnZXN0aW9u
Pw0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gWmhlbmcgUnVvcWluDQo+IE5hbmppbmcgRnVq
aXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkNCj4g
QUREUi46IE5vLjYgV2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCj4g
ICAgICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCj4gTUFJTCA6IHpoZW5n
cnEuZm5zdEBjbi5mdWppc3R1LmNvbQ0KPiANCj4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFBhdGNod29yayBbbWFpbHRvOnBh
dGNod29ya0BwYXRjaHdvcmsub3BlbmVtYmVkZGVkLm9yZ10NCj4gPiBTZW50
OiBXZWRuZXNkYXksIFNlcHRlbWJlciAyNSwgMjAxOSA4OjAyIEFNDQo+ID4g
VG86IFpoZW5nLCBSdW9xaW4v6YORIOiLpemSpiA8emhlbmdycS5mbnN0QGNu
LmZ1aml0c3UuY29tPg0KPiA+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gU3ViamVjdDog4pyXIHBhdGNodGVz
dDogZmFpbHVyZSBmb3IgcnBtOiBtYWtlIHJwbSB3b3JrIGluIHRvb2xjaGFp
bi4NCj4gPiAocmV2NCkNCj4gPg0KPiA+ID09IFNlcmllcyBEZXRhaWxzID09
DQo+ID4NCj4gPiBTZXJpZXM6IHJwbTogbWFrZSBycG0gd29yayBpbiB0b29s
Y2hhaW4uIChyZXY0KQ0KPiA+IFJldmlzaW9uOiA0DQo+ID4gVVJMICAgOiBo
dHRwczovL3BhdGNod29yay5vcGVuZW1iZWRkZWQub3JnL3Nlcmllcy8xOTc4
OS8NCj4gPiBTdGF0ZSA6IGZhaWx1cmUNCj4gPg0KPiA+ID09IFN1bW1hcnkg
PT0NCj4gPg0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRo
aXMgcGF0Y2ggc2VyaWVzIHRvIE9wZW5FbWJlZGRlZCBDb3JlLiBUaGlzDQo+
ID4gaXMgYW4gYXV0b21hdGVkIHJlc3BvbnNlLiBTZXZlcmFsIHRlc3RzIGhh
dmUgYmVlbiBleGVjdXRlZCBvbiB0aGUNCj4gPiBwcm9wb3NlZCBzZXJpZXMg
YnkgcGF0Y2h0ZXN0IHJlc3VsdGluZyBpbiB0aGUgZm9sbG93aW5nIGZhaWx1
cmVzOg0KPiA+DQo+ID4NCj4gPg0KPiA+ICogSXNzdWUgICAgICAgICAgICAg
RXJyb3JzIGluIHlvdXIgUHl0aG9uIGNvZGUgd2VyZSBlbmNvdW50ZXJlZCBb
dGVzdF9weWxpbnRdDQo+ID4gICBTdWdnZXN0ZWQgZml4ICAgIENvcnJlY3Qg
dGhlIGxpbmVzIGludHJvZHVjZWQgYnkgeW91ciBwYXRjaA0KPiA+ICAgT3V0
cHV0ICAgICAgICAgICBQbGVhc2UsIGZpeCB0aGUgbGlzdGVkIGlzc3VlczoN
Cj4gPiAgICAgICAgICAgICAgICAgICAgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3JwbS9maWxlcy9ycG0tc2V0dXAucHkgZG9lcw0KPiA+IG5vdCBleGlzdA0K
PiA+DQo+ID4NCj4gPg0KPiA+IElmIHlvdSBiZWxpZXZlIGFueSBvZiB0aGVz
ZSB0ZXN0IHJlc3VsdHMgYXJlIGluY29ycmVjdCwgcGxlYXNlIHJlcGx5DQo+
ID4gdG8gdGhlIG1haWxpbmcgbGlzdCAob3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZykgcmFpc2luZyB5b3VyDQo+IGNvbmNlcm5z
Lg0KPiA+IE90aGVyd2lzZSB3ZSB3b3VsZCBhcHByZWNpYXRlIHlvdSBjb3Jy
ZWN0aW5nIHRoZSBpc3N1ZXMgYW5kIHN1Ym1pdHRpbmcNCj4gPiBhIG5ldyB2
ZXJzaW9uIG9mIHRoZSBwYXRjaHNldCBpZiBhcHBsaWNhYmxlLiBQbGVhc2Ug
ZW5zdXJlIHlvdQ0KPiA+IGFkZC9pbmNyZW1lbnQgdGhlIHZlcnNpb24gbnVt
YmVyIHdoZW4gc2VuZGluZyB0aGUgbmV3IHZlcnNpb24gKGkuZS4NCj4gPiBb
UEFUQ0hdIC0+IFtQQVRDSCB2Ml0gLT4gW1BBVENIIHYzXSAtPiAuLi4pLg0K
PiA+DQo+ID4gLS0tDQo+ID4gR3VpZGVsaW5lczoNCj4gPiBodHRwczovL3d3
dy5vcGVuZW1iZWRkZWQub3JnL3dpa2kvQ29tbWl0X1BhdGNoX01lc3NhZ2Vf
R3VpZGVsaW5lcw0KPiA+IFRlc3QgZnJhbWV3b3JrOiBodHRwOi8vZ2l0Lnlv
Y3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wYXRjaHRlc3QNCj4gPiBU
ZXN0IHN1aXRlOiAgICAgaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2Nn
aXQvY2dpdC5jZ2kvcGF0Y2h0ZXN0LW9lDQo+ID4NCj4gPg0KPiANCj4gDQo+
IA0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxp
c3QNCj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQoKCg==

