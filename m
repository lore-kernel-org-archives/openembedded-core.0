Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4006C406
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 08:05:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2018 00:05:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,231,1539673200"; d="scan'208";a="86356962"
Received: from pgsmsx103.gar.corp.intel.com ([10.221.44.82])
	by fmsmga008.fm.intel.com with ESMTP; 14 Nov 2018 00:05:57 -0800
Received: from kmsmsx155.gar.corp.intel.com ([169.254.15.19]) by
	PGSMSX103.gar.corp.intel.com ([169.254.2.155]) with mapi id
	14.03.0415.000; Wed, 14 Nov 2018 16:05:56 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 01/12] build-appliance: Drop test which is
	already	automated
Thread-Index: AQHUeDig1wikiz6h+06OayQK/VaC5KVLX7jwgAAjwgCAA2taIA==
Date: Wed, 14 Nov 2018 08:05:55 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D0434811F952@KMSMSX155.gar.corp.intel.com>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D0434811E1D4@KMSMSX155.gar.corp.intel.com>
	<3c2a7b56677a1eb00aace62b4608055810e9f9f8.camel@linuxfoundation.org>
In-Reply-To: <3c2a7b56677a1eb00aace62b4608055810e9f9f8.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiN2ZlMTdmNDAtMzU2My00ZjQ0LWFmY2YtOTA5NGY3NTA3YjUyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVWM2YmdZdXBZdXRLMlpaSzRMQ1hPTnNBRGgwcWdDUzg0enJOam5WQW9keWhFQ05BTXZjd0VZYzJpQTlRSGdIYiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 01/12] build-appliance: Drop test which is already	automated
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
X-List-Received-Date: Wed, 14 Nov 2018 08:05:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmcgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXSAN
ClNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMTIsIDIwMTggNzo0NCBQTQ0KVG86IFllb2gsIEVlIFBl
bmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAwMS8xMl0gYnVpbGQt
YXBwbGlhbmNlOiBEcm9wIHRlc3Qgd2hpY2ggaXMgYWxyZWFkeSBhdXRvbWF0ZWQNCg0KT24gTW9u
LCAyMDE4LTExLTEyIGF0IDAxOjQxICswMDAwLCBZZW9oLCBFZSBQZW5nIHdyb3RlOg0KPiBJIHJl
YWxpemUgdGhlIGV4ZWN1dGlvbiBhY3Rpb24gaW5zaWRlICJidWlsZC1hcHBsaWFuY2UuYnVpbGQt
IA0KPiBhcHBsaWFuY2UuQml0YmFrZV9idWlsZC1hcHBsaWFuY2UtaW1hZ2UiIHdhcyBub3QgY29t
cGxldGUuIEFjdHVhbGx5IA0KPiB0aGlzIHBhcnRpY3VsYXIgdGVzdCB3YXMgdGVzdGluZyB0aGF0
IHVzaW5nIGJ1aWxkLWFwcGxpYW5jZS1pbWFnZSBhbmQgDQo+IHZtd2FyZSwgb25lIGNhbiBiaXRi
YWtlIGJ1aWxkLWFwcGxpYW5jLWltYWdlLiBUaGlzIHdhcyBkaWZmZXJlbnQgDQo+IGNvbXBhcmUg
dGhlIGF1dG9tYXRlZCB0ZXN0cyBpbnNpZGUgQUIgd2hlcmUgaXQgdGVzdCB0aGF0IGJpdGJha2Ug
Y2FuIA0KPiBidWlsZC1hcHBsaWFuY2UtaW1hZ2UuDQo+IA0KPiBUaGUgY29ycmVjdCBzdGVwcyBm
b3IgImJ1aWxkLWFwcGxpYW5jZS5idWlsZC1hcHBsaWFuY2UuQml0YmFrZV9idWlsZC0NCj4gYXBw
bGlhbmNlLWltYWdlIiBzaGFsbCBiZSBiZWxvdy4gQWxsb3cgdXMgdG8gc3VibWl0IGEgcGF0Y2gg
dG8gYWRkIHRoZSANCj4gbWlzc2luZyBkZXRhaWwgZm9yIHRoaXMgdGVzdC4NCj4gDQo+IFN0ZXBz
IHRvIFJlcHJvZHVjZSA6DQo+IDEuIEdldCBidWlsZCBhcHBsaWFuY2UgaW1hZ2UgZnJvbSBmb2xs
b3dpbmcgbGluaw0KPiANCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL3JlbGVhc2Vz
L3lvY3RvLTIuNi5yYzEvYnVpbGQtYXBwbGlhbmNlL1lvY3RvX0J1aWxkX0FwcGxpYW5jZS56aXAN
Cj4gDQo+IDIuIGJvb3QgdGhlIGJ1aWxkIGFwcGxpYW5jZSBpbWFnZSBpbiB2bXdhcmUuDQo+IA0K
PiAzLiBTZXQgTUFDSElORSB0byBxZW11eDg2IGFuZCBhZGQgdGhlIGZvbGxvd2luZyBsaW5lIHRv
IA0KPiBjb25mL2xvY2FsLmNvbmYgOg0KPiBTUkNSRVZfcG4tYnVpbGQtYXBwbGlhbmNlLWltYWdl
ID0gIiQNCj4gDQo+IHtBVVRPUkVWfQ0KPiAiDQo+IDQuIFJ1biAiYml0YmFrZSBidWlsZC1hcHBs
aWFuY2UtaW1hZ2UiDQo+IA0KPiBJIGFtIHNvcnJ5IGZvciB0aGUgY29uZnVzaW9uIGl0IGNyZWF0
ZWQuDQoNCkluIHRoYXQgY2FzZSB3b3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8gY29tYmlu
ZSB0aGVzZSBzdGVwcyB3aXRoIHNvbWUgb2YgdGhlIG90aGVyIGJ1aWxkIGFwcGxpYW5jZSB0ZXN0
cz8gV2UgY291bGQgYWRkIGFuIGV4dHJhIHN0ZXAgd2hlcmUgdGhlIHRlc3RlciBidWlsZHMgYnVp
bGQtYXBwbGlhbmNlIHJhdGhlciB0aGFuIGhhdmluZyBtdWx0aXBsZSB0ZXN0cyB3aGljaCBzdGFy
dCAibGF1bmNoIGJ1aWxkIGFwcGxpYW5jZSI/DQoNCkluIGdlbmVyYWwsIFByb3MgJiBDb25zIGZv
ciBtZXJnaW5nIHRlc3QgY2FzZXMsIFByb3M6IHJlZHVjZWQgdGhlIG51bWJlciBvZiB0ZXN0IGNh
c2VzICYgbWFraW5nIGl0IHNpbXBsZXIgZm9yIHJlYWRpbmcsIENvbnM6IGxvc3Mgb2YgbG93ZXIg
bGV2ZWwgdHJhY2tpbmcgb24gdGhlIHRlc3Qgc3RhdHVzLiANCkV4YW1wbGU6IGN1cnJlbnRseSB3
ZSBoYXZlIG11bHRpcGxlIHRlc3QgY2FzZXMgZm9yIGJ1aWxkLWFwcGxpYW5jZSB3aGVyZSBlYWNo
IHRlc3QgY2FzZXMgdGVzdGluZyB0aGUgYWJpbGl0eSB0byB1c2UgYnVpbGQtYXBwbGlhbmNlLWlt
YWdlIHRvIGJpdGJha2UgZGlmZmVyZW50IHR5cGUgb2YgaW1hZ2VzIChyZWNlbnRseSB3ZSBkZXRl
Y3QgdGhhdCBidWlsZC1hcHBsaWFuY2UtaW1hZ2Ugd2FzIGFibGUgdG8gYnVpbGQgY29yZS1pbWFn
ZS1taW5pbWFsICYgY29yZS1pbWFnZS1zYXRvLXNkayBidXQgaXQgZmFpbGVkIHRvIGJ1aWxkIHRo
ZSBidWlsZC1hcHBsaWFuY2UtaW1hZ2UpLCBpZiB3ZSBtZXJnZSBtdWx0aXBsZSB0ZXN0IGNhc2Vz
IGludG8gZ2VuZXJhbCB0ZXN0X2J1aWxkX2FwcGxpYW5jZV9jYW5fYnVpbGRfaW1hZ2VzLCB0aGVu
IHdlIHdpbGwgbG9zcyB0aGUgdmlzaWJpbGl0aWVzIG9uIHdoaWNoIHR5cGUgb2YgaW1hZ2VzIGZh
aWxlZCB3aGVuIHRoaXMgdGVzdCBmYWlsZWQsIHVubGVzcyB3ZSBsb29rZWQgaW50byB0aGUgdGVz
dCBsb2cgaWYgdGVzdCBsb2cgd2VyZSBnZW5lcmF0ZWQuICANCg0KQ2hlZXJzLA0KDQpSaWNoYXJk
DQoNCg0KDQo=

