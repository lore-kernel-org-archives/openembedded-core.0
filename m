Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Jan 2020 07:30:45 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8307FFAA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 07:30:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 23:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; d="scan'208";a="427322672"
Received: from pgsmsx108.gar.corp.intel.com ([10.221.44.103])
	by fmsmga006.fm.intel.com with ESMTP; 21 Jan 2020 23:23:39 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.131]) by
	PGSMSX108.gar.corp.intel.com ([169.254.8.76]) with mapi id
	14.03.0439.000; Wed, 22 Jan 2020 15:23:37 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "wangmy@cn.fujitsu.com"
	<wangmy@cn.fujitsu.com>
Thread-Topic: [OE-core]  [PATCH] libtirpc: upgrade 1.1.4 -> 1.2.5
Thread-Index: AQHVz3HszDcjqPypXkuzzrBJUd8TA6f1xLmA
Date: Wed, 22 Jan 2020 07:23:37 +0000
Message-ID: <af2e4d6e0c808505541c49d657734ee61c19a577.camel@intel.com>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
	<1579523214-47426-10-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1579523214-47426-10-git-send-email-wangmy@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.17.19]
MIME-Version: 1.0
Subject: Re: [PATCH] libtirpc: upgrade 1.1.4 -> 1.2.5
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
X-List-Received-Date: Wed, 22 Jan 2020 07:30:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AED3358DC696046BF23DDF762707BC1@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIwLTAxLTIwIGF0IDA0OjI2IC0wODAwLCBXYW5nIE1pbmd5dSB3cm90ZToNCj4g
UmVmcmVzaCB0aGUgZm9sbG93aW5nIHBhdGNoOg0KPiBtdXNsLnBhdGNoDQoNCkNhbiB5b3UgcGxl
YXNlIHJlbW92ZSB0aGlzIHBhdGNoIGVudGlyZWx5IGFuZCBiYWNrcG9ydCBhIHBhdGNoIGZyb20N
CnVwc3RyZWFtIHRoYXQgZml4ZXMgdGhlIHJlbWFpbmluZyBpc3N1ZSBpbiB0aGlzIHBhdGNoOg0K
DQpodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wL2xpYnRpcnBjL21haWxtYW4vbWVzc2FnZS8zNjkw
NTcxMi8NCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWlu
Z3l1IDx3YW5nbXlAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYnRpcnBjL2xpYnRpcnBjL211c2wucGF0Y2ggICAgfCAxMSAtLS0tLS0tDQo+IC0tLS0N
Cj4gIC4uLi9saWJ0aXJwYy97bGlidGlycGNfMS4xLjQuYmIgPT4gbGlidGlycGNfMS4yLjUuYmJ9
IHwgIDQgKystLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQ0KPiAgcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy97bGlidGly
cGNfMS4xLjQuYmIgPT4NCj4gbGlidGlycGNfMS4yLjUuYmJ9ICg4NiUpDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjL211c2wucGF0Y2gN
Cj4gYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMvbGlidGlycGMvbXVzbC5wYXRjaA0K
PiBpbmRleCAyMWNkOWY5NTg4Li5mOWFkMzVhODUyIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbGlidGlycGMvbGlidGlycGMvbXVzbC5wYXRjaA0KPiArKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGlidGlycGMvbGlidGlycGMvbXVzbC5wYXRjaA0KPiBAQCAtNiwxNyAr
Niw2IEBAIGJpdHMvZW5kaWFuLmggaXMgbm90IHN1cHBvc2VkIHRvIGJlIGluY2x1ZGVkDQo+IGRp
cmVjdGx5DQo+ICBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcNCj4gIFNpZ25lZC1vZmYtYnk6IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+ICANCj4gLS0tLSBhL3RpcnBjL3JwYy90eXBl
cy5oDQo+IC0rKysgYi90aXJwYy9ycGMvdHlwZXMuaA0KPiAtQEAgLTY2LDcgKzY2LDcgQEAgdHlw
ZWRlZiAgIGludDMyX3QgcnBjX2lubGluZV90Ow0KPiAtICNkZWZpbmUgbWVtX2ZyZWUocHRyLCBi
c2l6ZSkJZnJlZShwdHIpDQo+IC0gDQo+IC0gDQo+IC0tI2lmIGRlZmluZWQgX19BUFBMRV9DQ19f
IHx8IGRlZmluZWQgX19GcmVlQlNEX18NCj4gLSsjaWYgZGVmaW5lZCBfX0FQUExFX0NDX18gfHwg
ZGVmaW5lZCBfX0ZyZWVCU0RfXyB8fA0KPiAhZGVmaW5lZChfX0dMSUJDX18pDQo+IC0gIyBkZWZp
bmUgX191X2NoYXJfZGVmaW5lZA0KPiAtICMgZGVmaW5lIF9fZGFkZHJfdF9kZWZpbmVkDQo+IC0g
I2VuZGlmDQo+ICAtLS0gYS9zcmMveGRyX2Zsb2F0LmMNCj4gICsrKyBiL3NyYy94ZHJfZmxvYXQu
Yw0KPiAgQEAgLTgzLDcgKzgzLDcgQEAgc3RhdGljIHN0cnVjdCBzZ2xfbGltaXRzIHsNCj4gZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwY18xLjEuNC5i
Yg0KPiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwY18xLjIuNS5iYg0K
PiBzaW1pbGFyaXR5IGluZGV4IDg2JQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbGlidGlycGMvbGlidGlycGNfMS4xLjQuYmINCj4gcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwY18xLjIuNS5iYg0KPiBpbmRleCA1M2VkNWU4MWY3Li4w
MzU3ODdjM2Y4IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMv
bGlidGlycGNfMS4xLjQuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBj
L2xpYnRpcnBjXzEuMi41LmJiDQo+IEBAIC0xNCw4ICsxNCw4IEBAIFNSQ19VUkkgPQ0KPiAiJHtT
T1VSQ0VGT1JHRV9NSVJST1J9LyR7QlBOfS8ke0JQfS50YXIuYnoyIFwNCj4gICAgICAgICAgICAg
Ig0KPiAgVVBTVFJFQU1fQ0hFQ0tfVVJJID0gIg0KPiBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9w
cm9qZWN0cy9saWJ0aXJwYy9maWxlcy9saWJ0aXJwYy8iDQo+ICBVUFNUUkVBTV9DSEVDS19SRUdF
WCA9ICIoP1A8cHZlcj5cZCsoXC5cZCspKykvIg0KPiAtU1JDX1VSSVttZDVzdW1dID0gImY1ZDJh
NjIzZTlkZmJkODE4ZDJmM2YzYTRhODc4ZTNhIg0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4g
IjJjYTUyOWYwMjI5MmUxMGMxNTg1NjIyOTVhMWZmZDk1ZDJjZThhZjk3ODIwZTM1MzRmZTFiMGUz
YWVjNzU2MWQiDQo+ICtTUkNfVVJJW21kNXN1bV0gPSAiNjg4Nzg3ZGRmZjdjNmE5MmVmMTVhZTNm
NWRjNGRmYTEiDQo+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiZjNiNjM1MGM3ZTljM2NkOWM1
OGZjN2E1ZTVmOGU2YmU0NjljYzU3MWJiNWViMzFlYjk3OTBiM2U2NzUxODZjYSINCj4gIA0KPiAg
aW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnDQo+ICANCj4gLS0gDQo+IDIuMTcuMQ0KPiANCj4g
DQo+IA0K

