Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0E69377086
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 04:56:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9958620"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 12:56:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9C7E642BC503;
	Tue, 16 Aug 2016 12:56:19 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Tue, 16 Aug 2016 12:56:19 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] To make yocto-spdx support spdx2.0 SPEC
Thread-Index: AQHR4iyEgZDGbQdyaEa+7icTyxPpyaBLLq+w
Date: Tue, 16 Aug 2016 04:56:17 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDFE5520B1@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1466986302-33565-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FDFE53CBCE@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDFE53CBCE@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 9C7E642BC503.AB39B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>
Subject: Re: [PATCH] To make yocto-spdx support spdx2.0 SPEC
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
X-List-Received-Date: Tue, 16 Aug 2016 04:56:24 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgYWxsDQoNCkkgd2FudCB0byBrbm93IGlmIGFueW9uZSBtYWludGFpbnMg
dGhlIHNwZHggbW9kdWxlKHNwZHguYmJjbGFzcyk/DQpJZiBub2JvZHkgaXMg
bWFpbnRhaW5pbmcgaXQsIEkgd2FudCB0byBrbm93IGlmIEkgY2FuIGRvIGl0
LiANCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5j
ZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBbbWFpbHRvOm9wZW5lbWJl
ZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24g
QmVoYWxmIE9mDQo+IExlaSwgTWFvaHVpDQo+IFNlbnQ6IFdlZG5lc2RheSwg
SnVseSAyMCwgMjAxNiAxMDoxNCBBTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtQQVRDSF0gVG8gbWFrZSB5b2N0by1zcGR4IHN1cHBvcnQgc3Bk
eDIuMCBTUEVDDQo+IA0KPiBQaW5nLg0KPiANCj4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IExlaSwgTWFvaHVpDQo+ID4gU2Vu
dDogTW9uZGF5LCBKdW5lIDI3LCAyMDE2IDg6MTIgQU0NCj4gPiBUbzogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IENj
OiBMZWksIE1hb2h1aQ0KPiA+IFN1YmplY3Q6IFtPRS1jb3JlXVtQQVRDSF0g
VG8gbWFrZSB5b2N0by1zcGR4IHN1cHBvcnQgc3BkeDIuMCBTUEVDDQo+ID4N
Cj4gPiBUaGVyZSBhcmUgc29tZSBwcm9ibGVtcyBpbiBzcGR4IG1vZHVsZShz
cGR4LmJiY2xhc3MpLg0KPiA+IDEuIFRoZSBuZXdlc3QgdmVyc2lvbiBvZiBz
cGR4aSBzcGVjaWZpY2F0aW9uIGlzIDIuMC4gQnV0IGV2ZW4gc3BkeA0KPiA+
IDEuMSwNCj4gPiB5b2N0bytTUERYIGNhbid0IHN1cHBvcnQgd2VsbC4NCj4g
PiAyLiBJdCBpcyBjb21wbGV4IHRvIGJ1aWxkIGEgWW9jdG8rU1BEWCBlbnZp
cm9ubWVudC4NCj4gPiAzLiBDcmVhdGluZyBhIHNwZHggZmlsZSBzcGVuZHMg
dG9vIG11Y2ggdGltZSwgZXNwZWNpYWxseSBmb3IgbGFyZ2UNCj4gPiBzb2Z0
d2FyZS4NCj4gPg0KPiA+IFRvIGltcHJvdmUgc3BkeCBtb2R1bGUgLEkgY2hh
bmdlIHRoZSBzcGR4IGNyZWF0ZSB0b29sIGZyb20gZm9zc29sb2d5DQo+ID4g
dG8gZG9zb2NzMi4NCj4gPiBXaXRoIHRoaXMgcGF0Y2g6DQo+ID4gMS4gQWxz
byBnZXRzIGxpY2Vuc2UgaW5mb3JtYXRpb25zIGJ5IHNjYW5uZXIgZnJvbSBm
b3Nzb2xvZ3kuDQo+ID4gMS4gQ2FuIHN1cHBvcnQgU1BEWDIuMCBTUEVDLg0K
PiA+IDIuIEJlY2F1c2UgZG9zb2NzMiBjYW4gd29yayBvbiBkaXJlY3Rvcmll
cywgc28gdGhlcmUgaXMgbm8gbmVjZXNzYXJ5DQo+ID4gdG8gcGFjayBzb3Vy
Y2UgY29kZSBiZWZvcmUgZG9fc3BkeC4gSXQgY2FuIHNhdmUgdGltZSBmb3Ig
bGFyZ2UNCj4gc29mdHdhcmUuDQo+ID4NCj4gPiBMZWkgTWFvaHVpICgxKToN
Cj4gPiAgIFRvIE1ha2UgeW9jdG8tc3BkeCBzdXBwb3J0IHNwZHggdjIuMCBz
cGVjaWZpY2F0aW9uLg0KPiA+DQo+ID4gIG1ldGEvY2xhc3Nlcy9zcGR4LmJi
Y2xhc3MgfCA0ODgNCj4gPiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiA+IC0tLS0tLS0tDQo+ID4gIG1ldGEvY29uZi9saWNl
bnNlcy5jb25mICAgfCAgNjcgKy0tLS0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE4NCBpbnNlcnRpb25zKCspLCAzNzEgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiAtLQ0KPiA+IDEuOS4xDQo+IA0KPiANCj4gDQo+IC0tDQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVk
ZGVkLWNvcmUNCgoK

