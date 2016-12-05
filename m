Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 67FDD60248
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 02:37:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13593265"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2016 10:37:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E6B764670489
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 10:37:08 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0319.002; Mon, 5 Dec 2016 10:37:12 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] diffutils: 3.4 -> 3.5
Thread-Index: AQHSTEjGqa3Lo4RkpUmDtOf3FQcj2aD4qD7g
Date: Mon, 5 Dec 2016 02:37:11 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C6D68FB5@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1480676637-3788-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1480676637-3788-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: E6B764670489.A9080
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] diffutils: 3.4 -> 3.5
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
X-List-Received-Date: Mon, 05 Dec 2016 02:37:20 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEh1YW5nLCBRaXl1IA0KPiBTZW50OiBGcmlkYXksIERlY2VtYmVyIDAyLCAy
MDE2IDc6MDQgUE0NCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IEh1YW5nLCBRaXl1IDxodWFuZ3F5LmZu
c3RAY24uZnVqaXRzdS5jb20+DQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFU
Q0hdIGRpZmZ1dGlsczogMy40IC0+IDMuNQ0KPiANCj4gRnJvbTogSHVhbmcg
UWl5dSA8aHVhbmdxeS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiANCj4gVXBn
cmFkZSBkaWZmdXRpbHMgZnJvbSAzLjQgdG8gMy41Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSHVhbmcgUWl5dSA8aHVhbmdxeS5mbnN0QGNuLmZ1aml0c3Uu
Y29tPg0KPiAtLS0NCj4gIC4uLi8wMDAxLVVuc2V0LW5lZWRfY2hhcnNldF9h
bGlhcy13aGVuLWJ1aWxkaW5nLWZvci1tdXNsLnBhdGNoICAgICAgICB8IDAN
Cj4gIC4uLi9kaWZmdXRpbHMve2RpZmZ1dGlscy0zLjQgPT4gZGlmZnV0aWxz
LTMuNX0vcnVuLXB0ZXN0ICAgICAgICAgICAgICB8IDANCj4gIC4uLi9yZWNp
cGVzLWV4dGVuZGVkL2RpZmZ1dGlscy97ZGlmZnV0aWxzXzMuNC5iYiA9PiBk
aWZmdXRpbHNfMy41LmJifSB8IDQgKystLQ0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pICByZW5hbWUNCj4g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2RpZmZ1dGlscy97ZGlmZnV0aWxzLTMu
NCA9Pg0KPiBkaWZmdXRpbHMtMy41fS8wMDAxLVVuc2V0LW5lZWRfY2hhcnNl
dF9hbGlhcy13aGVuLWJ1aWxkaW5nLWZvci1tdXNsLnBhdGNoDQo+ICgxMDAl
KSAgcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9kaWZmdXRpbHMve2Rp
ZmZ1dGlscy0zLjQgPT4NCj4gZGlmZnV0aWxzLTMuNX0vcnVuLXB0ZXN0ICgx
MDAlKSAgcmVuYW1lDQo+IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9kaWZmdXRp
bHMve2RpZmZ1dGlsc18zLjQuYmIgPT4gZGlmZnV0aWxzXzMuNS5iYn0gKDg3
JSkNCj4gDQo+IGRpZmYgLS1naXQNCj4gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZGlmZnV0aWxzL2RpZmZ1dGlscy0zLjQvMDAwMS1VbnNldC1uZWVkX2No
YXJzZXRfYWxpYXMNCj4gLXdoZW4tYnVpbGRpbmctZm9yLW11c2wucGF0Y2gN
Cj4gYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0aWxzL2RpZmZ1dGls
cy0zLjUvMDAwMS1VbnNldC1uZWVkX2NoYXJzZXRfYWxpYXMNCj4gLXdoZW4t
YnVpbGRpbmctZm9yLW11c2wucGF0Y2gNCj4gc2ltaWxhcml0eSBpbmRleCAx
MDAlDQo+IHJlbmFtZSBmcm9tDQo+IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9k
aWZmdXRpbHMvZGlmZnV0aWxzLTMuNC8wMDAxLVVuc2V0LW5lZWRfY2hhcnNl
dF9hbGlhcy13DQo+IGhlbi1idWlsZGluZy1mb3ItbXVzbC5wYXRjaA0KPiBy
ZW5hbWUgdG8NCj4gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2RpZmZ1dGlscy9k
aWZmdXRpbHMtMy41LzAwMDEtVW5zZXQtbmVlZF9jaGFyc2V0X2FsaWFzLXcN
Cj4gaGVuLWJ1aWxkaW5nLWZvci1tdXNsLnBhdGNoDQo+IGRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZGlmZnV0aWxzL2RpZmZ1dGlscy0z
LjQvcnVuLXB0ZXN0DQo+IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2RpZmZ1
dGlscy9kaWZmdXRpbHMtMy41L3J1bi1wdGVzdA0KPiBzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUNCj4gcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2RpZmZ1dGlscy9kaWZmdXRpbHMtMy40L3J1bi1wdGVzdA0KPiByZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2RpZmZ1dGlscy9kaWZmdXRpbHMt
My41L3J1bi1wdGVzdA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2RpZmZ1dGlscy9kaWZmdXRpbHNfMy40LmJiDQo+IGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2RpZmZ1dGlscy9kaWZmdXRpbHNfMy41LmJiDQo+
IHNpbWlsYXJpdHkgaW5kZXggODclDQo+IHJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9kaWZmdXRpbHMvZGlmZnV0aWxzXzMuNC5iYg0KPiBy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2RpZmZ1dGlscy9kaWZm
dXRpbHNfMy41LmJiDQo+IGluZGV4IGNiNzA5MmIuLjY3M2Y1ZDQgMTAwNjQ0
DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9kaWZmdXRpbHMvZGlm
ZnV0aWxzXzMuNC5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
ZGlmZnV0aWxzL2RpZmZ1dGlsc18zLjUuYmINCj4gQEAgLTE3LDggKzE3LDgg
QEAgZG9fY29uZmlndXJlX3ByZXBlbmQgKCkgew0KPiAgCWRvbmUNCj4gIH0N
Cj4gDQo+IC1TUkNfVVJJW21kNXN1bV0gPSAiZGY5Y2E0NjVmMzAzMDdjZmZk
MDNkYTE3NmE0M2E1ZDQiDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAi
ZGI1M2MwMjVmMmFjM2QyMTdiY2Y3NTNkYWQ2ZGVlN2I0MTBiMzNkMDk0ODQ5
NWZmMDE1YWFmOGI5MTE4OWNlMiINCj4gK1NSQ19VUklbbWQ1c3VtXSA9ICI1
NjkzNTQ2OTdmZjFjZmM5YTlkZTM3ODEzNjEwMTVmYSINCj4gK1NSQ19VUklb
c2hhMjU2c3VtXSA9DQo+ICJkYWQzOThjY2Q1YjlmYWNhNmIwYWIyMTlhMDM2
NDUzZjYyYTYwMmE1NjIwM2FjNjU5YjQzZTg4OWJlYzM1NTMzIg0KPiANCj4g
IGluaGVyaXQgcHRlc3QNCj4gDQo+IC0tDQo+IDIuNy40DQoNCgoK

