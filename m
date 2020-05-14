Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.5947.1589426755680506799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 20:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: 1d40Sx3BZQeXKlXWWWDIcecU5LGSuCwpjLIbCFpdZkbh5/YXQgbG/xFdfEDy7qfaj6w/rrc7TH
 cVAwSJNXkTCw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 20:25:55 -0700
IronPort-SDR: Xy7yvLvxmHU43c8hTcd1uL2qk//nSdZ2jcM6IDGNuzTogKIapmcXgMKxyYJiAvs0HQOt96bEAO
 n7IB2qFnqiNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; 
   d="scan'208";a="297878193"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
  by fmsmga002.fm.intel.com with ESMTP; 13 May 2020 20:25:54 -0700
Received: from pgsmsx102.gar.corp.intel.com ([169.254.6.12]) by
 PGSMSX111.gar.corp.intel.com ([169.254.2.69]) with mapi id 14.03.0439.000;
 Thu, 14 May 2020 11:25:53 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] libva: upgrade 2.6.1 -> 2.7.1
Thread-Topic: [OE-core] [PATCH 1/2] libva: upgrade 2.6.1 -> 2.7.1
Thread-Index: AQHWKW5gB5HNYCdFIUuUebDQ02JbE6im64qg
Date: Thu, 14 May 2020 03:25:52 +0000
Message-ID: <C996A1173CD66043A3AEC0C7B2C3906904DB58DF@PGSMSX102.gar.corp.intel.com>
References: <160D08561718B7AF.8752@lists.openembedded.org>
	 <C996A1173CD66043A3AEC0C7B2C3906904DB50FE@PGSMSX102.gar.corp.intel.com>
 <969caea61a7b4e9ab83b527655e94e589ae74d78.camel@linuxfoundation.org>
In-Reply-To: <969caea61a7b4e9ab83b527655e94e589ae74d78.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KVGhlc2UgcGF0Y2hlcyBhcHBseSBvbiB0b3Agb2YgY3VycmVudCBtYXN0
ZXIuDQoNClJlZ2FyZHMsDQpOYXZlZW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiAN
ClNlbnQ6IFRodXJzZGF5LCBNYXkgMTQsIDIwMjAgNTozNSBBTQ0KVG86IFNhaW5pLCBOYXZlZW4g
S3VtYXIgPG5hdmVlbi5rdW1hci5zYWluaUBpbnRlbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzJd
IGxpYnZhOiB1cGdyYWRlIDIuNi4xIC0+IDIuNy4xDQoNCk9uIFdlZCwgMjAyMC0wNS0xMyBhdCAw
MToxNCArMDAwMCwgTmF2ZWVuIFNhaW5pIHdyb3RlOg0KPiBQaW5nDQoNCk5lZWRzIHJlYmFzaW5n
IGFnYWluc3QgbWFzdGVyIHBsZWFzZSBhcyB0aGVyZSB3ZXJlIG90aGVyIGxpYnZhIGNoYW5nZXMg
cmVjZW50bHkuDQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQo=
