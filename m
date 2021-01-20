Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.23614.1611117683940563896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 20:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 311UqVZS1bIhF1tC0AlBZBhcTBf39FbFC8AFtQFI9ebP+MQuNDc/Sc4ewyR5pwHKQLzq1IIcy3
 IcOy3fSyHDXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="166137008"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="166137008"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 20:41:22 -0800
IronPort-SDR: dV/4h7nXtt2YeTNcDQCUIw2l0DPWRLQ9ig2lobxCObJ+7kJquwHYZGemkN6fZhvyk8yHfZ5czC
 V6TgDjKUpP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="426768247"
Received: from pgsmsx602.gar.corp.intel.com ([10.108.199.137])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2021 20:41:21 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx602.gar.corp.intel.com (10.108.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 12:41:20 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Wed, 20 Jan 2021 12:41:20 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "wangmy@cn.fujitsu.com"
	<wangmy@cn.fujitsu.com>
Subject: Re: [OE-core] [PATCH] libdrm: upgrade 2.4.103 -> 2.4.104
Thread-Topic: [OE-core] [PATCH] libdrm: upgrade 2.4.103 -> 2.4.104
Thread-Index: AQHW6lQg9kqsG8ihZU6Nj8342lEhr6oqVOMAgAUSDQCAAAtIgA==
Date: Wed, 20 Jan 2021 04:41:20 +0000
Message-ID: <d74c930fa47cda1cc63a15f5bcdea035827c9a74.camel@intel.com>
References: <1610614977-24935-1-git-send-email-wangmy@cn.fujitsu.com>
	 <859d5ae812f49d2300c805866001715329d2b851.camel@linuxfoundation.org>
	 <bf3fcde55b1740e3b95f0cf20632e900@G08CNEXMBPEKD05.g08.fujitsu.local>
In-Reply-To: <bf3fcde55b1740e3b95f0cf20632e900@G08CNEXMBPEKD05.g08.fujitsu.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <058847B3221B884892F60F2431572D85@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIxLTAxLTIwIGF0IDA0OjAwICswMDAwLCBXYW5nIE1pbmd5dSB3cm90ZToNCj4g
SGksIFJpY2hhcmQNCj4gDQo+IENhbiB5b3UgdGVsbCBtZSB3aGVyZSBhbmQgd2hhdCBzZXR0aW5n
cyBkbyBJIG5lZWQgdG8gYWRkIHRvIG1ha2UgZG9jcw0KPiBlbmFibGVkPw0KDQpZb3UgY2FuIGNo
ZWNrIHRoaXMgc3BlY2lmaWMgY29uZmlndXJhdGlvbiBoZXJlOg0KDQpodHRwczovL2dpdC55b2N0
b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kveW9jdG8tYXV0b2J1aWxkZXItaGVscGVyL3RyZWUv
Y29uZmlnLmpzb24jbjQ0Ng0KDQpZb3UnbGwganVzdCBuZWVkIHRvIGFkZCBESVNUUk9fRkVBVFVS
RVNfYXBwZW5kID0gJyBhcGktZG9jdW1lbnRhdGlvbicNCmFuZCB3aWxsIHByb2JhYmx5IG5lZWQg
dG8gYWRkIGRlcGVuZGVuY3kgb24gcHl0aG9uMy1kb2N1dGlscy1uYXRpdmUgaW4NCm1hbnBhZ2Vz
IFBBQ0tBR0VDT05GSUcgb2YgdGhlIHJlY2lwZS4NCg0KVGhhbmtzLA0KDQpBbnVqDQoNCg==
