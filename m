Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0737D6B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 05:41:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2019 22:41:27 -0700
X-ExtLoop1: 1
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
	by fmsmga006.fm.intel.com with ESMTP; 12 Jun 2019 22:41:23 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.239]) by
	PGSMSX111.gar.corp.intel.com ([169.254.2.3]) with mapi id
	14.03.0415.000; Thu, 13 Jun 2019 13:41:21 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2 2/2] efibootmgr: add
Thread-Index: AQHVIV5/EIgpaDUJOE2Om3ZGZjVj/qaYjGcA
Date: Thu, 13 Jun 2019 05:41:21 +0000
Message-ID: <61ea1230ac110bc41dd1d9403cea23f7d7165dfc.camel@intel.com>
References: <20190612203536.32162-1-ross.burton@intel.com>
	<20190612203536.32162-2-ross.burton@intel.com>
In-Reply-To: <20190612203536.32162-2-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.145.100]
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] efibootmgr: add
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
X-List-Received-Date: Thu, 13 Jun 2019 05:41:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFD7E955E91A4B4AAA5482E1D5676387@intel.com>
Content-Transfer-Encoding: base64

VGhlc2Ugd291bGQgbmVlZCBhbiBlbnRyeSBpbiBtYWludGFpbmVycy5pbmMgYXMgd2VsbC4NCg0K
aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy81
Ni9idWlsZHMvNTE5L3N0ZXBzLzcvbG9ncy9zdGVwMmQNCg0KVGhhbmtzLA0KDQpBbnVqDQoNCk9u
IFdlZCwgMjAxOS0wNi0xMiBhdCAyMTozNSArMDEwMCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+IFRo
aXMgd2FzIGluIG1ldGEtb2UgYnV0IEVGSSBpcyBzdWZmaWNpZW50bHkgd2lkZXNwcmVhZCBub3cg
dGhhdCB3ZQ0KPiBuZWVkIGl0IGluDQo+IGNvcmUuDQo+IA0KPiBUaGUgcmVjaXBlIGlzIGJhc2Vk
IG9uIHRoZSBvbmUgaW4gbWV0YS1vZSBidXQgd2l0aCBzZXZlcmFsIHVwZGF0ZXMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIC4uLi9lZmlib290bWdyLzAwMDEtcmVtb3ZlLWV4dHJhLWRlY2wucGF0Y2ggICAgICAgIHwg
MzENCj4gKysrKysrKysrKysrKysrKysrKysNCj4gIG1ldGEvcmVjaXBlcy1ic3AvZWZpYm9vdG1n
ci9lZmlib290bWdyXzE3LmJiICAgICAgIHwgMzQNCj4gKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWJzcC9lZmlib290bWdyL2VmaWJvb3RtZ3IvMDAwMS0NCj4gcmVtb3Zl
LWV4dHJhLWRlY2wucGF0Y2gNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtYnNw
L2VmaWJvb3RtZ3IvZWZpYm9vdG1ncl8xNy5iYg0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ic3AvZWZpYm9vdG1nci9lZmlib290bWdyLzAwMDEtcmVtb3ZlLQ0KPiBleHRyYS1kZWNs
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWJzcC9lZmlib290bWdyL2VmaWJvb3RtZ3IvMDAwMS0NCj4g
cmVtb3ZlLWV4dHJhLWRlY2wucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXgg
MDAwMDAwMDAwMDAuLjQyZjNhODE4MmRmDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9y
ZWNpcGVzLWJzcC9lZmlib290bWdyL2VmaWJvb3RtZ3IvMDAwMS1yZW1vdmUtZXh0cmEtDQo+IGRl
Y2wucGF0Y2gNCj4gQEAgLTAsMCArMSwzMSBAQA0KPiArRnJvbSA5OWI1Nzg1MDE2NDMzNzdlMGIx
OTk0YjJhMDY4Yjc5MGQxODlkNWFkIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiArRnJv
bTogUGV0ZXIgSm9uZXMgPHBqb25lc0ByZWRoYXQuY29tPg0KPiArRGF0ZTogV2VkLCAxMyBKdW4g
MjAxOCAwOTo0MTowMSAtMDQwMA0KPiArU3ViamVjdDogW1BBVENIXSByZW1vdmUgZXh0cmEgZGVj
bA0KPiArDQo+ICtTaWduZWQtb2ZmLWJ5OiBQZXRlciBKb25lcyA8cGpvbmVzQHJlZGhhdC5jb20+
DQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gW2dpdDovL2dpdGh1Yi5jb20v
cmhpbnN0YWxsZXIvZWZpYm9vdG1nci5naXRdDQo+ICtTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlh
IDxob25neHUuamlhQHdpbmRyaXZlci5jb20+DQo+ICsNCj4gKy0tLQ0KPiArIHNyYy9lZmlib290
bWdyLmMgfCAzIC0tLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPiArDQo+
ICtkaWZmIC0tZ2l0IGEvc3JjL2VmaWJvb3RtZ3IuYyBiL3NyYy9lZmlib290bWdyLmMNCj4gK2lu
ZGV4IGRlMzhmMDEuLjRlMWE2ODAgMTAwNjQ0DQo+ICstLS0gYS9zcmMvZWZpYm9vdG1nci5jDQo+
ICsrKysgYi9zcmMvZWZpYm9vdG1nci5jDQo+ICtAQCAtMTUzNiw5ICsxNTM2LDYgQEAgcGFyc2Vf
b3B0cyhpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ICsgCQkJCQkgICAgICAgImludmFsaWQgbnVt
ZXJpYyB2YWx1ZQ0KPiAlc1xuIiwNCj4gKyAJCQkJCSAgICAgICBvcHRhcmcpOw0KPiArIAkJCX0N
Cj4gKy0gICAgICAgICAgICAgICAgICAgICAgICAvKiBYWFggZWZpdmFyLTM2IGFjY2lkZW50YWxs
eSBkb2Vzbid0IGhhdmUNCj4gYSBwdWJsaWMNCj4gKy0gICAgICAgICAgICAgICAgICAgICAgICAg
KiBoZWFkZXIgZm9yIHRoaXMgKi8NCj4gKy0JCQlleHRlcm4gaW50IGVmaV9zZXRfdmVyYm9zZShp
bnQgdmVyYm9zaXR5LCBGSUxFDQo+ICplcnJsb2cpOw0KPiArIAkJCWVmaV9zZXRfdmVyYm9zZShv
cHRzLnZlcmJvc2UgLSAyLCBzdGRlcnIpOw0KPiArIAkJCWJyZWFrOw0KPiArIAkJY2FzZSAnVic6
DQo+ICstLSANCj4gKzIuNy40DQo+ICsNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3Av
ZWZpYm9vdG1nci9lZmlib290bWdyXzE3LmJiDQo+IGIvbWV0YS9yZWNpcGVzLWJzcC9lZmlib290
bWdyL2VmaWJvb3RtZ3JfMTcuYmINCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAw
MDAwMDAwMDAuLjBlNWE4MWUzMTY2DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNp
cGVzLWJzcC9lZmlib290bWdyL2VmaWJvb3RtZ3JfMTcuYmINCj4gQEAgLTAsMCArMSwzNCBAQA0K
PiArREVTQ1JJUFRJT04gPSAiTGludXggdXNlci1zcGFjZSBhcHBsaWNhdGlvbiB0byBtb2RpZnkg
dGhlIEVGSSBCb290DQo+IE1hbmFnZXIuIg0KPiArU1VNTUFSWSA9ICJFRkkgQm9vdCBNYW5hZ2Vy
Ig0KPiArSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3JoYm9vdC9lZmlib290bWdyIg0K
PiArU0VDVElPTiA9ICJiYXNlIg0KPiArDQo+ICtMSUNFTlNFID0gIkdQTHYyKyINCj4gK0xJQ19G
SUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0NPUFlJTkc7bWQ1PTA2MzZlNzNmZjAyMTVlOGQ2NzJk
YzRjMzJjMzE3YmIzIg0KPiArDQo+ICtERVBFTkRTID0gImVmaXZhciBwb3B0Ig0KPiArDQo+ICtD
T01QQVRJQkxFX0hPU1QgPSAiKGkuODZ8eDg2XzY0fGFybXxhYXJjaDY0KS4qLWxpbnV4Ig0KPiAr
DQo+ICtTUkNfVVJJID0NCj4gImdpdDovL2dpdGh1Yi5jb20vcmhpbnN0YWxsZXIvZWZpYm9vdG1n
ci5naXQ7cHJvdG9jb2w9aHR0cHMgXA0KPiArICAgICAgICAgICBmaWxlOi8vMDAwMS1yZW1vdmUt
ZXh0cmEtZGVjbC5wYXRjaCBcDQo+ICsgICAgICAgICAgIg0KPiArU1JDUkVWID0gImUwNjcxNjBl
Y2VmODIwOGUxOTQ0MDAyZTVkNTBiMjc1NzMzMjExZmIiDQo+ICsNCj4gK1MgPSAiJHtXT1JLRElS
fS9naXQiDQo+ICsNCj4gK2luaGVyaXQgcGtnY29uZmlnDQo+ICsNCj4gKyMgVGhlIGRpcmVjdG9y
eSB1bmRlciB0aGUgRVNQIHRoYXQgdGhlIGRlZmF1bHQgYm9vdGxvYWRlciBpcyBmb3VuZA0KPiBp
bi4gIFdoZW4NCj4gKyMgd2ljIHVzZXMgYSBzdWJkaXJlY3RvcnksIHRoaXMgc2hvdWxkIHVzZSB0
aGUgc2FtZSBvbmUgdG9vLg0KPiArRUZJRElSID89ICIvIg0KPiArDQo+ICtFWFRSQV9PRU1BS0Ug
Kz0gIidFRklESVI9JHtFRklESVJ9JyINCj4gKw0KPiArQ0ZMQUdTICs9ICIgLVduby1lcnJvciIN
Cj4gKw0KPiArZG9faW5zdGFsbCAoKSB7DQo+ICsJb2VfcnVubWFrZSBpbnN0YWxsIERFU1RESVI9
IiR7RH0iDQo+ICt9DQo+ICsNCj4gK0NMRUFOQlJPS0VOID0gIjEiDQo+IC0tIA0KPiAyLjExLjAN
Cj4gDQoNCg==

