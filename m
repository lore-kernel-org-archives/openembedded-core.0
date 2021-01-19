Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.12165.1611068316375433328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 06:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2QS+lvZ0kD1cWzEZf7s1KotcixDZ9xY5v6RJaulVgR3RJjKV6qxzI3ridVjFpzFeEGUsYiBb7p
 LRVdx+fQ7iSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179023950"
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; 
   d="scan'208";a="179023950"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 06:58:35 -0800
IronPort-SDR: bVXzbhCOQpEA8GXotAumfyZSE1tq6RANhPKEGCvXy81e6Ll8Ot+CvcuqaTUKwHiwgIQdwjgbrw
 Dn8E3wcGSLYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; 
   d="scan'208";a="426495114"
Received: from kmsmsx601.gar.corp.intel.com ([172.21.219.141])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2021 06:58:34 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx601.gar.corp.intel.com (172.21.219.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 19 Jan 2021 22:58:33 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Tue, 19 Jan 2021 22:58:33 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/30] enchant2: upgrade 2.2.14 -> 2.2.15
Thread-Topic: [OE-core] [PATCH 01/30] enchant2: upgrade 2.2.14 -> 2.2.15
Thread-Index: AQHW7mB04x/fnGwnZk+st3mA+NmCDqouhD4A
Date: Tue, 19 Jan 2021 14:58:33 +0000
Message-ID: <adb50d1a2339dea30b615d0d54ee734c525f5a4a.camel@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
	 <2373028965f82731c9ed64b4366ba8ba85c8f35b.camel@linuxfoundation.org>
In-Reply-To: <2373028965f82731c9ed64b4366ba8ba85c8f35b.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <528A506601711144A04DBAFF62690B04@intel.com>
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KT24gVHVlLCAyMDIxLTAxLTE5IGF0IDEyOjQxICswMDAwLCBSaWNoYXJk
IFB1cmRpZSB3cm90ZToNCj4gT24gVHVlLCAyMDIxLTAxLTE5IGF0IDE0OjQ1ICswODAwLCBBbnVq
IE1pdHRhbCB3cm90ZToNCj4gDQo+IFRoZXJlIHNlZW0gdG8gYmUgYSBsb3Qgb2YgcG9pbnQgdmVy
c2lvbiB1cGdyYWRlcyBpbiB0aGlzIHNlcmllcy4gSG93DQo+IHN1cmUgYXJlIHdlIHRoZXkgYXJl
IGFsbCBidWdmaXhlcz8NCj4gDQoNCkkgYW0gbm90IHN1cmUuIEkgZGlkbid0IGNoZWNrIGVhY2gg
b25lIG9mIHRoZW0uIFRoZXkganVzdCB3ZXJlIHRoZQ0KbGF0ZXN0IHZlcnNpb25zIGF2YWlsYWJs
ZSBhbmQgdGVzdGVkIGJ5IHRoaXMgbW9udGgncyBBVUggcnVuLg0KDQpUaGFua3MsDQoNCkFudWoN
Cg==
