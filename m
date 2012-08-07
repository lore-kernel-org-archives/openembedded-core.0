Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1Syoog-0002kf-P4
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 20:47:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q77IZsuY005868
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Aug 2012 11:35:54 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Tue, 7 Aug 2012 11:35:55 -0700
Message-ID: <50216009.6020601@windriver.com>
Date: Tue, 7 Aug 2012 14:35:53 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
	<502152B8.6070100@gmail.com> <50215ED9.3070505@windriver.com>
	<1344364223.4874.16.camel@x121e.pbcl.net>
In-Reply-To: <1344364223.4874.16.camel@x121e.pbcl.net>
X-Originating-IP: [128.224.147.210]
X-MIME-Autoconverted: from 8bit to base64 by mail1.windriver.com id
	q77IZsuY005868
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 18:47:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: base64

T24gMTItMDgtMDcgMDI6MzAgUE0sIFBoaWwgQmx1bmRlbGwgd3JvdGU6DQo+IE9uIFR1ZSwg
MjAxMi0wOC0wNyBhdCAxNDozMCAtMDQwMCwgWWFvIFpoYW8gd3JvdGU6DQo+PiBPbiAxMi0w
OC0wNyAwMTozOSBQTSwgRGVyZWsgQnVpdGVuaHVpcyB3cm90ZToNCj4+PiBPbiAwNy8wOC8y
MDEyIDE6MzEgUE0sIFlhbyBaaGFvIHdyb3RlOg0KPj4+PiBJbiBvcmRlciB0byBmaXggdGhl
IFFBIElzc3VlIGZvciBsaWJwYW0gd2hpY2ggaW5zdGFsbGVkIHRvIC9saWIgYnV0DQo+Pj4+
IHJlZmVyZW5jZSAvdXNyL2xpYnh4L2xpYnogYW5kIGxpYmNyYWNrLCBpbnN0YWxsIGxpYnog
YW5kIGxpYmNyYWNrDQo+Pj4+IHRvIC9saWIuDQo+Pj4gT3BlbkJTRCBwdXRzIGxpYnBhbS5z
byBpbiAvbGliLCBzbyBpdCBzZWVtcyBrb3NoZXIuLi4NCj4+Pg0KPj4+PiAgICBkb19pbnN0
YWxsKCkgew0KPj4+PiAtCW9lX3J1bm1ha2UgREVTVERJUj0ke0R9IGluc3RhbGwNCj4+Pj4g
KwkjbGliei5hIGluc3RhbGxzIHRvIGxpYmRpciwgb3ZlcndyaXRlIHRoZSBlbnYgbGliZGly
DQo+Pj4+ICsJI2luc3RhbGwgcGtnY29uZmlnIHRvIGVudiBsaWJkaXIvcGtnY29uZmlnDQo+
Pj4+ICsJb2VfcnVubWFrZSBERVNURElSPSR7RH0gcGtnY29uZmlnZGlyPSIke2xpYmRpcn0v
cGtnY29uZmlnIiBcDQo+Pj4+ICsJCSAgIGxpYmRpcj0iJHtiYXNlX2xpYmRpcn0iIGluc3Rh
bGwNCj4+Pj4gICAgfQ0KPj4+IElmIHlvdSdyZSBzcGVjaWZ5aW5nIC0tbGliZGlyIHdoZW4g
Y29uZmlndXJpbmcsIHdoeSBkbyB5b3UgbmVlZA0KPj4+IGxpYmRpciBkdXJpbmcgbWFrZSwg
YXMgd2VsbD8NCj4+IHpsaWIgaXMgbm90IHVzaW5nIGF1dG90b29scyBhbHRob3VnaCBpdCBo
YXMgY29uZmlndXJlLg0KPj4gd2hlbiBpbnN0YWxsLCBvZV9ydW5tYWtlIHdpbGwgYmUgbWFr
ZSAtZSBzbyBNYWtlZmlsZSB3aWxsIGFsd2F5cyB1c2UNCj4+IGVudidzIGxpYmRpciB3aGlj
aCBpcyB0aGUgdXNyL2xpYnh4LCB3ZSBoYXZlIHRvIG92ZXJ3cml0ZSBpdCB3aGVuIGluc3Rh
bGwuDQo+IFdoZXJlIGRvIGxpYnouYSBhbmQgbGliei5zbyBlbmQgdXAgYWZ0ZXIgeW91ciBw
YXRjaD8NCnBhY2thZ2VzLXNwbGl0JCB0cmVlDQouDQrilJzilIDilIAgemxpYg0K4pSCIOKU
lOKUgOKUgCBsaWINCuKUgiDilJzilIDilIAgbGliei5zby4xIC0+IGxpYnouc28uMS4yLjcN
CuKUgiDilJTilIDilIAgbGliei5zby4xLjIuNw0K4pSc4pSA4pSAIHpsaWItZGJnDQrilIIg
4pSc4pSA4pSAIGxpYg0K4pSCIOKUlOKUgOKUgCB1c3INCuKUgiDilJTilIDilIAgc3JjDQri
lIIg4pSU4pSA4pSAIGRlYnVnDQrilIIg4pSU4pSA4pSAIHpsaWItMS4yLjctcjANCuKUgiDi
lJTilIDilIAgemxpYi0xLjIuNw0K4pSCIOKUnOKUgOKUgCBhZGxlcjMyLmMNCuKUgiDilJzi
lIDilIAgY29tcHJlc3MuYw0K4pSCIOKUnOKUgOKUgCBjcmMzMi5jDQrilIIg4pSc4pSA4pSA
IGNyYzMyLmgNCuKUgiDilJzilIDilIAgZGVmbGF0ZS5jDQrilIIg4pSc4pSA4pSAIGRlZmxh
dGUuaA0K4pSCIOKUnOKUgOKUgCBnemNsb3NlLmMNCuKUgiDilJzilIDilIAgZ3pndXRzLmgN
CuKUgiDilJzilIDilIAgZ3psaWIuYw0K4pSCIOKUnOKUgOKUgCBnenJlYWQuYw0K4pSCIOKU
nOKUgOKUgCBnendyaXRlLmMNCuKUgiDilJzilIDilIAgaW5mYmFjay5jDQrilIIg4pSc4pSA
4pSAIGluZmZhc3QuYw0K4pSCIOKUnOKUgOKUgCBpbmZmYXN0LmgNCuKUgiDilJzilIDilIAg
aW5mZml4ZWQuaA0K4pSCIOKUnOKUgOKUgCBpbmZsYXRlLmMNCuKUgiDilJzilIDilIAgaW5m
bGF0ZS5oDQrilIIg4pSc4pSA4pSAIGluZnRyZWVzLmMNCuKUgiDilJzilIDilIAgaW5mdHJl
ZXMuaA0K4pSCIOKUnOKUgOKUgCB0cmVlcy5jDQrilIIg4pSc4pSA4pSAIHRyZWVzLmgNCuKU
giDilJzilIDilIAgdW5jb21wci5jDQrilIIg4pSc4pSA4pSAIHpjb25mLmgNCuKUgiDilJzi
lIDilIAgemxpYi5oDQrilIIg4pSc4pSA4pSAIHp1dGlsLmMNCuKUgiDilJTilIDilIAgenV0
aWwuaA0K4pSc4pSA4pSAIHpsaWItZGV2DQrilIIg4pSc4pSA4pSAIGxpYg0K4pSCIOKUgiDi
lJTilIDilIAgbGliei5zbyAtPiBsaWJ6LnNvLjEuMi43DQrilIIg4pSU4pSA4pSAIHVzcg0K
4pSCIOKUnOKUgOKUgCBpbmNsdWRlDQrilIIg4pSCIOKUnOKUgOKUgCB6Y29uZi5oDQrilIIg
4pSCIOKUlOKUgOKUgCB6bGliLmgNCuKUgiDilJTilIDilIAgbGliDQrilIIg4pSU4pSA4pSA
IHBrZ2NvbmZpZw0K4pSCIOKUlOKUgOKUgCB6bGliLnBjDQrilJzilIDilIAgemxpYi1kb2MN
CuKUgiDilJTilIDilIAgdXNyDQrilIIg4pSU4pSA4pSAIHNoYXJlDQrilIIg4pSU4pSA4pSA
IG1hbg0K4pSCIOKUlOKUgOKUgCBtYW4zDQrilIIg4pSU4pSA4pSAIHpsaWIuMw0K4pSc4pSA
4pSAIHpsaWItbG9jYWxlDQrilJzilIDilIAgemxpYi5zaGxpYmRlcHMNCuKUlOKUgOKUgCB6
bGliLXN0YXRpY2Rldg0K4pSU4pSA4pSAIGxpYg0K4pSU4pSA4pSAIGxpYnouYQ0KDQpjcmFj
a2xpYg0K4pSc4pSA4pSAIGxpYg0K4pSCIOKUnOKUgOKUgCBsaWJjcmFjay5zby4yIC0+IGxp
YmNyYWNrLnNvLjIuOC4xDQrilIIg4pSU4pSA4pSAIGxpYmNyYWNrLnNvLjIuOC4xDQrilJTi
lIDilIAgdXNyDQrilJzilIDilIAgc2Jpbg0K4pSCIOKUnOKUgOKUgCBjcmFja2xpYi1jaGVj
aw0K4pSCIOKUnOKUgOKUgCBjcmFja2xpYi1mb3JtYXQNCuKUgiDilJzilIDilIAgY3JhY2ts
aWItcGFja2VyDQrilIIg4pSc4pSA4pSAIGNyYWNrbGliLXVucGFja2VyDQrilIIg4pSU4pSA
4pSAIGNyZWF0ZS1jcmFja2xpYi1kaWN0DQrilJTilIDilIAgc2hhcmUNCuKUlOKUgOKUgCBj
cmFja2xpYg0K4pSc4pSA4pSAIGNyYWNrbGliLm1hZ2ljDQrilJTilIDilIAgY3JhY2tsaWIt
c21hbGwNCmNyYWNrbGliLXN0YXRpY2Rldi8NCuKUlOKUgOKUgCBsaWINCuKUlOKUgOKUgCBs
aWJjcmFjay5hDQoNCnVzci9zYmluLyogcmVmZXJlbmNlIGxpYiBzaG91bGQgYmUgZmluZSwg
c28gSSBkaWRuJ3QgY2hhbmdlIHRoYXQgcGFydC4NCg0KeWFvDQo+IHAuDQo+DQo+DQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IE9wZW5l
bWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5saW51eHRvZ28ub3JnL2NnaS1iaW4v
bWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0KDQoNCg==


