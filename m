Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.14834.1609772709934719298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: jR3t1cE1JaG1j30kEiD/csYCs6MFz+0es6Mqimadl8Y0RMDIxTCpkKUkw4+Sr6Rrs8j40wJkMh
 sxHBwYdRvEcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="177066202"
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="177066202"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 07:05:08 -0800
IronPort-SDR: 8czNQtUTbUg/TAiusGY0QGr1GxQ3tGjAA/VPd0JxybRvTf4t3CipA8wltE4/zZ994do+QKhHNn
 C6vB42B+CuHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="565127904"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga005.jf.intel.com with ESMTP; 04 Jan 2021 07:05:08 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 4 Jan 2021 23:05:07 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Mon, 4 Jan 2021 23:05:06 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Lee, Chee Yang"
	<chee.yang.lee@intel.com>
Subject: Re: [OE-core] [PATCH v2] p11-kit: upgrade 0.23.21 -> 0.23.22
Thread-Topic: [OE-core] [PATCH v2] p11-kit: upgrade 0.23.21 -> 0.23.22
Thread-Index: AQHW4oafshm929qdJkCIfFVvxf0OiKoXCs8A
Date: Mon, 4 Jan 2021 15:05:06 +0000
Message-ID: <f41f5b82cb39b40f4ea79490df9c174874dbf1e8.camel@intel.com>
References: <20210104104440.72633-1-chee.yang.lee@intel.com>
In-Reply-To: <20210104104440.72633-1-chee.yang.lee@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <11B416FF20A7F94D82CFE46A14D6A9E7@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIxLTAxLTA0IGF0IDE4OjQ0ICswODAwLCBMZWUgQ2hlZSBZYW5nIHdyb3RlOg0K
PiDCoFBBQ0tBR0VDT05GSUcgPz89ICIiDQo+ICtQQUNLQUdFQ09ORklHW21hbnBhZ2VzXSA9ICIt
RG1hbj10cnVlLC1EbWFuPWZhbHNlIg0KDQpJIHRoaW5rIHRoaXMgd2lsbCBuZWVkIGF0IGxlYXN0
IGxpYnhzbHQtbmF0aXZlIHRvIGJlIGFkZGVkIGFzIGEgYnVpbGQNCnRpbWUgZGVwZW5kZW5jeToN
Cg0KaHR0cHM6Ly9naXRodWIuY29tL3AxMS1nbHVlL3AxMS1raXQvYmxvYi9tYXN0ZXIvZG9jL21h
bnVhbC9tZXNvbi5idWlsZCNMODgNCg0KVGhhbmtzLA0KDQpBbnVqDQo=
