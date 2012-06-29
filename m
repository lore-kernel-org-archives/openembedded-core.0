Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1Skkj2-0002xF-1j
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 01:35:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2012 16:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171812790"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2012 16:23:41 -0700
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 29 Jun 2012 16:23:40 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.59]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.211]) with mapi id
	14.01.0355.002; Fri, 29 Jun 2012 16:23:40 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Darren Hart <dvhart@linux.intel.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [poky] [PATCH 4/5] tasl-core-sdk: Add kernel-dev to
	task-core-sdk RDEPENDS
Thread-Index: AQHNVktVAtRwWLR0ZEiFGFJzgwRhOJcR7V4g
Date: Fri, 29 Jun 2012 23:23:39 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C46A7A698@ORSMSX101.amr.corp.intel.com>
References: <cover.1340998763.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340998763.git.dvhart@linux.intel.com>
	<53ce203eec118e3d5b0faac4c8e71f69c9857146.1340998763.git.dvhart@linux.intel.com>
	<CAMKF1sqrg5O7A1Tt=XjTzc0PfV5ZKcETe1tJfHOP460NNmpojw@mail.gmail.com>
	<4FEE33CB.3010609@linux.intel.com>
In-Reply-To: <4FEE33CB.3010609@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: Poky <poky@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 4/5] tasl-core-sdk: Add kernel-dev to task-core-sdk RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 23:35:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgRGFycmVuLA0KDQpJIHRoaW5rIGFkZCBrZXJuZWwtZGV2IHRvIHNkayBpbWFnZSBpcyBhIGJl
dHRlciBhcHByb2FjaCBmb3Igd2hhdCB5b3UncmUgdHJ5aW5nIHRvIGFjaGlldmUuDQoNClRoYW5r
cywNCkplc3NpY2ENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERhcnJlbiBI
YXJ0IFttYWlsdG86ZHZoYXJ0QGxpbnV4LmludGVsLmNvbV0NClNlbnQ6IEZyaWRheSwgSnVuZSAy
OSwgMjAxMiA0OjAyIFBNDQpUbzogS2hlbSBSYWoNCkNjOiBQb2t5OyBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBCb2RrZSwgS2lzaG9yZSBLOyBaaGFuZywgSmVzc2lj
YQ0KU3ViamVjdDogUmU6IFtwb2t5XSBbUEFUQ0ggNC81XSB0YXNsLWNvcmUtc2RrOiBBZGQga2Vy
bmVsLWRldiB0byB0YXNrLWNvcmUtc2RrIFJERVBFTkRTDQoNCk9uIDA2LzI5LzIwMTIgMDI6NTkg
UE0sIEtoZW0gUmFqIHdyb3RlOg0KDQo+PiAgQUxMT1dfRU1QVFkgPSAiMSINCj4+ICAjUEFDS0FH
RUZVTkNTID0rICdnZW5lcmF0ZV9zZGtfcGtncycNCj4+IEBAIC00Niw3ICs0Niw4IEBAIFJERVBF
TkRTX3Rhc2stY29yZS1zZGsgPSAiXA0KPj4gICAgIGRpc3RjYyBcDQo+PiAgICAgbGRkIFwNCj4+
ICAgICBmaWxlIFwNCj4+IC0gICAgdGNsIg0KPj4gKyAgICB0Y2wgXA0KPj4gKyAgICBrZXJuZWwt
ZGV2Ig0KPg0KPiBEb2Vzbid0IHRoaXMubWFrZSBzZGsgdG8gYmUgbWFjaGluZSBzcGVjaWZpYyBu
b3cNCg0KSXQgZG9lcyBpbmRlZWQgYXMgdGhlIGtlcm5lbC1kZXYgY29udGFpbnMgdGhlIHN5c3Rl
bSBtYXAsIGNvbmZpZywgYW5kIHBvc3NpYmx5IGV2ZW4gbW9kaWZpZWQgaGVhZGVycyBkZXBlbmRp
bmdvbiB0aGUgS0JSQU5DSC4NCg0KSXMgdGFzay1jb3JlLXNkayBpbnRlbmRlZCB0byBiZSBvbmx5
IGFyY2hpdGVjdHVyZSBzcGVjaWZpYz8NCg0KSWYgc28sIEkgY2FuIGp1c3QgYWRkIGtlcm5lbC1k
ZXYgdG8gdGhlIC1zZGsgaW1hZ2UgcmVjaXBlcyBkaXJlY3RseSByYXRoZXIgdGhhbiBtb2RpZnlp
bmcgdGFzay1jb3JlLXNkay4NCg0KSmVzc2ljYSwgYW55IG9waW5pb24gaGVyZT8NCg0KLS0NCkRh
cnJlbiBIYXJ0DQpJbnRlbCBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlcg0KWW9jdG8gUHJv
amVjdCAtIExpbnV4IEtlcm5lbA0KDQoNCg==


