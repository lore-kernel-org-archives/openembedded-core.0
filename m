Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C8C7077BC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 18:05:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 16 Oct 2017 11:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,387,1503385200"; d="scan'208";a="1231421669"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2017 11:05:19 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.30]) by
	ORSMSX102.amr.corp.intel.com ([169.254.3.17]) with mapi id
	14.03.0319.002; Mon, 16 Oct 2017 11:05:18 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] nettle-ptest: fix a failing test
Thread-Index: AQHTRFjYVkd5kHN2v0qeVbI85TIBKKLi4A4AgAPBUvCAAHlXAP//rXQQ
Date: Mon, 16 Oct 2017 18:05:10 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B611A2BE52@ORSMSX112.amr.corp.intel.com>
References: <1507922643-81187-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sq-CjSGt36V=B5yjg+diaAMFkH8h-N29t4uMuXNV8_qyA@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B611A2BC51@ORSMSX112.amr.corp.intel.com>
	<CAMKF1sps3+LLw9=rcxM1xNAgvQsd-VJcS4sJ98BVaZ=QYUH=qg@mail.gmail.com>
In-Reply-To: <CAMKF1sps3+LLw9=rcxM1xNAgvQsd-VJcS4sJ98BVaZ=QYUH=qg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nettle-ptest: fix a failing test
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
X-List-Received-Date: Mon, 16 Oct 2017 18:05:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IEl0IHNob3VsZCBsb29rIGluIHBhdGhzIHJlbGF0aXZlIHRvIExEX0xJQlJBUllfUEFUSCwg
ZG8geW91IHNlZSBpdA0KPiBkb2Vzbid0IGhhcHBlbiA/DQo+IA0KDQpUaGUgcHJvYmxlbSBpcywg
Zm9yIGRsb3BlbiByZWxhdGl2ZS9hYnNvbHV0ZSBuYW1lcyBMRF9MSUJSQVJZX1BBVEgNCmlzIG5v
dCB1c2VkLiANCg0KVGhlIG1hbiBmb3IgZGxvcGVuIHNheXM6DQpJZiBmaWxlbmFtZSBjb250YWlu
cyBhIHNsYXNoICgiLyIpLCB0aGVuIGl0IGlzIGludGVycHJldGVkIGFzIGEgKHJlbGF0aXZlIG9y
IGFic29sdXRlKSBwYXRobmFtZS4gIE90aGVyd2lzZSA8Li4uPiBpZiB0aGUgZHluYW1pYyBsaW5r
ZXIgYXQgIHRoZSAgdGltZSAgdGhhdCAgdGhlICBwcm9ncmFtICB3YXMgc3RhcnRlZCwgdGhlIGVu
dmlyb25tZW50IHZhcmlhYmxlIExEX0xJQlJBUllfUEFUSCB3YXMgZGVmaW5lZCB0byBjb250YWlu
IGEgY29sb24tc2VwYXJhdGVkIGxpc3Qgb2YgZGlyZWN0b3JpZXMsIHRoZW4gdGhlc2UgYXJlIHNl
YXJjaGVkLg0KDQo=

