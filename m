Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6304D71A06
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 02:38:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13593315"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2016 10:38:38 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 32C8E4670484
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 10:38:33 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0319.002; Mon, 5 Dec 2016 10:38:38 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] sqlite3: 3.14.1 -> 3.15.1
Thread-Index: AQHSSqfSTMALfLTawkWuLSMvK9GM7KD4q/fA
Date: Mon, 5 Dec 2016 02:38:36 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C6D68FD4@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1480497562-10241-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1480497562-10241-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 32C8E4670484.A72A2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] sqlite3: 3.14.1 -> 3.15.1
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
X-List-Received-Date: Mon, 05 Dec 2016 02:38:37 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEh1YW5nLCBRaXl1IA0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDMw
LCAyMDE2IDU6MTkgUE0NCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IEh1YW5nLCBRaXl1IDxodWFuZ3F5
LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBb
UEFUQ0hdIHNxbGl0ZTM6IDMuMTQuMSAtPiAzLjE1LjENCj4gDQo+IEZyb206
IEh1YW5nIFFpeXUgPGh1YW5ncXkuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4g
DQo+IFVwZ3JhZGUgc3FsaXRlMyBmcm9tIDMuMTQuMSB0byAzLjE1LjEuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBRaXl1IDxodWFuZ3F5LmZuc3RA
Y24uZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3tzcWxpdGUzXzMuMTQuMS5iYiA9PiBzcWxpdGUzXzMuMTUu
MS5iYn0gfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pICByZW5hbWUNCj4gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuMTQuMS5iYiA9PiBzcWxpdGUz
XzMuMTUuMS5iYn0gKDY2JSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjE0LjEuYmINCj4gYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjE1LjEuYmIN
Cj4gc2ltaWxhcml0eSBpbmRleCA2NiUNCj4gcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy4xNC4xLmJiDQo+IHJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18z
LjE1LjEuYmINCj4gaW5kZXggN2M4ZmE0MC4uYzMxNWE1MyAxMDA2NDQNCj4g
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy4x
NC4xLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9z
cWxpdGUzXzMuMTUuMS5iYg0KPiBAQCAtOCw1ICs4LDUgQEAgU1JDX1VSSSA9
ICJcDQo+ICAgIGZpbGU6Ly8wMDAxLXJldmVydC1hZDYwMWM3OTYyLXRoYXQt
YnJpbmdzLTItaW5jcmVhc2Utb2YtYnVpbGQtdGkucGF0Y2ggXA0KPiAgICAi
DQo+IA0KPiAtU1JDX1VSSVttZDVzdW1dID0gIjM2MzRhOTBhM2Y0OTU0MTQ2
MmJjYWVkMzQ3NGIyNjg0Ig0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4g
ImJjNzE4MjQ3NjkwMDAxN2JlY2I4MTU2NWVjZWE3Nzc1ZDQ2YWI3NDdhOTcy
ODFhYTYxMGY0ZjQ1ODgxYzQ3YTYNCj4gIg0KPiArU1JDX1VSSVttZDVzdW1d
ID0gIjAyNTlkNTJiZTg4ZjA4NWQxMDRjNmQyYWFhODM0OWFjIg0KPiArU1JD
X1VSSVtzaGEyNTZzdW1dID0NCj4gIjVkZmE4OWI3Njk3ZWUzYzJhYzdiNDRl
OGUxNTdlN2YyMDRiZjk5OWM4NjZhZmNhYThiYjFjN2ZmNjU2YWUyYzUiDQo+
IC0tDQo+IDIuNy40DQoNCgoK

