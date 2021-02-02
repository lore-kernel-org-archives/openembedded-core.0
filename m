Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.46917.1612235042972924228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 19:04:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: k+ctOBFJtPRk86vTqVIzLl6X03BtYl2dD9847qc+sK/yFnrXzgSTLQCl7aOqsuVh0Wg8G9lRi7
 pWoPS7Kc3qaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180865389"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="180865389"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 19:04:01 -0800
IronPort-SDR: tpfJiMtIcn4vc28/14Z3rd3XXH7aMH8OS1Ow/91+ufKcBAhxRqNVcSuppBtW2d0iEHUS1kHRqJ
 JM5vMJT6anhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="354716105"
Received: from pgsmsx602.gar.corp.intel.com ([10.108.199.137])
  by fmsmga007.fm.intel.com with ESMTP; 01 Feb 2021 19:03:59 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx602.gar.corp.intel.com (10.108.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 2 Feb 2021 11:03:58 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Tue, 2 Feb 2021 11:03:58 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add procps-lib to RDEPENDS
Thread-Topic: [OE-core][PATCH] igt-gpu-tools: add procps-lib to RDEPENDS
Thread-Index: AQHW7umjAEMHnc7uXECF5PxUvisj7apDPsulgAB7qgCAAAG0AA==
Date: Tue, 2 Feb 2021 03:03:58 +0000
Message-ID: <bb89d93309d8f4142b978bd6c07a2f0b02188453.camel@intel.com>
References: <20210120050318.10376-1-Qi.Chen@windriver.com>
	 <165F4E547FA339C3.13584@lists.openembedded.org>
	 <165F4F23A9F2744A.13584@lists.openembedded.org>
	 <260643e582bbeee2748e08e1fd7ebee4adbef888.camel@linuxfoundation.org>
	 <165FCEE5FAACF69D.16314@lists.openembedded.org>
In-Reply-To: <165FCEE5FAACF69D.16314@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7DF9EC83A75E943B4FF6AC0097EC0A0@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIxLTAyLTAyIGF0IDAyOjU3ICswMDAwLCBBbnVqIE1pdHRhbCB3cm90ZToNCj4g
SSBndWVzcyBpdCdzIGhhcHBlbmluZyBiZWNhdXNlIHByb2NwcyB3YXMgc3BsaXQgdXAgcmVjZW50
bHkgdG8gaGF2ZQ0KPiB0aGUNCg0KSSBtZWFudCAiaXQncyBub3QgaGFwcGVuaW5nIG9uIGF1dG9i
dWlsZGVyIGJlY2F1c2UiIC4uLg0KDQo+IGxpYiBpbnN0YWxsZWQgaW4gYSBzZXBhcmF0ZSBwYWNr
YWdlIGFuZCB0aGF0IGRpZG4ndCByZXN1bHQgaW4gYQ0KPiByZWJ1aWxkDQo+IG9mIGlndC1ncHUt
dG9vbHM/DQoNCg==
