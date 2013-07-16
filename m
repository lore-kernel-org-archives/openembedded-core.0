Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9F76B221
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 14:29:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2013 07:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,677,1367996400"; d="scan'208";a="371175529"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2013 07:29:22 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.52]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.153]) with mapi id
	14.03.0123.003; Tue, 16 Jul 2013 15:29:20 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Phil Blundell <pb@pbcl.net>,
	"Wold, Saul" <saul.wold@intel.com>
Thread-Topic: [OE-core] [PATCH 2/2] bluez4: conflicts with/replaces bluez5
Thread-Index: AQHOgW8m6QYiS/x3hUKbpYzVdzo+Fpll3NmAgAAJO4CAAXh6AA==
Date: Tue, 16 Jul 2013 14:29:19 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C05A56@IRSMSX105.ger.corp.intel.com>
References: <cover.1373896070.git.cristian.iorga@intel.com>
	<809bd57326a24570dfd583e33821f42c4e7b930a.1373896070.git.cristian.iorga@intel.com>
	<1373905667.2651.39.camel@phil-desktop.brightsign>
	<CAJTo0LbPaTC0MxhcMM8eAzRxWNRZEw5pz58EnrP_BDixEO0AuQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbPaTC0MxhcMM8eAzRxWNRZEw5pz58EnrP_BDixEO0AuQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bluez4: conflicts with/replaces bluez5
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
X-List-Received-Date: Tue, 16 Jul 2013 14:29:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGxlYXNlIHNlZSBteSBWMyBjb3ZlciBsZXR0ZXIgdG8gb2JzZXJ2ZSB0aGUgcmVhc29uaW5nIGJl
aGluZCBSUkVQTEFDRVMgcHJlc2VuY2UuDQoNClRoYW5rcywNCkNyaXN0aWFuDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3NzLmJ1cnRv
bkBpbnRlbC5jb21dIA0KU2VudDogTW9uZGF5LCBKdWx5IDE1LCAyMDEzIDg6MDEgUE0NClRvOiBQ
aGlsIEJsdW5kZWxsDQpDYzogSW9yZ2EsIENyaXN0aWFuOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAyLzJdIGJs
dWV6NDogY29uZmxpY3RzIHdpdGgvcmVwbGFjZXMgYmx1ZXo1DQoNCk9uIDE1IEp1bHkgMjAxMyAx
NzoyNywgUGhpbCBCbHVuZGVsbCA8cGJAcGJjbC5uZXQ+IHdyb3RlOg0KPj4gK1JDT05GTElDVFNf
JHtQTn0gPSAiYmx1ZXo1Ig0KPj4gK1JSRVBMQUNFU18ke1BOfSA9ICJibHVlejUiDQo+DQo+IEkn
bSBub3Qgc3VyZSB0aGF0IHRoaXMgbmVjZXNzYXJpbHkgZG9lcyBxdWl0ZSB3aGF0IHlvdSB3YW50
LiAgV2hhdCANCj4gZXhhY3RseSB3ZXJlIHlvdSB0cnlpbmcgdG8gYWNoaWV2ZSB3aXRoIHRoYXQg
UlJFUExBQ0VTPw0KDQpJIHJlbWVtYmVyIHdoZW4gdGhpcyBzZXJpZXMgd2FzIGZpcnN0IHB1Ymxp
c2hlZCB0aGVyZSB3YXMgYSBsb25nIGRlYmF0ZSBvdmVyIHRoZSBleGFjdCBsaW5lcyByZXF1aXJl
ZC4gIFRoYXQgc2FpZCwgSSBjYW4ndCBzZWUgd2h5IHdlIG5lZWQgcmVwbGFjZXMgZWl0aGVyLg0K
DQpSb3NzDQo=

