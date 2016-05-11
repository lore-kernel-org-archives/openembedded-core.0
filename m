Return-Path: <ismo.puustinen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 00ADC60797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:46:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 11 May 2016 03:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,608,1455004800"; d="scan'208";a="973382123"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga002.jf.intel.com with ESMTP; 11 May 2016 03:46:41 -0700
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.133]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.226]) with mapi id
	14.03.0248.002; Wed, 11 May 2016 11:46:39 +0100
From: "Puustinen, Ismo" <ismo.puustinen@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"stephano.cetola@linux.intel.com" <stephano.cetola@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2 0/2] Create systemd users at build time
Thread-Index: AQHRqkxlcvHHIM/kHU6E1O9g4gO1up+zf2yA
Date: Wed, 11 May 2016 10:46:38 +0000
Message-ID: <1462963597.11059.13.camel@intel.com>
References: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
In-Reply-To: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.160]
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] Create systemd users at build time
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
X-List-Received-Date: Wed, 11 May 2016 10:46:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDBFC84795F66F47B94D4481A81741B2@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDE2LTA1LTA5IGF0IDE2OjQyIC0wNzAwLCBTdGVwaGFubyBDZXRvbGEgd3JvdGU6
DQo+IFN5c3RlbWQgaGFzIGEgY29uZmlnIG9wdGlvbiBzeXN1c2VycyB3aGljaCBjcmVhdGVzIGFu
eSB1c2VycyBvcg0KPiBncm91cHMgdGhhdA0KPiBzeXN0ZW1kIG5lZWRzIG9uIGZpcnN0IGJvb3Qu
IFRoZXJlIGlzIGEgcm9vdGZzLXBvc3Rjb21tYW5kIHRoYXQNCj4gY3JlYXRlcyB0aGVzZQ0KPiB1
c2VycyBpbiBjYXNlIHRoZSBmaWxlc3lzdGVtIGlzIHJlYWRvbmx5LCBob3dldmVyIGl0IGRvZXMg
bm90IHRha2UNCj4gaW50bw0KPiBhY2NvdW50IGFueSBzdGFpY2lkcyB0aGF0IHRoZSB1c2VyIG1h
eSBoYXZlIHNldC4NCj4gDQo+IEJ5IGFkZGluZyB0aGVzZSB1c2VycyBhdCBidWlsZCB0aW1lLCB3
ZSBhbGxvdyBhIGNoZWNrIGZvciBzdGF0aWNpZHMsDQo+IHdoaWNoIHdvdWxkDQo+IG90aGVyd2lz
ZSBoYXZlIGJlZW4gc2tpcHBlZC4NCg0KSSB0aGluayB0aGlzIGlzIGEgdmFsdWFibGUgZmVhdHVy
ZS4gSG93ZXZlciwgaGF2ZSB5b3UgY29uc2lkZXJlZCBhZGRpbmcNCnRoZSAibSIgYW5kICJyIiBv
cHRpb25zIHRvbz8gSSB0aGluayB0aGF0IGF0IGxlYXN0ICJtIiB3b3VsZCBiZQ0Kd29ydGh3aGls
ZSB0byBpbXBsZW1lbnQsIHNpbmNlIGl0J3MgaW1wb3J0YW50IHRvIGJlIGFibGUgdG8gYWRkIHVz
ZXJzDQp0byBkaWZmZXJlbnQgZ3JvdXBzIGZvciBwcml2aWxlZ2UgbWFuYWdlbWVudC4NCg0KSXNt
bw==

