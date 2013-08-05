Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 454A3605A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 13:59:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2013 06:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,818,1367996400"; d="scan'208";a="381487944"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2013 06:59:34 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 5 Aug 2013 14:59:02 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.218]) with mapi id
	14.03.0123.003; Mon, 5 Aug 2013 14:59:01 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 0/7] PUs for telepathy and gstreamer1.0
Thread-Index: AQHOkdFHKUdzuusjuUi2OQH6t5ulp5mGpCHg
Date: Mon, 5 Aug 2013 13:59:00 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C11C22@IRSMSX105.ger.corp.intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
	<CAJTo0LYTjnD32wbx2HUEQuXNiJGnjhZWYmQ3PGvfEaYjACr1fQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYTjnD32wbx2HUEQuXNiJGnjhZWYmQ3PGvfEaYjACr1fQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] PUs for telepathy and gstreamer1.0
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
X-List-Received-Date: Mon, 05 Aug 2013 13:59:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T0ssIEkgd2lsbCBkZWFsIHdpdGggaXQgdG9tb3Jyb3cuDQovQ3Jpc3RpYW4NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9u
QGludGVsLmNvbV0gDQpTZW50OiBNb25kYXksIEF1Z3VzdCAwNSwgMjAxMyAyOjQ1IFBNDQpUbzog
SW9yZ2EsIENyaXN0aWFuDQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMC83XSBQVXMgZm9yIHRlbGVwYXRo
eSBhbmQgZ3N0cmVhbWVyMS4wDQoNCk9uIDIgQXVndXN0IDIwMTMgMTY6MzksIENyaXN0aWFuIElv
cmdhIDxjcmlzdGlhbi5pb3JnYUBpbnRlbC5jb20+IHdyb3RlOg0KPiBDcmlzdGlhbiBJb3JnYSAo
Nyk6DQo+ICAgdGVsZXBhdGh5LW1pc3Npb24tY29udHJvbDogdXBncmFkZSB0byB2NS4xNS4wDQo+
ICAgdGVsZXBhdGh5LWlkbGU6IHVwZ3JhZGUgdG8gdjAuMS4xNg0KPiAgIGdzdHJlYW1lcjEuMDog
dXBncmFkZSB0byB2MS4wLjkNCj4gICBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlOiB1cGdyYWRl
IHRvIHYxLjAuOQ0KPiAgIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2Q6IHVwZ3JhZGUgdG8gdjEu
MC45DQo+ICAgZ3N0cmVhbWVyMS4wLWxpYmF2OiB1cGdyYWRlIHRvIHYxLjAuOQ0KPiAgIGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhZDogdXBncmFkZSB0byB2MS4wLjkNCg0KQnVpbGQgdGVzdGVkIGFu
ZCB2ZXJpZmllZCBidWlsZGhpc3RvcnkuDQoNCkluIGFub3RoZXIgY29tbWl0IGNhbiB5b3UgYWRk
IGFuIElOU0FORV9TS0lQIGZvciB0aGUgdGV4dC1yZWwgd2FybmluZ3MgaW4gZ3N0cmVhbWVyMS4w
LWxpYmF2PyAgVGhhdCdzIGEga25vd24gaXNzdWUgd2l0aCBsaWJhdiBhZmFpay4NCg0KQWNrZWQt
Qnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+DQoNClJvc3MNCg==

