Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TZ0WK-0000V4-Rr
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 15:34:21 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Nov 2012 06:20:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,257,1352102400"; d="scan'208";a="247462813"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2012 06:20:21 -0800
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Thu, 15 Nov 2012 14:20:21 +0000
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.151]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.36]) with mapi id
	14.01.0355.002; Thu, 15 Nov 2012 14:20:20 +0000
From: "Palcu, Laurentiu" <laurentiu.palcu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH v3 04/12] xkeyboard-config: upgrade to 2.7
Thread-Index: AQHNwmtXC6gewC7pMUuvUNDknFNbgZfq7KaAgAAFvSA=
Date: Thu, 15 Nov 2012 14:20:20 +0000
Message-ID: <F50B87185088EB4790E240C070C3DF4B160E6AE1@IRSMSX104.ger.corp.intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<96e8a890aa256c71895cabe5f36c3c42edc1a086.1352898505.git.laurentiu.palcu@intel.com>
	<1352987675.3709.69.camel@ted>
In-Reply-To: <1352987675.3709.69.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 04/12] xkeyboard-config: upgrade to 2.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2012 14:34:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KVGhhdCdzIHdlaXJkLi4uIEkgdGVzdGVkIHRoZSBjb21waWxhdGlvbiB1
c2luZyB0aGUgWW9jdG8gYXV0b2J1aWxkZXIgbmlnaHRseSB0YXJnZXRzIGZvcg0KYWxsIGFyY2hp
dGVjdHVyZXMgd2l0aC93aXRob3V0IHNoYXJlZCBzdGF0ZS4gQWxsIHdlcmUgc3VjY2Vzc2Z1bC4g
SG93ZXZlciwgSSBhcHBsaWVkIHRoZQ0KcGF0Y2hlcyBvbiB0b3Agb2YgdGhlIGNvbW1pdCBJIHNw
ZWNpZmllZCBpbiB0aGUgY292ZXIgbGV0dGVyLiBBIGRpZG4ndCByZXRlc3Qgd2l0aCB0aGUNCmxh
dGVzdCBjaGFuZ2VzIGluIG1hc3Rlci4uLg0KDQpXaGF0IGltYWdlIHdlcmUgeW91IHRyeWluZyB0
byBjb21waWxlPyBJIGNhbiBnaXZlIGl0IGEgdGVzdCBvbiB0b3Agb2YgdGhlIGxhdGVzdCBjaGFu
Z2VzDQppbiBtYXN0ZXIuLi4NCg0KVGhhbmtzLA0KTGF1cmVudGl1DQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE1LCAyMDEy
IDM6NTUgUE0NClRvOiBQYWxjdSwgTGF1cmVudGl1DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjMgMDQv
MTJdIHhrZXlib2FyZC1jb25maWc6IHVwZ3JhZGUgdG8gMi43DQoNCk9uIFdlZCwgMjAxMi0xMS0x
NCBhdCAxNToyMSArMDIwMCwgTGF1cmVudGl1IFBhbGN1IHdyb3RlOg0KPiBBIGNvdXBsZSBvZiBl
eHRyYSBjaGFuZ2VzOg0KPiAgKiBjaGFuZ2VkIHRoZSBTUkNfVVJJIHRvIHRoZSBuZXcsIHZhbGlk
LCBvbmUNCj4gICogYWRkZWQgZGVwZW5kZW5jeSBvZiBnZXR0ZXh0IChkb19xYV9jb25maWd1cmUg
ZGV0ZWN0ZWQgaXMgbmVlZGVkKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudGl1IFBhbGN1
IDxsYXVyZW50aXUucGFsY3VAaW50ZWwuY29tPg0KPiAtLS0NCj4gIC4uLmJvYXJkLWNvbmZpZ18y
LjEuYmIgPT4geGtleWJvYXJkLWNvbmZpZ18yLjcuYmJ9IHwgICAxMCArKysrKy0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKSAgcmVuYW1lIA0K
PiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve3hrZXlib2FyZC1jb25maWdfMi4xLmJi
ID0+IA0KPiB4a2V5Ym9hcmQtY29uZmlnXzIuNy5iYn0gKDc1JSkNCg0KDQpjaGVja2luZyB3aGV0
aGVyIHRvIGVuYWJsZSBtYWludGFpbmVyLXNwZWNpZmljIHBvcnRpb25zIG9mIE1ha2VmaWxlcy4u
LiBubyBjaGVja2luZyBidWlsZCBzeXN0ZW0gdHlwZS4uLiB4ODZfNjQtcGMtbGludXgtZ251IGNo
ZWNraW5nIGhvc3Qgc3lzdGVtIHR5cGUuLi4gaTU4Ni1wb2t5LWxpbnV4LWdudSBjaGVja2luZyBm
b3IgYSBzZWQgdGhhdCBkb2VzIG5vdCB0cnVuY2F0ZSBvdXRwdXQuLi4gL2Jpbi9zZWQgY2hlY2tp
bmcgZm9yIHhzbHRwcm9jLi4uIC9tZWRpYS9idWlsZDEvcG9reS9idWlsZDEvdG1wL3N5c3Jvb3Rz
L3g4Nl82NC1saW51eC91c3IvYmluL3hzbHRwcm9jDQpjaGVja2luZyBmb3IgYSBzZWQgdGhhdCBk
b2VzIG5vdCB0cnVuY2F0ZSBvdXRwdXQuLi4gKGNhY2hlZCkgL2Jpbi9zZWQgY2hlY2tpbmcgZm9y
IGk1ODYtcG9reS1saW51eC1wa2ctY29uZmlnLi4uIG5vIGNoZWNraW5nIGZvciBwa2ctY29uZmln
Li4uIC9tZWRpYS9idWlsZDEvcG9reS9idWlsZDEvdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91
c3IvYmluL3BrZy1jb25maWcNCmNvbmZpZ3VyZTogV0FSTklORzogdXNpbmcgY3Jvc3MgdG9vbHMg
bm90IHByZWZpeGVkIHdpdGggaG9zdCB0cmlwbGV0IGNoZWNraW5nIHBrZy1jb25maWcgaXMgYXQg
bGVhc3QgdmVyc2lvbiAwLjkuMC4uLiB5ZXMgY2hlY2tpbmcgZm9yIERFUFMuLi4gbm8NCmNvbmZp
Z3VyZTogV0FSTklORzoNCiAgICAgICAgICAgICAgICAgUmVxdWlyZWQgZGVwZW5kZW5jaWVzIG5v
dCBmb3VuZC4gVGhlc2UgZGVwZW5kZW5jaWVzIGFyZQ0KICAgICAgICAgICAgICAgICBydW4tdGlt
ZSBkZXBlbmRlbmNpZXMgb25seSBhbmQgbm90IHJlcXVpcmVkIGZvciBidWlsZGluZy4NCiAgICAg
ICAgICAgICAgICAgU2tpcCB0aGlzIGNoZWNrIHdpdGggLS1kaXNhYmxlLXJ1bnRpbWUtZGVwcy4N
Cg0KICAgICAgICAgICAgICAgICBJbnN0YWxsaW5nIHRoaXMgdmVyc2lvbiBvZiB4a2V5Ym9hcmQt
Y29uZmlnIG9uIGEgaG9zdA0KICAgICAgICAgICAgICAgICB3aXRob3V0IHRoZSByZXF1aXJlZCBk
ZXBlbmRlbmNpZXMgbWF5IHJlc3VsdCBpbiB1bnVzYWJsZQ0KICAgICAgICAgICAgICAgICBrZXli
b2FyZCBsYXlvdXRzLg0KICAgICAgICAgICAgICAgICANCmNvbmZpZ3VyZTogZXJyb3I6IE5vIHBh
Y2thZ2UgJ3gxMScgZm91bmQgQ29uZmlndXJlIGZhaWxlZC4gVGhlIGNvbnRlbnRzIG9mIGFsbCBj
b25maWcubG9nIGZpbGVzIGZvbGxvd3MgdG8gYWlkIGRlYnVnZ2luZyAvbWVkaWEvYnVpbGQxL3Bv
a3kvYnVpbGQxL3RtcC93b3JrL2k1ODYtcG9reS1saW51eC94a2V5Ym9hcmQtY29uZmlnLzIuNy1y
MC94a2V5Ym9hcmQtY29uZmlnLTIuNy9jb25maWcubG9nDQpUaGlzIGZpbGUgY29udGFpbnMgYW55
IG1lc3NhZ2VzIHByb2R1Y2VkIGJ5IGNvbXBpbGVycyB3aGlsZSBydW5uaW5nIGNvbmZpZ3VyZSwg
dG8gYWlkIGRlYnVnZ2luZyBpZiBjb25maWd1cmUgbWFrZXMgYSBtaXN0YWtlLg0KDQpDaGVlcnMs
DQoNClJpY2hhcmQNCg0KDQo=


