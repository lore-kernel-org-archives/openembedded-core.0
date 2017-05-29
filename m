Return-Path: <ismo.puustinen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 67B5071976
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 09:11:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2017 02:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,413,1491289200"; d="scan'208";a="862401476"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by FMSMGA003.fm.intel.com with ESMTP; 29 May 2017 02:11:41 -0700
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.129]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.74]) with mapi id
	14.03.0319.002; Mon, 29 May 2017 10:11:17 +0100
From: "Puustinen, Ismo" <ismo.puustinen@intel.com>
To: "dmitry.rozhkov@linux.intel.com" <dmitry.rozhkov@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] boost: backport a regression fix for
	forgotten header
Thread-Index: AQHS2FuGYCKQlrS/4Ueeim46kYAhHA==
Date: Mon, 29 May 2017 09:11:16 +0000
Message-ID: <1496049074.37734.1.camel@intel.com>
References: <20170515115432.27466-1-dmitry.rozhkov@linux.intel.com>
In-Reply-To: <20170515115432.27466-1-dmitry.rozhkov@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.72]
MIME-Version: 1.0
Subject: Re: [PATCH] boost: backport a regression fix for forgotten header
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
X-List-Received-Date: Mon, 29 May 2017 09:11:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <58F4ACAB28926D4DBED3CE694C2CEBA9@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDE3LTA1LTE1IGF0IDE0OjU0ICswMzAwLCBEbWl0cnkgUm96aGtvdiB3cm90ZToN
Cj4gVGhlIHYxLjY0IHJlbGVhc2UgaGFzIGJyb2tlbiBhcnJheSBzZXJpYWxpemF0aW9uIGNvZGUg
d2l0aCBpc3N1ZXMNCj4gcmVwb3J0ZWQgaW4NCj4gDQo+IGh0dHBzOi8vc3ZuLmJvb3N0Lm9yZy90
cmFjL2Jvb3N0L3RpY2tldC8xMjUxNg0KPiBodHRwczovL2dpdGh1Yi5jb20vYm13Y2FyaXQvbWV0
YS1yb3MvaXNzdWVzLzUwNQ0KPiANCj4gQmFja3BvcnQgdGhlIGZpeCBmcm9tIGJvb3N0OjpzZXJp
YWxpemF0aW9uJ3MgbWFzdGVyLg0KDQpUaGlzIGlzIHByZXR0eSBpbXBvcnRhbnQgcGF0Y2ggLS0g
UmVma2l0IGRvZXNuJ3QgY29tcGlsZSB3aXRoIGxhdGVzdA0Kb2UtY29yZSB3aXRob3V0IHRoZSBw
YXRjaC4NCg0KSXNtbw0K

