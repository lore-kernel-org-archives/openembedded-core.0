Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB6973189
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 09:12:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="11103631"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Sep 2016 17:12:59 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 04E6E4623475;
	Mon, 19 Sep 2016 17:12:58 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Mon, 19 Sep 2016 17:13:01 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v2 0/1] To make yocto-spdx support spdx2.0 SPEC
Thread-Index: AQHSElF10ejqFb3naEmV3xRvHjxbpqCAhoVg
Date: Mon, 19 Sep 2016 09:13:00 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDFE57303F@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1474274390-36100-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1474274390-36100-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 04E6E4623475.AD60A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Cc: "jsmoeller@linuxfoundation.org" <jsmoeller@linuxfoundation.org>, Matt
	Germonprez <germonprez@gmail.com>,
	"liangcao@unomaha.edu" <liangcao@unomaha.edu>
Subject: Re: [PATCH v2 0/1] To make yocto-spdx support spdx2.0 SPEC
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
X-List-Received-Date: Mon, 19 Sep 2016 09:12:59 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgYWxsDQoNCiAgSSBoYXZlIHVwZGF0ZWQgbXkgcGF0Y2ggZm9yIG5ld2Vz
dCBwb2t5LCBjYW4gc29tZW9uZSBnaXZlIG1lIHNvbWUgY29tbWVudHM/IF5f
Xg0KDQpCZXN0IHJlZ2FyZHMNCkxlaQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IExlaSwgTWFvaHVpDQo+IFNlbnQ6IE1vbmRh
eSwgU2VwdGVtYmVyIDE5LCAyMDE2IDQ6NDAgUE0NCj4gVG86IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IGpzbW9l
bGxlckBsaW51eGZvdW5kYXRpb24ub3JnOyBMZWksIE1hb2h1aQ0KPiBTdWJq
ZWN0OiBbT0UtY29yZV1bUEFUQ0ggdjIgMC8xXSBUbyBtYWtlIHlvY3RvLXNw
ZHggc3VwcG9ydCBzcGR4Mi4wIFNQRUMNCj4gDQo+IFRoZXJlIGFyZSBzb21l
IHByb2JsZW1zIGluIHNwZHggbW9kdWxlKHNwZHguYmJjbGFzcykuDQo+IDEu
IFRoZSBuZXdlc3QgdmVyc2lvbiBvZiBzcGR4IHNwZWNpZmljYXRpb24gaXMg
Mi4wLiBCdXQgZXZlbiBzcGR4IDEuMSwNCj4geW9jdG8rU1BEWCBjYW4ndCBz
dXBwb3J0IHdlbGwuDQo+IDIuIEl0IGlzIGNvbXBsZXggdG8gYnVpbGQgYSBZ
b2N0bytTUERYIGVudmlyb25tZW50Lg0KPiAzLiBDcmVhdGluZyBhIHNwZHgg
ZmlsZSBzcGVuZHMgdG9vIG11Y2ggdGltZSwgZXNwZWNpYWxseSBmb3IgbGFy
Z2Ugc29mdHdhcmUuDQo+IA0KPiBUbyBpbXByb3ZlIHNwZHggbW9kdWxlICxJ
IGNoYW5nZSB0aGUgc3BkeCBjcmVhdGUgdG9vbCBmcm9tIGZvc3NvbG9neSB0
byBkb3NvY3MyLg0KPiBXaXRoIHRoaXMgcGF0Y2g6DQo+IDEuIEFsc28gZ2V0
cyBsaWNlbnNlIGluZm9ybWF0aW9ucyBieSBzY2FubmVyIGZyb20gZm9zc29s
b2d5Lg0KPiAxLiBDYW4gc3VwcG9ydCBTUERYMi4wIFNQRUMuDQo+IDIuIEJl
Y2F1c2UgZG9zb2NzMiBjYW4gd29yayBvbiBkaXJlY3Rvcmllcywgc28gdGhl
cmUgaXMgbm8gbmVjZXNzYXJ5IHRvIHBhY2sNCj4gc291cmNlIGNvZGUgYmVm
b3JlIGRvX3NwZHguIEl0IGNhbiBzYXZlIHRpbWUgZm9yIGxhcmdlIHNvZnR3
YXJlLg0KPiANCj4gTGVpIE1hb2h1aSAoMSk6DQo+ICAgTWFrZSB5b2N0by1z
cGR4IHN1cHBvcnQgc3BkeDIuMCBTUEVDDQo+IA0KPiAgbWV0YS9jbGFzc2Vz
L3NwZHguYmJjbGFzcyB8IDUwNSArKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBtZXRhL2NvbmYvbGljZW5zZXMu
Y29uZiAgIHwgIDY3ICstLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOTgg
aW5zZXJ0aW9ucygrKSwgMzc0IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4g
MS45LjENCg0KCgo=

