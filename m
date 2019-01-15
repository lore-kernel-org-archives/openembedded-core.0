Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A99C77C0D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:32:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,480,1539619200"; d="scan'208";a="52041377"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2019 14:32:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 58B754BAD9B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:32:21 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0415.000; Tue, 15 Jan 2019 14:32:21 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Added armeb into QEMU_TARGETS.
Thread-Index: AQHUolqZBmoZBxfoxk2JqYOZJUWQ66Wv8RtQ
Date: Tue, 15 Jan 2019 06:32:25 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF0945B0@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <20190102051749.26477-1-hongl.fnst@cn.fujitsu.com>
	<20190102051749.26477-2-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190102051749.26477-2-hongl.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 58B754BAD9B2.ABA12
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] Added armeb into QEMU_TARGETS.
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
X-List-Received-Date: Tue, 15 Jan 2019 06:32:25 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEhvbmcsIExpdS+NXiCXrA0KPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkg
MDIsIDIwMTkgMToxOCBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogTGVpLCBNYW9odWkvl4sgls6M
ZA0KPiBTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIXSBBZGRlZCBhcm1lYiBp
bnRvIFFFTVVfVEFSR0VUUy4NCj4gDQo+IEZyb206IExlaSBNYW9odWkgPGxl
aW1hb2h1aUBjbi5mdWppdHN1LmNvbT4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IExlaSBNYW9odWkgPGxlaW1hb2h1aUBjbi5mdWppdHN1LmNvbT4NCj4gLS0t
DQo+ICBtZXRhLXBva3kvY29uZi9kaXN0cm8vcG9reS5jb25mIHwgMiArLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1wb2t5L2NvbmYvZGlzdHJv
L3Bva3kuY29uZiBiL21ldGEtcG9reS9jb25mL2Rpc3Ryby9wb2t5LmNvbmYN
Cj4gaW5kZXggZjVkZThmMi4uZTljMjY4MSAxMDA2NDQNCj4gLS0tIGEvbWV0
YS1wb2t5L2NvbmYvZGlzdHJvL3Bva3kuY29uZg0KPiArKysgYi9tZXRhLXBv
a3kvY29uZi9kaXN0cm8vcG9reS5jb25mDQo+IEBAIC0zOSw3ICszOSw3IEBA
IERJU1RST19FWFRSQV9SREVQRU5EU19hcHBlbmRfcWVtdXg4Ni02NCA9ICIg
JHtQT0tZUUVNVURFUFN9Ig0KPiANCj4gIFRDTElCQ0FQUEVORCA9ICIiDQo+
IA0KPiAtUUVNVV9UQVJHRVRTID89ICJhcm0gYWFyY2g2NCBpMzg2IG1pcHMg
bWlwc2VsIG1pcHM2NCBtaXBzNjRlbCBuaW9zMiBwcGMNCj4geDg2XzY0Ig0K
PiArUUVNVV9UQVJHRVRTID89ICJhcm0gYXJtZWIgYWFyY2g2NCBpMzg2IG1p
cHMgbWlwc2VsIG1pcHM2NCBtaXBzNjRlbCBuaW9zMiBwcGMNCj4geDg2XzY0
Ig0KPiAgIyBPdGhlciBRRU1VX1RBUkdFVFMgInNoNCINCj4gDQo+ICBQUkVN
SVJST1JTID8/PSAiXA0KPiAtLQ0KPiAxLjkuMQ0KDQoKCg==

