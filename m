Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.6504.1585797176159193517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 20:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: PQZnJCKwGzTZOe7NO2stB14QGDBo/T7aNuZlv5rbxi/arsfxTIVlrKddM/fCC3NtUBUIeNetjL
 QCV1SUrQNP0g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 20:12:55 -0700
IronPort-SDR: mWSGJjb2Up1eoDWm+VY9JldZJEetoBSkx6waNmvPxkeRsOnyZtv2Lj5fvKgjh//P5ZxGTxgi2Z
 9qIwKMOdClGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,334,1580803200"; 
   d="scan'208";a="449457326"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
  by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2020 20:12:54 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.161]) by
 PGSMSX102.gar.corp.intel.com ([169.254.6.245]) with mapi id 14.03.0439.000;
 Thu, 2 Apr 2020 11:01:01 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"mingli.yu@windriver.com" <mingli.yu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] netbase: use git fetcher
Thread-Topic: [OE-core] [PATCH] netbase: use git fetcher
Thread-Index: AQHV+3Svf6tDprAuJ02a3n0td7HOYqhjkIEAgAEh5oCAAAZxAA==
Date: Thu, 2 Apr 2020 03:01:00 +0000
Message-ID: <31f08cab86820e3217a681651d240a4369099ee4.camel@intel.com>
References: <1584350653-141457-1-git-send-email-mingli.yu@windriver.com>
	 ,<796ecb1469a1944bb7386c5c6ba9bfe580795057.camel@linuxfoundation.org>
	 <DM6PR11MB3817B7D03D5961DA36C44231F1C60@DM6PR11MB3817.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB3817B7D03D5961DA36C44231F1C60@DM6PR11MB3817.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.142.44]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E88E4C7E9E7B94489B8C6C7580901DA@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA0LTAyIGF0IDAyOjM3ICswMDAwLCBZdSwgTWluZ2xpIHdyb3RlOg0KPiBI
aSBSUCwNCj4gDQo+IFdoYXQncyB0aGUgZXJyb3IgZG8geW91IG1lYW4/IEkgZGlkbid0IGZpbmQg
dGhlIGVycm9yIHJlbGF0ZWQgdG8NCj4gbmV0YmFzZSwgY291bGQgeW91IGhlbHAgdG8gcHJvdmlk
ZSBtb3JlIGluZm8/DQoNCkl0J3MgaGVyZToNCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3By
b2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy83OS9idWlsZHMvODI1L3N0ZXBzLzgvbG9ncy9z
dGVwMmQNCg0KVGhhbmtzLA0KDQpBbnVqDQo=
