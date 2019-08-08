Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3A99E7F2F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 11:44:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2019 04:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,361,1559545200"; d="scan'208";a="326284248"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
	by orsmga004.jf.intel.com with ESMTP; 08 Aug 2019 04:44:13 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.22]) by
	KMSMSX156.gar.corp.intel.com ([169.254.1.101]) with mapi id
	14.03.0439.000; Thu, 8 Aug 2019 19:44:12 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dbaryshkov@gmail.com"
	<dbaryshkov@gmail.com>
Thread-Topic: [OE-core] [PATCH] module.bbclass: do not strip packages if
	modules signing is enabled
Thread-Index: AQHVTd6YAxEDh31LHUKdmxAmjaDwkA==
Date: Thu, 8 Aug 2019 11:44:11 +0000
Message-ID: <1d7e32e5e05a43e18d4b52839a3b2327554c0525.camel@intel.com>
References: <20190808095725.18596-1-dbaryshkov@gmail.com>
In-Reply-To: <20190808095725.18596-1-dbaryshkov@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.187.50]
MIME-Version: 1.0
Cc: "dmitry_eremin-solenikov@mentor.com" <dmitry_eremin-solenikov@mentor.com>
Subject: Re: [PATCH] module.bbclass: do not strip packages if modules signing is enabled
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
X-List-Received-Date: Thu, 08 Aug 2019 11:44:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCB36ADCF057B3468426B81D68C2CA08@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE5LTA4LTA4IGF0IDEyOjU3ICswMzAwLCBkYmFyeXNoa292QGdtYWlsLmNvbSB3
cm90ZToNCj4gRnJvbTogRG1pdHJ5IEVyZW1pbi1Tb2xlbmlrb3YgPGRtaXRyeV9lcmVtaW4tc29s
ZW5pa292QG1lbnRvci5jb20+DQo+IA0KPiBTdHJpcHBpbmcga2VybmVsIG1vZHVsZXMgd2lsbCBh
bHNvIHJlbW92ZSBzaWduYXR1cmUsIHRodXMgd2UgaGF2ZSB0bw0KPiBpbmhpYml0IHBhY2thZ2Ug
c3RyaXBpbmcgaW4gY2FzZSBtb2R1bGVzIHNpZ25hdHVyZXMgYXJlIGVuYWJsZWQuDQo+IA0KDQpJ
c24ndCB0aGlzIGFscmVhZHkgYmVpbmcgdGFrZW4gY2FyZSBvZiBoZXJlOg0KDQpodHRwczovL2dp
dC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvcG9reS9jb21taXQvP2lkPThmYzU2ZmFh
NWQ3NjkyN2Y0MmE0ZTdjY2EyNDE4NTU2ZTIzMTkzOGYNCg0KVGhhbmtzLA0KDQpBbnVqDQo=

