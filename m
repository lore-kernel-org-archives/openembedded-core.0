Return-Path: <steven.hung@mediatek.com>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Mar 2019 02:29:14 UTC
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
	by mail.openembedded.org (Postfix) with ESMTP id 950746D9AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 02:29:14 +0000 (UTC)
X-UUID: 895d8d1cd8ce4bd681afd0a66e323d44-20190311
X-UUID: 895d8d1cd8ce4bd681afd0a66e323d44-20190311
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
	(envelope-from <steven.hung@mediatek.com>)
	(mhqrelay.mediatek.com ESMTP with TLS)
	with ESMTP id 72269286; Mon, 11 Mar 2019 10:24:04 +0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
	mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 11 Mar 2019 10:24:03 +0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
	mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 11 Mar 2019 10:24:03 +0800
Received: from MTKMBS06N1.mediatek.inc ([fe80::893a:dede:6681:ca4b]) by
	mtkmbs06n1.mediatek.inc ([fe80::893a:dede:6681:ca4b%18]) with mapi id
	15.00.1395.000; Mon, 11 Mar 2019 10:24:03 +0800
From: =?big5?B?U3RldmVuIEh1bmcgKKx4pF+lySk=?= <Steven.Hung@mediatek.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/2] tune-cortexa35: fixed typo
Thread-Index: AdTXsX31u9NU5J0ZSfyTfB33I6Kbww==
Date: Mon, 11 Mar 2019 02:24:03 +0000
Message-ID: <7102ed84d0c7499880b302ce7c48e3af@mtkmbs06n1.mediatek.inc>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.21.101.239]
MIME-Version: 1.0
Subject: [PATCH 1/2] tune-cortexa35: fixed typo
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
X-List-Received-Date: Mon, 11 Mar 2019 02:29:15 -0000
Content-Language: zh-TW
Content-Transfer-Encoding: base64
Content-Type: multipart/related;
	boundary="__=_Part_Boundary_002_1515140917.592963786"

--__=_Part_Boundary_002_1515140917.592963786
Content-Transfer-Encoding: base64
Content-Type: multipart/alternative;
	boundary="__=_Part_Boundary_003_522389372.111415063"

--__=_Part_Boundary_003_522389372.111415063
Content-Type: text/html
Content-Transfer-Encoding: base64

PHByZT4NCiZxdW90O2NvcnRleGE1MyZxdW90OyYjMzI7LSZndDsmIzMyOyZxdW90O2NvcnRleGEz
NSZxdW90Ow0KDQpTaWduZWQtb2ZmLWJ5OiYjMzI7U3RldmVuJiMzMjtZdS1ZdSYjMzI7SHVuZyYj
MzI7Jmx0O1N0ZXZlbi5IdW5nQG1lZGlhdGVrLmNvbSZndDsNCi0tLQ0KJiMzMjttZXRhL2NvbmYv
bWFjaGluZS9pbmNsdWRlL3R1bmUtY29ydGV4YTM1LmluYyYjMzI7fCYjMzI7MiYjMzI7Ky0NCiYj
MzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlvbigrKSwmIzMyOzEm
IzMyO2RlbGV0aW9uKC0pDQoNCmRpZmYmIzMyOy0tZ2l0JiMzMjthL21ldGEvY29uZi9tYWNoaW5l
L2luY2x1ZGUvdHVuZS1jb3J0ZXhhMzUuaW5jJiMzMjtiL21ldGEvY29uZi9tYWNoaW5lL2luY2x1
ZGUvdHVuZS1jb3J0ZXhhMzUuaW5jDQppbmRleCYjMzI7NGNmMDA4NDRlOC4uODkyMGY4ZTZhOCYj
MzI7MTAwNjQ0DQotLS0mIzMyO2EvbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS90dW5lLWNvcnRl
eGEzNS5pbmMNCisrKyYjMzI7Yi9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3R1bmUtY29ydGV4
YTM1LmluYw0KQEAmIzMyOy05LDcmIzMyOys5LDcmIzMyO0BAJiMzMjtyZXF1aXJlJiMzMjtjb25m
L21hY2hpbmUvaW5jbHVkZS9hcm0vYXJjaC1hcm12OGEuaW5jDQomIzMyO0FWQUlMVFVORVMmIzMy
Oys9JiMzMjsmcXVvdDtjb3J0ZXhhMzUmIzMyO2NvcnRleGEzNS1jcnlwdG8mcXVvdDsNCiYjMzI7
QVJNUEtHQVJDSF90dW5lLWNvcnRleGEzNSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7PSYjMzI7JnF1b3Q7Y29ydGV4YTM1JnF1
b3Q7DQomIzMyO0FSTVBLR0FSQ0hfdHVuZS1jb3J0ZXhhMzUtY3J5cHRvJiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7PSYjMzI7JnF1b3Q7Y29ydGV4YTM1JnF1b3Q7DQotVFVORV9GRUFUVVJF
U190dW5lLWNvcnRleGEzNSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7PSYjMzI7JnF1b3Q7YWFyY2g2NCYjMzI7Y29ydGV4YTUzJiMzMjtzaW1kJiMzMjtj
cmMmcXVvdDsNCitUVU5FX0ZFQVRVUkVTX3R1bmUtY29ydGV4YTM1JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjs9JiMzMjsmcXVvdDthYXJjaDY0JiMzMjtj
b3J0ZXhhMzUmIzMyO3NpbWQmIzMyO2NyYyZxdW90Ow0KJiMzMjtUVU5FX0ZFQVRVUkVTX3R1bmUt
Y29ydGV4YTM1LWNyeXB0byYjMzI7JiMzMjsmIzMyOz0mIzMyOyZxdW90O2FhcmNoNjQmIzMyO2Nv
cnRleGEzNSYjMzI7c2ltZCYjMzI7Y3JjJiMzMjtjcnlwdG8mcXVvdDsNCiYjMzI7UEFDS0FHRV9F
WFRSQV9BUkNIU190dW5lLWNvcnRleGEzNSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7PSYjMzI7JnF1b3Q7JiMzNjt7UEFDS0FH
RV9FWFRSQV9BUkNIU190dW5lLWFybXY4YS1jcmN9JiMzMjtjb3J0ZXhhMzUmcXVvdDsNCiYjMzI7
UEFDS0FHRV9FWFRSQV9BUkNIU190dW5lLWNvcnRleGEzNS1jcnlwdG8mIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjs9JiMzMjsmcXVvdDsmIzM2O3tQQUNLQUdFX0VYVFJBX0FSQ0hTX3R1bmUt
YXJtdjhhLWNyYy1jcnlwdG99JiMzMjtjb3J0ZXhhMzUmIzMyO2NvcnRleGEzNS1jcnlwdG8mcXVv
dDsNCi0tJiMzMjsNCjIuMTguMA0KDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxw
cmU+KioqKioqKioqKioqKiBFbWFpbCBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioq
KioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3Nh
Z2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJv
cHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3Vy
ZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQg
b25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRp
b24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNp
cGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVs
aWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUt
bWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xv
c2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsg
eW91ITwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_522389372.111415063
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: base64

