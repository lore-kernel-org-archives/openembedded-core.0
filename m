Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5E57D744
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 11:16:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,357,1549900800"; d="scan'208";a="59438126"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Apr 2019 19:16:47 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 7A8314CD80C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 19:16:44 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Tue, 16 Apr 2019 19:16:49 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] dnf: Enable nativesdk
Thread-Index: AQHU8briPCTAp9HdGUWwMDUYh/3paqY+p/eA
Date: Tue, 16 Apr 2019 11:16:48 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C13A5C@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166150-57588-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1555166150-57588-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 7A8314CD80C7.A7453
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH v2] dnf: Enable nativesdk
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
X-List-Received-Date: Tue, 16 Apr 2019 11:16:48 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UGluZw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFpoZW5nLCBSdW9xaW4v1qMgyPTH1Q0KPiBTZW50OiBTYXR1
cmRheSwgQXByaWwgMTMsIDIwMTkgMTA6MzYgUE0NCj4gVG86IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IFpoZW5n
LCBSdW9xaW4v1qMgyPTH1SA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29t
Pg0KPiBTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIIHYyXSBkbmY6IEVuYWJs
ZSBuYXRpdmVzZGsNCj4gDQo+IE1ha2UgZG5mIHdvcmsgb24gbmF0aXZlc2Rr
IGVudmlyb25tZW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVv
cWluIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xLjAuYmIgfCAxMCAr
KysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xLjAuYmIgYi9tZXRhL3JlY2lwZXMt
DQo+IGRldnRvb2xzL2RuZi9kbmZfNC4xLjAuYmINCj4gaW5kZXggZDQ1MDIz
ZS4uOGI0MjkxYSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi9kbmZfNC4xLjAuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmZfNC4xLjAuYmINCj4gQEAgLTI2LDcgKzI2LDcgQEAg
RVhUUkFfT0VDTUFLRSA9ICIgLURXSVRIX01BTj0wIC0NCj4gRFBZVEhPTl9J
TlNUQUxMX0RJUj0ke1BZVEhPTl9TSVRFUEFDS0FHRVNfRElSfSAtDQo+IA0K
PiAgQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIg0KPiANCj4g
LVJERVBFTkRTXyR7UE59X2NsYXNzLXRhcmdldCArPSAiIFwNCj4gK1JERVBF
TkRTXyR7UE59ICs9ICIgXA0KPiAgICBweXRob24zLWNvcmUgXA0KPiAgICBw
eXRob24zLWNvZGVjcyBcDQo+ICAgIHB5dGhvbjMtbmV0Y2xpZW50IFwNCj4g
QEAgLTQ5LDYgKzQ5LDggQEAgUkRFUEVORFNfJHtQTn1fY2xhc3MtdGFyZ2V0
ICs9ICIgXA0KPiAgICBweXRob24zLWdwZyBcDQo+ICAgICINCj4gDQo+ICtS
REVQRU5EU18ke1BOfV9jbGFzcy1uYXRpdmUgPSAiIg0KPiArDQo+ICBSUkVD
T01NRU5EU18ke1BOfV9jbGFzcy10YXJnZXQgKz0gImdudXBnIg0KPiANCj4g
ICMgQ3JlYXRlIGEgc3ltbGluayBjYWxsZWQgJ2RuZicgYXMgJ21ha2UgaW5z
dGFsbCcgZG9lcyBub3QgZG8gaXQsIGJ1dCBAQCAtNjYsNg0KPiArNjgsMTIg
QEAgZG9faW5zdGFsbF9hcHBlbmRfY2xhc3MtbmF0aXZlKCkgew0KPiAgICAg
ICAgICAgICAgICAgIFJQTV9OT19DSFJPT1RfRk9SX1NDUklQVFM9MSAgfQ0K
PiANCj4gK2RvX2luc3RhbGxfYXBwZW5kX2NsYXNzLW5hdGl2ZXNkaygpIHsN
Cj4gKyAgICAgICAgY3JlYXRlX3dyYXBwZXIgJHtEfS8ke2JpbmRpcn0vZG5m
IFwNCj4gKyAgICAgICAgICAgICAgICBSUE1fQ09ORklHRElSPSR7U0RLUEFU
SE5BVElWRX0ke2xpYmRpcl9uYXRpdmVzZGt9L3JwbSBcDQo+ICsgICAgICAg
ICAgICAgICAgUlBNX05PX0NIUk9PVF9GT1JfU0NSSVBUUz0xIH0NCj4gKw0K
PiAgU1lTVEVNRF9TRVJWSUNFXyR7UE59ID0gImRuZi1tYWtlY2FjaGUuc2Vy
dmljZSBkbmYtbWFrZWNhY2hlLnRpbWVyIFwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICBkbmYtYXV0b21hdGljLnNlcnZpY2UgZG5mLWF1dG9tYXRp
Yy50aW1lciBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZG5mLWF1
dG9tYXRpYy1kb3dubG9hZC5zZXJ2aWNlIGRuZi1hdXRvbWF0aWMtZG93bmxv
YWQudGltZXIgXA0KPiAtLQ0KPiAxLjguMy4xDQoNCgoK

