Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF4A6022F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 01:36:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="11228854"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Sep 2016 09:36:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3CDC04623479
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 09:36:18 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0279.002; Thu, 22 Sep 2016 09:36:17 +0800
From: "Wang, Xin" <wangxin2015.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v4] bind: 9.10.3-P3 -> 9.11.0b2
Thread-Index: AQHR/0eVk+eFe55cTkubntQ1QUi8xaCE5NdQ
Date: Thu, 22 Sep 2016 01:36:16 +0000
Message-ID: <C43D7C6FFC265C429F44FEB1C68F1B25633E16F5@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <CAJTo0LZaZj0CdXQAivEqyBQusc4HT54u6_0x943G58XQy-6wiA@mail.gmail.com>
	<1472181104-1867-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
In-Reply-To: <1472181104-1867-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.120]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 3CDC04623479.ACC53
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH v4] bind: 9.10.3-P3 -> 9.11.0b2
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
X-List-Received-Date: Thu, 22 Sep 2016 01:36:19 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogV2Fu
ZywgWGluL831IPbOIA0KU2VudDogRnJpZGF5LCBBdWd1c3QgMjYsIDIwMTYg
MTE6MTIgQU0NClRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQpDYzogV2FuZywgWGluL831IPbODQpTdWJqZWN0OiBbT0Ut
Y29yZV1bUEFUQ0ggdjRdIGJpbmQ6IDkuMTAuMy1QMyAtPiA5LjExLjBiMg0K
DQoxKSBVcGdyYWRlIGJpbmQgZnJvbSA5LjEwLjMtUDMgdG8gOS4xMS4wYjIu
DQoyKSBEZWxldGUgc29tZSBwYXRjaGVycywgc2luY2UgdGhleSBhcmUgbm8g
dXNlLg0KICAgIGJpbmQtY29uZmdlbi1idWlsZC11bml4Lm8tb25jZS5wYXRj
aA0KICAgIENWRS0yMDE2LTEyODUucGF0Y2gNCiAgICBDVkUtMjAxNi0xMjg2
XzEucGF0Y2gNCiAgICBDVkUtMjAxNi0xMjg2XzIucGF0Y2gNCiAgICBDVkUt
MjAxNi0yMDg4LnBhdGNoDQozKSBNb2RpZnkgTElDX0ZJTEVTX0NIS1NVTSwg
c2luY2UgdGhlIGRhdGUgaW4gaXQgaGFzIGJlZW4gY2hhbmdlZCwgQnV0IHRo
ZSBMSUNFTlNFIGhhcyBub3QgYmVlbiBjaGFuZ2VkLg0KNCkgTW9kaWZ5IEVY
VFJBX09FQ09ORiwgZW5hYmxlIHB5dGhvbjMuDQo1KSBNb2RpZnkgZG9faW5z
dGFsbF9hcHBlbmQoKSwgc2luY2UgdGhlIGRhdGEgaGFzIGNoYW5nZWQuDQoN
ClNpZ25lZC1vZmYtYnk6IFdhbmcgWGluIDx3YW5neGluMjAxNS5mbnN0QGNu
LmZ1aml0c3UuY29tPg0KLS0tDQogLi4uL2JpbmQve2JpbmRfOS4xMC4zLVAz
LmJiID0+IGJpbmRfOS4xMS4wYjIuYmJ9ICAgICAgICAgfCAxNiArKysrKy0t
LS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pICByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL3tiaW5kXzkuMTAuMy1QMy5iYiA9PiBiaW5kXzkuMTEuMGIy
LmJifSAoODMlKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmRfOS4xMC4zLVAzLmJiIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xMS4wYjIuYmINCnNpbWlsYXJp
dHkgaW5kZXggODMlDQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2JpbmQvYmluZF85LjEwLjMtUDMuYmINCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjExLjBiMi5iYg0K
aW5kZXggYTk5ZjBkZC4uNDkxOWRlNyAxMDA2NDQNCi0tLSBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMTAuMy1QMy5iYg0KKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4xMS4w
YjIuYmINCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vd3d3
LmlzYy5vcmcvc3cvYmluZC8iDQogU0VDVElPTiA9ICJjb25zb2xlL25ldHdv
cmsiDQogDQogTElDRU5TRSA9ICJJU0MgJiBCU0QiDQotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWVJJR0hUO21kNT0wYTk1ZjUyYTBhYjZjNWY1
MmRlZGM5YTQ1ZTdhYmIzZiINCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZUklHSFQ7bWQ1PTI2ODk1YjZiMmUxMTY5NWZiNDc1NjA2NWI4ODVk
NWQ5Ig0KIA0KIERFUEVORFMgPSAib3BlbnNzbCBsaWJjYXAiDQogDQpAQCAt
MTYsMjIgKzE2LDE3IEBAIFNSQ19VUkkgPSAiZnRwOi8vZnRwLmlzYy5vcmcv
aXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIuZ3ogXA0KICAgICAg
ICAgICAgZmlsZTovL25hbWVkLnNlcnZpY2UgXA0KICAgICAgICAgICAgZmls
ZTovL2JpbmQ5IFwNCiAgICAgICAgICAgIGZpbGU6Ly9pbml0LmQtYWRkLXN1
cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggXA0KLSAgICAgICAg
ICAgZmlsZTovL2JpbmQtY29uZmdlbi1idWlsZC11bml4Lm8tb25jZS5wYXRj
aCBcDQogICAgICAgICAgICBmaWxlOi8vMDAwMS1idWlsZC11c2UtcGtnLWNv
bmZpZy10by1maW5kLWxpYnhtbDIucGF0Y2ggXA0KICAgICAgICAgICAgZmls
ZTovL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNl
YXJjaGVzLXN5c3IucGF0Y2ggXA0KICAgICAgICAgICAgZmlsZTovLzAwMDEt
Z2VuLmMtZXh0ZW5kLURJUk5BTUVTSVpFLWZyb20tMjU2LXRvLTUxMi5wYXRj
aCBcDQogICAgICAgICAgICBmaWxlOi8vMDAwMS1saWItZG5zLWdlbi5jLWZp
eC10b28tbG9uZy1lcnJvci5wYXRjaCBcDQotICAgICAgICAgICBmaWxlOi8v
Q1ZFLTIwMTYtMTI4NS5wYXRjaCBcDQotICAgICAgICAgICBmaWxlOi8vQ1ZF
LTIwMTYtMTI4Nl8xLnBhdGNoIFwNCi0gICAgICAgICAgIGZpbGU6Ly9DVkUt
MjAxNi0xMjg2XzIucGF0Y2ggXA0KLSAgICAgICAgICAgZmlsZTovL0NWRS0y
MDE2LTIwODgucGF0Y2ggXA0KICAgICAgICAgICAgIg0KIA0KLVNSQ19VUklb
bWQ1c3VtXSA9ICJiY2Y3ZTc3MmI2MTZmNzI1OTQyMGEzZWRjNWRmMzUwYSIN
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjkwODEwZDFmYmI3MmFmYTYyOWU3
NDYzOGQxOWNkNDRlMjhkMmIyZTVlYjYzZjU1YzcwNWFkODVkMWE0Y2I4MyIN
CitTUkNfVVJJW21kNXN1bV0gPSAiMzBkYjY1MmJhYTVjMjI3YTYxZjhmNGNh
OWI3YWQ5YzIiDQorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ0MGU3ZmE3YzRl
MjQxYzEzMDI4Njk5YWIxMDdmYzRjM2VmZDE3MTkwMTJiMWFmMzU2ZDM5ZGI1
YWI0OTEwOWQiDQogDQogRU5BQkxFX0lQVjYgPSAiLS1lbmFibGUtaXB2Nj0k
e0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYn
LCAneWVzJywgJ25vJywgZCl9Ig0KLUVYVFJBX09FQ09ORiA9ICIgJHtFTkFC
TEVfSVBWNn0gLS13aXRoLXJhbmRvbWRldj0vZGV2L3JhbmRvbSAtLWRpc2Fi
bGUtdGhyZWFkcyBcDQorRVhUUkFfT0VDT05GID0gIiAke0VOQUJMRV9JUFY2
fSAtLXdpdGgtcHl0aG9uPXB5dGhvbjMgDQorLS13aXRoLXJhbmRvbWRldj0v
ZGV2L3JhbmRvbSAtLWRpc2FibGUtdGhyZWFkcyBcDQogICAgICAgICAgICAg
ICAgICAtLWRpc2FibGUtZGV2cG9sbCAtLWRpc2FibGUtZXBvbGwgLS13aXRo
LWdvc3Q9bm8gXA0KICAgICAgICAgICAgICAgICAgLS13aXRoLWdzc2FwaT1u
byAtLXdpdGgtZWNkc2E9eWVzIFwNCiAgICAgICAgICAgICAgICAgIC0tc3lz
Y29uZmRpcj0ke3N5c2NvbmZkaXJ9L2JpbmQgXCBAQCAtNjIsNyArNTcsNyBA
QCBSREVQRU5EU18ke1BOfS1kZXYgPSAiIg0KIFBBQ0tBR0VfQkVGT1JFX1BO
ICs9ICIke1BOfS11dGlscyINCiBGSUxFU18ke1BOfS11dGlscyA9ICIke2Jp
bmRpcn0vaG9zdCAke2JpbmRpcn0vZGlnIg0KIEZJTEVTXyR7UE59LWRldiAr
PSAiJHtiaW5kaXJ9L2lzYy1jb25maWcuaCINCi1GSUxFU18ke1BOfSArPSAi
JHtzYmluZGlyfS9nZW5lcmF0ZS1ybmRjLWtleS5zaCINCitGSUxFU18ke1BO
fSArPSAiJHtzYmluZGlyfS9nZW5lcmF0ZS1ybmRjLWtleS5zaCAke2xpYmRp
cn0vKiINCiANCiBkb19pbnN0YWxsX3ByZXBlbmQoKSB7DQogCSMgY2xlYW4g
aG9zdCBwYXRoIGluIGlzYy1jb25maWcuc2ggYmVmb3JlIHRoZSBoYXJkbGlu
ayBjcmVhdGVkIEBAIC04MSw3ICs3Niw2IEBAIGRvX2luc3RhbGxfYXBwZW5k
KCkgew0KIAlpbnN0YWxsIC1kICIke0R9JHtzeXNjb25mZGlyfS9pbml0LmQi
DQogCWluc3RhbGwgLW0gNjQ0ICR7U30vY29uZi8qICIke0R9JHtzeXNjb25m
ZGlyfS9iaW5kLyINCiAJaW5zdGFsbCAtbSA3NTUgIiR7U30vaW5pdC5kIiAi
JHtEfSR7c3lzY29uZmRpcn0vaW5pdC5kL2JpbmQiDQotCXNlZCAtaSAtZSAn
MXMsIyEuKnB5dGhvbiwjISAvdXNyL2Jpbi9weXRob24zLCcgJHtEfSR7c2Jp
bmRpcn0vZG5zc2VjLWNvdmVyYWdlICR7RH0ke3NiaW5kaXJ9L2Ruc3NlYy1j
aGVja2RzDQogDQogCSMgSW5zdGFsbCBzeXN0ZW1kIHJlbGF0ZWQgZmlsZXMN
CiAJaW5zdGFsbCAtZCAke0R9JHtzYmluZGlyfQ0KLS0NCjIuNy40DQoNCgoK