ImNvcnRleGE1MyIgLT4gImNvcnRleGEzNSINCg0KU2lnbmVkLW9mZi1ieTogU3RldmVuIFl1LVl1
IEh1bmcgPFN0ZXZlbi5IdW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIG1ldGEvY29uZi9tYWNoaW5l
L2luY2x1ZGUvdHVuZS1jb3J0ZXhhMzUuaW5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS9jb25mL21hY2hp
bmUvaW5jbHVkZS90dW5lLWNvcnRleGEzNS5pbmMgYi9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRl
L3R1bmUtY29ydGV4YTM1LmluYw0KaW5kZXggNGNmMDA4NDRlOC4uODkyMGY4ZTZhOCAxMDA2NDQN
Ci0tLSBhL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvdHVuZS1jb3J0ZXhhMzUuaW5jDQorKysg
Yi9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3R1bmUtY29ydGV4YTM1LmluYw0KQEAgLTksNyAr
OSw3IEBAIHJlcXVpcmUgY29uZi9tYWNoaW5lL2luY2x1ZGUvYXJtL2FyY2gtYXJtdjhhLmluYw0K
IEFWQUlMVFVORVMgKz0gImNvcnRleGEzNSBjb3J0ZXhhMzUtY3J5cHRvIg0KIEFSTVBLR0FSQ0hf
dHVuZS1jb3J0ZXhhMzUgICAgICAgICAgICAgPSAiY29ydGV4YTM1Ig0KIEFSTVBLR0FSQ0hfdHVu
ZS1jb3J0ZXhhMzUtY3J5cHRvICAgICAgPSAiY29ydGV4YTM1Ig0KLVRVTkVfRkVBVFVSRVNfdHVu
ZS1jb3J0ZXhhMzUgICAgICAgICAgPSAiYWFyY2g2NCBjb3J0ZXhhNTMgc2ltZCBjcmMiDQorVFVO
RV9GRUFUVVJFU190dW5lLWNvcnRleGEzNSAgICAgICAgICA9ICJhYXJjaDY0IGNvcnRleGEzNSBz
aW1kIGNyYyINCiBUVU5FX0ZFQVRVUkVTX3R1bmUtY29ydGV4YTM1LWNyeXB0byAgID0gImFhcmNo
NjQgY29ydGV4YTM1IHNpbWQgY3JjIGNyeXB0byINCiBQQUNLQUdFX0VYVFJBX0FSQ0hTX3R1bmUt
Y29ydGV4YTM1ICAgICAgICAgICAgID0gIiR7UEFDS0FHRV9FWFRSQV9BUkNIU190dW5lLWFybXY4
YS1jcmN9IGNvcnRleGEzNSINCiBQQUNLQUdFX0VYVFJBX0FSQ0hTX3R1bmUtY29ydGV4YTM1LWNy
eXB0byAgICAgID0gIiR7UEFDS0FHRV9FWFRSQV9BUkNIU190dW5lLWFybXY4YS1jcmMtY3J5cHRv
fSBjb3J0ZXhhMzUgY29ydGV4YTM1LWNyeXB0byINCi0tIA0KMi4xOC4wDQoNCg==

--__=_Part_Boundary_003_522389372.111415063--

--__=_Part_Boundary_002_1515140917.592963786--
