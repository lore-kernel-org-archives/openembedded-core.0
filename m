Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0982977BFF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:08:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="17684151"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Apr 2017 10:08:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 42E5A47CE221;
	Thu, 13 Apr 2017 10:08:40 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0319.002; Thu, 13 Apr 2017 10:08:40 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]  [PATCH] ed: 1.14.1 -> 1.14.2
Thread-Index: AQHSsz78oqiWrs/w0k6+DsoJpwfdH6HCjVaw
Date: Thu, 13 Apr 2017 02:08:38 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C60DF86ACE@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1491966552-782-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<50B33AC5ED75F74F991980326F1C438D194F2393@PGSMSX103.gar.corp.intel.com>
In-Reply-To: <50B33AC5ED75F74F991980326F1C438D194F2393@PGSMSX103.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 42E5A47CE221.A797E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] ed: 1.14.1 -> 1.14.2
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
X-List-Received-Date: Thu, 13 Apr 2017 02:08:40 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

U29ycnksSSBkaWRuJ3Qgc2VlIGl0IGJlZm9yZS4gVGhhbmtzIGZvciB5b3Vy
IGZlZWRiYWNrLg0KDQpodWFuZ3F5DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogQ2hhbmcsIFJlYmVjY2EgU3dlZSBGdW4gW21h
aWx0bzpyZWJlY2NhLnN3ZWUuZnVuLmNoYW5nQGludGVsLmNvbV0NCj4gU2Vu
dDogV2VkbmVzZGF5LCBBcHJpbCAxMiwgMjAxNyAxMTo0NCBBTQ0KPiBUbzog
SHVhbmcsIFFpeXUvu8Yg5/nT7iA8aHVhbmdxeS5mbnN0QGNuLmZ1aml0c3Uu
Y29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSRTogW09FLWNvcmVdIFtQQVRDSF0gZWQ6IDEu
MTQuMSAtPiAxLjE0LjINCj4gDQo+ID5VcGdyYWRlIGVkIGZyb20gMS4xNC4x
IHRvIDEuMTQuMi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFFp
eXUgPGh1YW5ncXkuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4g
PiAgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2VkL3tlZF8xLjE0LjEuYmIgPT4g
ZWRfMS4xNC4yLmJifSB8IDQgKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKSAgcmVuYW1lIG1ldGEv
cmVjaXBlcy0NCj4gPiBleHRlbmRlZC9lZC97ZWRfMS4xNC4xLmJiID0+IGVk
XzEuMTQuMi5iYn0gKDg0JSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4xNC4xLmJiIGIvbWV0YS9yZWNp
cGVzLQ0KPiA+IGV4dGVuZGVkL2VkL2VkXzEuMTQuMi5iYiBzaW1pbGFyaXR5
IGluZGV4IDg0JSByZW5hbWUgZnJvbQ0KPiA+IG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9lZC9lZF8xLjE0LjEuYmINCj4gPiByZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2VkL2VkXzEuMTQuMi5iYg0KPiA+IGluZGV4IDVkODlh
ODcuLjhjZDkzOTIgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2VkL2VkXzEuMTQuMS5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9lZC9lZF8xLjE0LjIuYmINCj4gPiBAQCAtMTMsOCArMTMs
OCBAQCBiaW5kaXIgPSAiJHtiYXNlX2JpbmRpcn0iDQo+ID4NCj4gPiAgU1JD
X1VSSSA9ICIke0dOVV9NSVJST1J9L2VkL2VkLSR7UFZ9LnRhci5seiINCj4g
Pg0KPiA+IC1TUkNfVVJJW21kNXN1bV0gPSAiN2Y0YTU0ZmE3ZjM2NjQ3OWYw
MzY1NGI4YWY2NDVmZDAiDQo+ID4gLVNSQ19VUklbc2hhMjU2c3VtXSA9DQo+
ID4NCj4gImZmYjk3ZWI4ZjJhMmI1YTcxYTliOTdlMzg3MmFkY2U5NTNhYTFi
ODk1OGUwNGM1YjdiZjExZDU1NmYzMjU1MmEiDQo+ID4gK1NSQ19VUklbbWQ1
c3VtXSA9ICIyNzNkMDQ3NzhiMmE1MWY3YzNjYmZjZDIwMDE4NzZiZiINCj4g
PiArU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gPg0KPiAiZjU3OTYyYmE5MzBk
NzBkMDJmYzcxZDZiZTVjNWYyMzQ2YjE2OTkyYTQ1NWFiOWM0M2JlNzA2MWRl
Yzk4MTBkYiINCj4gDQo+IFNpbWlsYXIgcGF0Y2ggaGFzIGJlZW4gc3VibWl0
dGVkIGJ5IE1heGltLg0KPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9waXBlcm1haWwvb3BlbmVtYmVkZGVkLWNvcmUvMjAxNy1BcHJpbC8xMzUN
Cj4gMjU2Lmh0bWwNCj4gDQo+IFF1b3RlZCBmcm9tIEp1c3NpOg0KPiBGZWF0
dXJlIGZyZWV6ZSBpcyBpbiBlZmZlY3Q6IHZlcnNpb24gdXBncmFkZXMgc2hv
dWxkIGVpdGhlciB3YWl0IHVudGlsIGFmdGVyDQo+IHJlbGVhc2Ugb3IgY29t
ZSB3aXRoIGEgdmVyeSBnb29kIHJlYXNvbi4NCj4gDQo+IE1heGluIHNlbnQg
YSBwYXRjaCBlYXJsaWVyIHRvIHVzZSB0aGUgeW9jdG8gbWlycm9yIGFzIFNS
Q19VUkk6IG5vdCBpZGVhbCBidXQNCj4gcHJvYmFibHkgdGhlIGJlc3Qgd2Ug
Y2FuIGRvIGlmIHVwc3RyZWFtIHJlYWxseSB3YW50cyB0byBkZWxldGUgb2xk
IHJlbGVhc2VzLi4uDQo+IFJlZmVyZW5jZToNCj4gaHR0cDovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvcGlwZXJtYWlsL29wZW5lbWJlZGRlZC1jb3JlLzIw
MTctQXByaWwvMTM1DQo+IDQ4Ni5odG1sDQo+IA0KPiBUaGFua3MsDQo+IFJl
YmVjY2ENCj4gDQoNCgoK

