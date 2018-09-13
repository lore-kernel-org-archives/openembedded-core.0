Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 822CA7951E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 01:07:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2018 18:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,367,1531810800"; d="scan'208";a="262134881"
Received: from pgsmsx106.gar.corp.intel.com ([10.221.44.98])
	by fmsmga005.fm.intel.com with ESMTP; 12 Sep 2018 18:07:50 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.29]) by
	PGSMSX106.gar.corp.intel.com ([169.254.9.119]) with mapi id
	14.03.0319.002; Thu, 13 Sep 2018 09:07:49 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] test-result-log: testcase management tool to
	store test result
Thread-Index: AQHUSeFmm41iiixcvUupj0GTg9X3LqTtaE0A
Date: Thu, 13 Sep 2018 01:07:48 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335EA8A4E@PGSMSX109.gar.corp.intel.com>
References: <1535526306-26126-1-git-send-email-ee.peng.yeoh@intel.com>
	<87f876151d5929e1fd83be41d255d594dd3694f6.camel@linuxfoundation.org>
In-Reply-To: <87f876151d5929e1fd83be41d255d594dd3694f6.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGMxMDAyODQtYmUzMy00ZWY4LWEwMTgtZjlhM2Y2MzcwNWMyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidGlIb0Ixd1IxaUw2YmRtbzFIUDllOVJIenhsYU9CQ1JVUlwvVUFyR01DZzRNZ3dZdUR3aUdPNEpVRXZmQ0NqRHMifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH] test-result-log: testcase management tool to store test result
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
X-List-Received-Date: Thu, 13 Sep 2018 01:07:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KR3JlYXQgdGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrcyENCkkgd2lsbCB3
b3JrIG9uIHRoZSBpbXByb3ZlbWVudCB0byBhZGRyZXNzIHlvdXIgY29uY2VybnMuIA0KDQpCZXN0
IHJlZ2FyZHMsDQpFZSBQZW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnIFttYWlsdG86cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZ10gDQpTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMTgg
MTE6MDkgUE0NClRvOiBZZW9oLCBFZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwuY29tPjsgb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0hdIHRlc3QtcmVzdWx0LWxvZzogdGVzdGNhc2UgbWFuYWdlbWVudCB0b29sIHRv
IHN0b3JlIHRlc3QgcmVzdWx0DQoNCkhpIEVlIFBlbmcsDQoNCkkndmUgYmVlbiBoYXZpbmcgYSBs
b29rIGF0IHRoaXMgY29kZSBhbmQgd2hpbHN0IHNvbWUgb2YgaXQgaXMgZ29vZCwgSSBhbHNvIGhh
dmUgc29tZSBjb25jZXJucy4gV2l0aCBpdCBjb21pbmcgaW4gc28gbGF0ZSBpbiB0aGUgY3ljbGUs
IGl0cyBtYWRlIGl0IGhhcmQgdG8gaGF2ZSB0aW1lIHRvIHJldmlldyBpdCBhbmQgYWxsb3cgdGlt
ZSB0byBnZXQgaXQgcmlnaHQuDQpXaXRoIHNvbWV0aGluZyBhcyBpbXBvcnRhbnQgYXMgdGhpcyB0
byB0aGUgd2F5IHRoZSBmdXR1cmUgUUEgd29yayBpcyBkb25lLCB3ZSBkbyBuZWVkIHRvIGVuc3Vy
ZSB3ZSB1c2UgdGhlIHJpZ2h0IGFwcHJvYWNoIGFuZCB0aGF0IGl0cyBtYWludGFpbmFibGUuDQoN
ClRoZSBwYXRjaGVzIGFyZSBvayBhcyBhIGZpcnN0IGF0dGVtcHQgYXQgdGhpcy4gTXkgYmlnZ2Vz
dCBjb25jZXJuIGlzIHRoYXQgaXRzIGN1cnJlbnRseSBwYXJzaW5nIGxvZyBmaWxlcyB3aGljaCB3
ZSBjb250cm9sIGFuZCBnZW5lcmF0ZSB3aXRoaW4gb3V0IG93biBjb2RlYmFzZSBhbmQgdGhhdCBw
YXJzaW5nIGlzIGxpa2VseSB0byBicmVhay4gSW4gcGFydGljdWxhciwgdGhlc2UgbGluZXMgd29y
cnkgbWUgZnJvbSB0aGUgcWFsb2dwYXJzZXI6DQoNCnJlZ2V4ID0gIi4qUkVTVUxUUyAtICg/UDxj
YXNlX25hbWU+LiopIC0gVGVzdGNhc2UgLio6ICg/UDxzdGF0dXM+UEFTU0VEfEZBSUxFRHxTS0lQ
UEVEfEVSUk9SfFVOS05PV04pLiokIg0KcmVnZXggPSAiY29yZS1pbWFnZS4qKCkuKlJhbi4qdGVz
dHMgaW4gLipzIg0KcmVnZXggPSAiREVCVUc6IGxhdW5jaGNtZD1ydW5xZW11Kg0KcWVtdV9saXN0
ID0gWydxZW11YXJtJywgJ3FlbXVhcm02NCcsICdxZW11bWlwcycsICdxZW11bWlwczY0JywgJ3Fl
bXVwcGMnLCAncWVtdXg4NicsICdxZW11eDg2LTY0J10NCg0Kc2luY2UgaGVyZSB3ZSdyZSBoYXJk
Y29kaW5nIHRoZSBsaXN0IG9mIHFlbXUncyB3ZSBzdXBwb3J0LCB3ZSdyZSBhbHNvIG9ubHkgYWxs
b3dpbmcgY29yZS1pbWFnZS0qIGFuZCB3ZSdyZSByZWx5aW5nIHVwb24gdGhlIHJlc3VsdHMgZm9y
bWF0IG5vdCBjaGFuZ2luZy4gVGhhdCBtYWtlcyBpdCBoYXJkIGZvciBhbnlvbmUgdG8gZXh0ZW5k
L3JldXNlIHRoaXMgb3IgdG8gdXNlIGl0IHdpdGggcmVhbCBoYXJkd2FyZT8NCg0KRm9yIGV4YW1w
bGUgdGhlIHJlY2VudCBvZS1zZWxmdGVzdCBwYXJhbGxlbGlzYXRpb24gY29kZSBkaWQgY2hhbmdl
IHRoZSBvdXRwdXQgb2YgdGhlIHRlc3RzIHNsaWdodGx5LiBJJ20gbm90IHN1cmUgaWYgdGhpcyBi
cm9rZSB0aGUgcGFyc2luZyBvciBub3QgYnV0IGl0IGlzIGFuIGV4YW1wbGUgb2YgdGhlIGtpbmQg
b2YgZnJhZ2lsaXR5IHRoaXMgY29kZSBoYXMuDQoNCldoYXQgd291bGQgcHJvYmFibHkgd29yayBi
ZXR0ZXIgZm9yIHVzIGlzIGlmIHRoZSBvZXFhIGZyYW1ld29yayB3cm90ZSBvdXQgYSBqc29uIGZp
bGUgZGlyZWN0bHkgY29udGFpbmluZyB0aGUgaW5mb3JtYXRpb24gd2UgbmVlZCBpbiBpdCwgdGhl
biB0aGlzIGNvZGUgd291bGQganVzdCBuZWVkIHRvIGNvbGxlY3QgdXAgdGhlIGpzb24gZmlsZXMu
DQoNCkknbSBhbHNvIGEgbGl0dGxlIGNvbmNlcm5lZCBhdCB0aGUgd2F5IHVuaXR0ZXN0IGRpc2Nv
dmVyeSBpcyBiZWluZyBkb25lLCBncmVwcGluZyBmb3IgKi5weSBmaWxlcyBhcyBmYXIgYXMgSSB1
bmRlcnN0YW5kIGl0LiBXZSBzaG91bGQgcHJvYmFibHkgdXNlIHRoZSBsaXN0IG9wdGlvbnMgdG8g
dGhlIHZhcmlvdXMgY3VycmVudCB0ZXN0IHBpZWNlcz8gQWxzbywgdGhpcyBpcyBzb21ldGhpbmcg
d2UgcHJvYmFibHkgb25seSBldmVyIG5lZWQgdG8gZG8gb25jZSB0byBzZWVkIHRoZSBRQSByZXN1
bHRzIHN0b3JlPw0KDQpGaW5hbGx5LCBtdWNoIG9mIHRoZSBjb2RlIGlzIHVzaW5nICJpbnRlcm5h
bCIgbWV0aG9kcyBwcmVmaXhlZCB3aXRoICJfIi4gSSBjYW4gdW5kZXJzdGFuZCB3aHkgYnV0IGl0
IHNlZW1zIHRoZSBjb2RlIGRvZXNuJ3QgaGF2ZSBhIGdvb2Qgd2VsbCBzdHJ1Y3R1cmVkIHB1Ymxp
YyBBUEkgYXMgYSByZXN1bHQuDQoNCkFzIHN1Y2ggdGhlcmUgbWF5IG1lIGEgbGl0dGxlIHRvbyBt
dWNoIHdvcmsgbmVlZGVkIG9uIHRoaXMgdG8gZ2V0IGl0IGluIGZvciAyLjYgOigNCg0KQ2hlZXJz
LA0KDQpSaWNoYXJkDQo=

