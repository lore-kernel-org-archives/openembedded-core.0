Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D182860017
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 05:14:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97310521"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2015 13:18:36 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5J5Cpbo031763
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 13:12:52 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Fri, 19 Jun 2015 13:14:28 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v4 0/3] These patches aim to make the spdx file be
	compliant with the SPDX 1.2 Specification.
Thread-Index: AQHQo2WAF5RK7vRO10izvmzFSTmxy52zVqWA
Date: Fri, 19 Jun 2015 05:14:29 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDB26B8C@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1433930954-31813-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1433930954-31813-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.26]
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] These patches aim to make the spdx file be compliant with the SPDX 1.2 Specification.
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
X-List-Received-Date: Fri, 19 Jun 2015 05:14:31 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

DQpwaW5nDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVpLCBNYW9o
dWkNCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDEwLCAyMDE1IDY6MDkgUE0NCj4gVG86IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IExlaSwgTWFvaHVpDQo+
IFN1YmplY3Q6IFtQQVRDSCB2NCAwLzNdIFRoZXNlIHBhdGNoZXMgYWltIHRvIG1ha2UgdGhlIHNw
ZHggZmlsZSBiZSBjb21wbGlhbnQgd2l0aCB0aGUNCj4gU1BEWCAxLjIgU3BlY2lmaWNhdGlvbi4N
Cj4gDQo+IFRob3NlIHBhdGNoZXMgYWltIHRvIG1ha2UgdGhlIHNwZHggZmlsZSBiZSBjb21wbGlh
bnQgd2l0aCB0aGUgU1BEWCAxLjIgU3BlY2lmaWNhdGlvbi4NCj4gSWYgeW91IHdhbnQgdG8gdXNl
IHRoaXMgZmVhdHVyZSx5b3UgbmVlZCB0byBkbzoNCj4gMS4gTWFrZSBzdXJlIHlvdXIgZm9zc29s
b2d5K3NwZHggc2VydmVyIHdvcmtzIHdlbGwuWW91IGNhbiBnZXQgc3BkeCBmaWxlIHdpdGggdGhl
DQo+IGZvbGxvd2luZyBjb21tYW5kLg0KPiAgICBjdXJsIGh0dHA6Ly8xMjcuMC4wLjEvcmVwby8g
LS1ub3Byb3h5IDEyNy4wLjAuMSAtayAtRiBtb2Q9c3BkeF9saWNlbnNlX29uY2UgLUYNCj4gbm9D
b3B5cmlnaHQ9ZmFsc2UNCj4gICAgLUYganNvbk91dHB1dD1mYWxzZSAtRiBmdWxsU1BEWEZsYWc9
dHJ1ZSAtRiBmaWxlPUB4eHgudGFyLmd6IC1vIHh4eC5zcGR4DQo+IA0KPiAyLiBBZGQgdGhlIGZv
bGxvd2luZyBJTkhFUklUIHN0YXRlbWVudCBhbmQgc2V0IHRoZSBTUERYX01BTklGRVNUX0RJUiBh
dCB0aGUgZW5kIG9mDQo+IHlvdXIgY29uZi9sb2NhbC5jb25mIGZpbGUgZm91bmQgaW4gdGhlIEJ1
aWxkIERpcmVjdG9yeS4NCj4gICAgSU5IRVJJVCArPSAic3BkeCINCj4gDQo+IA0KPiBMZWkgTWFv
aHVpICgzKToNCj4gICBsaWNlbnNlcy5jb25mOiBNb2RpZmllZCBwYXJhbWV0ZXJzIGZvciBuZXcg
c3BkeC5iYmNsYXNzDQo+ICAgc3BkeC5iYmNsYXNzOiBDcmVhdGUgdGhlIHNwZHggZmlsZSB3aGlj
aCBpcyBjb21wbGlhbnQgICAgICB3aXRoIFNQRFgNCj4gICAgIDEuMiBTcGVjaWZpY2F0aW9uDQo+
ICAgc3BkeDogY3JlYXRlIGEgZGlyZWN0b3J5IHRvIHNhdmUgc291cmNlIGNvZGUNCj4gDQo+ICBt
ZXRhL2NsYXNzZXMvc3BkeC5iYmNsYXNzIHwgNDMxICsrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIG1ldGEvY29uZi9saWNlbnNlcy5jb25mICAgfCAgODYg
KysrLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE4NCBpbnNlcnRpb25zKCspLCAzMzMgZGVs
ZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAxLjguNC4yDQoNCg==

