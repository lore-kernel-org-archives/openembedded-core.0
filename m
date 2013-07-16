Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 520B16B216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 14:36:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jul 2013 07:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,677,1367996400"; d="scan'208";a="371114480"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2013 07:36:34 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 16 Jul 2013 15:36:28 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.52]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.214]) with mapi id
	14.03.0123.003; Tue, 16 Jul 2013 15:36:28 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Phil Blundell <pb@pbcl.net>
Thread-Topic: [OE-core] [PATCH V3 0/2] BlueZ 5 experimental recipes
Thread-Index: AQHOgjCeaubcFOGEK0CctiFa2wh4c5lnTdOAgAARH8A=
Date: Tue, 16 Jul 2013 14:36:28 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C05A76@IRSMSX105.ger.corp.intel.com>
References: <1373984927-21039-1-git-send-email-cristian.iorga@intel.com>
	<1373985229.2651.84.camel@phil-desktop.brightsign>
In-Reply-To: <1373985229.2651.84.camel@phil-desktop.brightsign>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 0/2] BlueZ 5 experimental recipes
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
X-List-Received-Date: Tue, 16 Jul 2013 14:36:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

IiB3aHkgaGF2aW5nIGl0IGJlIHNvIGlzIG5vdCBhIHZlcnkgZ29vZCB0aGluZy4iDQoNClNvcnJ5
LCBJIGRpZCBub3QgdW5kZXJzdG9vZCB0aGlzIHBhcnQuDQoNCkp1ZGdpbmcgYnkgbXkgaW52ZXN0
aWdhdGlvbiwgaXMgUlJFUExBQ0VTIG5lZWRlZCBvciBub3Q/DQoNCi9DcmlzdGlhbg0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGhpbCBCbHVuZGVsbCBbbWFpbHRvOnBiQHBi
Y2wubmV0XSANClNlbnQ6IFR1ZXNkYXksIEp1bHkgMTYsIDIwMTMgNTozNCBQTQ0KVG86IElvcmdh
LCBDcmlzdGlhbg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
ClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIFYzIDAvMl0gQmx1ZVogNSBleHBlcmltZW50
YWwgcmVjaXBlcw0KDQpPbiBUdWUsIDIwMTMtMDctMTYgYXQgMTc6MjggKzAzMDAsIENyaXN0aWFu
IElvcmdhIHdyb3RlOg0KPiBPYnNlcnZlIG15IGludmVzdGlnYXRpb24gYmVsb3cgaW4gb3JkZXIg
dG8gZGVjaWRlIGlmIFJSRVBMQUNFUyBpcyBuZWVkZWQuDQo+IENvbmNsdXNpb246IEJsdWVaIDUu
eCB3aWxsIGJlIGV2ZW50dWFsbHkgYW4gdXBncmFkZSBwYXRoIGZvciBhbiANCj4gYWxyZWFkeSBp
bnN0YWxsZWQgZW1iZWRkZWQgZGV2aWNlLiBBcyBzdWNoLCBSUkVQTEFDRVMgaXMgbmVlZGVkIGZv
ciBhIHN5c3RlbS13aWRlIHVwZ3JhZGUuDQoNCkl0IHdhc24ndCB2ZXJ5IG9idmlvdXMgdG8gbWUg
dGhhdCB0aGVzZSByZXN1bHRzIG1ha2UgYSBjb21wZWxsaW5nIGNhc2UgZm9yIGJsdWV6NCBuZWVk
aW5nIHRvIFJSRVBMQUNFIGJsdWV6NS4gIEluZGVlZCwgdGhpcyBzZWN0aW9uOg0KDQpyb290QHFl
bXV4ODY6fiMgb3BrZyBpbnN0YWxsIGJsdWV6NQ0KTXVsdGlwbGUgcmVwbGFjZXJzIGZvciBibHVl
ejUsIHVzaW5nIGZpcnN0IG9uZSAoYmx1ZXo0KS4NClBhY2thZ2UgYmx1ZXo0IGlzIGFscmVhZHkg
aW5zdGFsbGVkIG9uIHJvb3QuDQpyb290QHFlbXV4ODY6fiMgb3BrZyBsaXN0LWluc3RhbGxlZCB8
IGdyZXAgYmx1ZXoNCmJsdWV6NCAtIDQuMTAxLXI2LjANCmxpYmFzb3VuZC1tb2R1bGUtYmx1ZXog
LSA0LjEwMS1yNi4wDQoNCi4uLiBzZWVtcyB0byBpbGx1c3RyYXRlIChtb2R1bG8gdGhlIHVzdWFs
IGFtb3VudCBvZiBvcGtnIGNyYXppbmVzcykgd2h5IGhhdmluZyBpdCBiZSBzbyBpcyBub3QgYSB2
ZXJ5IGdvb2QgdGhpbmcuDQoNCnAuDQoNCg0K

