Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.30198.1607919972751024812
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 20:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: vl64HYFYZVNZn1LroqH5ys4PpIM5vudXenzdv2KX2TGSa/OZito0sEzGVy3H1QqvjHgCL/d831
 DVVT7lcVQIgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="174797674"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="174797674"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 20:26:11 -0800
IronPort-SDR: rrbOb0kGPx8ymm8x5jJqLRGMQ5jIR9Ywc8TzLOeV/WGG7IZd62LO2K0LeUFYpMR8xYA/d92wPs
 3F2AVXZAKYIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="351099701"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2020 20:26:10 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 12:26:09 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Mon, 14 Dec 2020 12:26:09 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "ross@burtonini.com" <ross@burtonini.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd-boot: allow building for Arm targets
Thread-Topic: [OE-core] [PATCH] systemd-boot: allow building for Arm targets
Thread-Index: AQHWzxIZsNhwpiIHFUuQE1HAnKN7Wqn1fjuA
Date: Mon, 14 Dec 2020 04:26:08 +0000
Message-ID: <732073f5112c4d4ff8d2e6d72832bb53823e81f4.camel@intel.com>
References: <20201210163242.3329917-1-ross.burton@arm.com>
In-Reply-To: <20201210163242.3329917-1-ross.burton@arm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9CF089F0D67F945AC083358AC8A64D3@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDE2OjMyICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
DQo+IFJlbW92ZSB0aGUgU1lTVEVNRF9CT09UX0VGSV9BUkNIIGFzc2lnbm1lbnRzLCBhcyB0aGV5
J3JlIG5ldmVyIHVzZWQuDQoNCkl0J3MgdXNlZCBieSBtZXRhLWludGVsLiBJZiBpdCdzIG5vdCBm
aXhpbmcgYW55IHByb2JsZW1zLCBjYW4gd2Uga2VlcA0KaXQgaGVyZT8NCg0KVGhhbmtzLA0KDQpB
bnVqDQoNCg==
