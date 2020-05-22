Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.7807.1590124428064839058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 22:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eAViir/GY0+ef3am7ZnTFTYcaBpjENLEs0pLBYxaqq5goXxw4urLmvOy5mCltqbcJqVbis5YWF
 x0rA157ruoRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 22:13:47 -0700
IronPort-SDR: p0ng6fDDIVnX0JTUu2AWF6FDod4a0/s4Rf1La/w1Or6QJ35CWNbAoLiK65z8YzLGxCyDTfm+i8
 SQwUd1iyxfDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,420,1583222400"; 
   d="scan'208";a="289992125"
Received: from pgsmsx103.gar.corp.intel.com ([10.221.44.82])
  by fmsmga004.fm.intel.com with ESMTP; 21 May 2020 22:13:46 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.74]) by
 PGSMSX103.gar.corp.intel.com ([169.254.2.23]) with mapi id 14.03.0439.000;
 Fri, 22 May 2020 13:13:44 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "ticotimo@gmail.com" <ticotimo@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] strace: fix failing ptests
Thread-Topic: [OE-core] [PATCH] strace: fix failing ptests
Thread-Index: AQHWL/V2oxk0Eyn7hE2X1TmapJfc5aizCX0A
Date: Fri, 22 May 2020 05:13:43 +0000
Message-ID: <fea72bf8b4ced0f7364b8ddc8b2f62291732e23b.camel@intel.com>
References: <20200522045132.2185666-1-anuj.mittal@intel.com>
	 <CANx9H-BLekaXs1Rk19dwLNrP=3Lf7A8vO=yy677jT7-y4iZtDg@mail.gmail.com>
In-Reply-To: <CANx9H-BLekaXs1Rk19dwLNrP=3Lf7A8vO=yy677jT7-y4iZtDg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.135.70]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED7199513CB97048B18CC046D53CF002@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA1LTIxIGF0IDIxOjU3IC0wNzAwLCBUaW0gT3JsaW5nIHdyb3RlOg0KPiBJ
cyB0aGlzIGZvciBaZXVzPw0KDQpZZXMsIEkgZm9yZ290IHRvIGluY2x1ZGUgdGhlIHByZWZpeC4g
SGF2ZSBzZW50IGl0IGFnYWluIHdpdGggcmlnaHQNCnByZWZpeCBub3cuDQoNClRoYW5rcywNCg0K
QW51ag0K
