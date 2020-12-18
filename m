Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.3586.1608256815180612765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 18:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Um8GZPTSzDAMm6cHa8og+vT+HrOBWw8diswQ5e+2rH3ZOdnDJTrek5lLxjvHLte2YtiH0gAmnF
 eFpVfO09RiPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9838"; a="236932318"
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; 
   d="scan'208";a="236932318"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2020 18:00:13 -0800
IronPort-SDR: IV4O3Hsnyns9zPapAnpvImnDIlw0WivPCW8cZ+bQAWKGCUmaZKCx9rQQN7j/tfZXtwdQJpBaXj
 HuDu0qZHd82w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; 
   d="scan'208";a="388001980"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2020 18:00:12 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 18 Dec 2020 10:00:12 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Fri, 18 Dec 2020 10:00:12 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"luca.boccassi@gmail.com" <luca.boccassi@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/5] systemd: update 246 -> 247
Thread-Topic: [OE-core] [PATCH v2 1/5] systemd: update 246 -> 247
Thread-Index: AQHW0hZ3MSZ24TjuXU6IVHcABT9Q+an5gk+AgAIWaAA=
Date: Fri, 18 Dec 2020 02:00:11 +0000
Message-ID: <d189ccc302adbfa869935c9d5c03ba4af8db2740.camel@intel.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201214123457.122655-1-luca.boccassi@gmail.com>
	 <7d16bf791179cc0e90fd0172e984eeeacb065112.camel@linuxfoundation.org>
In-Reply-To: <7d16bf791179cc0e90fd0172e984eeeacb065112.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F78F35BE241565499D247012B00D0C94@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTEyLTE2IGF0IDE4OjA3ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gDQo+IFVuZm9ydHVuYXRlbHkgdGhlcmUgaXMgc3RpbGwgc29tZXRoaW5nIG5vdCBxdWl0ZSBy
aWdodCBpbiB0aGlzDQo+IHBhdGNoc2V0DQo+IGFzIGl0IGZhaWxlZCBhZ2FpbiBkdXJpbmcgdGVz
dGluZy4gVGhlcmUgYXJlIGEgZmV3IGRpZmZlcmVudA0KPiBwcm9ibGVtczoNCj4gDQo+IG1ldGEt
aW50ZWwgaW4gc3lzdGVtZC1ib290Og0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3By
b2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy8xMDAvYnVpbGRzLzEwMTYNCg0KSXQgbG9va3Mg
bGlrZSB0aGlzIGhhcHBlbmVkIGJlY2F1c2Ugb2Ygc3lzdGVtZC1ib290IGNoYW5nZSBmcm9tIFJv
c3MuIEkNCmhhdmUgcmVtb3ZlZCB0aGUgYmJhcHBlbmQgZnJvbSBtZXRhLWludGVsIHNvIHRoaXMg
c2hvdWxkbid0IGZhaWwgbm93Lg0KDQpUaGFua3MsDQoNCkFudWoNCg==
