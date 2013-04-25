Received: from mail1.bemta3.messagelabs.com ([195.245.230.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nick.lewis@usa.g4s.com>) id 1UVJhD-0006NQ-KJ
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 12:46:36 +0200
Received: from [85.158.137.3:43658] by server-9.bemta-3.messagelabs.com id
	72/78-32531-0C309715; Thu, 25 Apr 2013 10:21:52 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-10.tower-38.messagelabs.com!1366885311!16198505!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.8.6.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1441 invoked from network); 25 Apr 2013 10:21:52 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-10.tower-38.messagelabs.com with RC4-SHA encrypted SMTP;
	25 Apr 2013 10:21:52 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Thu, 25 Apr 2013
	11:21:51 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: 'Richard Purdie' <richard.purdie@linuxfoundation.org>
Date: Thu, 25 Apr 2013 11:21:51 +0100
Thread-Topic: [OE-core] Problems with PACKAGE_CLASSES = "package_tar"
Thread-Index: Ac5BCNuXpP6CdjsBSeGg13F8pgpSEgAk5jFw
Message-ID: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540D1@GBTWK10E001.Technology.local>
References: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540CC@GBTWK10E001.Technology.local>
	<1366820905.23738.153.camel@ted>
In-Reply-To: <1366820905.23738.153.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problems with PACKAGE_CLASSES = "package_tar"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 10:46:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pj4gSSBhbSBzZWVpbmcgcHJvYmxlbXMgd2hlbiB1c2luZyBQQUNLQUdFX0NMQVNTRVMgPSAicGFj
a2FnZV90YXIiDQo+Pg0KPj4gVGhlcmUgYXJlIG1hbnkgd2FybmluZ3MgYWJvdXQgcHl0aG9uIGlu
ZGVudHMgYW5kIHRoZXJlIGFyZSBlcnJvcnMNCj4+IHJlZ2FyZGluZyBtaXNzaW5nIHBvcHVsYXRl
X3Nka190YXIuYmJjbGFzcyBhbmQgcm9vdGZzX3Rhci5iYmNsYXNzDQo+DQo+V2l0aCAxLjMgKGRh
bm55KT8gVGhlc2Ugc2hvdWxkIGJlIGZpeGVkIGluIDEuNCAoZHlsYW5kKSBhbmQgbWFzdGVyLi4u
DQoNClJpY2hhcmQNCkkgaGF2ZSB0cmllZCBjaGVycnkgcGlja2luZyBmcm9tIER5bGFuIGJ1dCBp
dCBhbHNvIHNlZW1zIHRvIGJlIG1pc3NpbmcgcG9wdWxhdGVfc2RrX3Rhci5iYmNsYXNzIGFuZCBy
b290ZnNfdGFyLmJiY2xhc3MNCkRvZXMgRHlsYW4gc3VwcG9ydCBQQUNLQUdFX0NMQVNTRVMgPSAi
cGFja2FnZV90YXIiIHdpdGhvdXQgdGhlc2UgY2xhc3Nlcz8NCi0tDQpOaWNrDQoNCg0KDQpUaGUg
ZGV0YWlscyBvZiB0aGlzIGNvbXBhbnkgYXJlIGFzIGZvbGxvd3M6DQpHNFMgVGVjaG5vbG9neSBM
aW1pdGVkLCBSZWdpc3RlcmVkIE9mZmljZTogQ2hhbGxlbmdlIEhvdXNlLCBJbnRlcm5hdGlvbmFs
IERyaXZlLCBUZXdrZXNidXJ5LCBHbG91Y2VzdGVyc2hpcmUgR0wyMCA4VVEsIFJlZ2lzdGVyZWQg
aW4gRW5nbGFuZCBOby4gMjM4MjMzOC4NCg0KVGhpcyBjb21tdW5pY2F0aW9uIG1heSBjb250YWlu
IGluZm9ybWF0aW9uIHdoaWNoIGlzIGNvbmZpZGVudGlhbCwgcGVyc29uYWwgYW5kL29yIHByaXZp
bGVnZWQuDQoNCkl0IGlzIGZvciB0aGUgZXhjbHVzaXZlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVj
aXBpZW50KHMpLg0KSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKSwgcGxl
YXNlIG5vdGUgdGhhdCBhbnkgZGlzdHJpYnV0aW9uLCBmb3J3YXJkaW5nLCBjb3B5aW5nIG9yIHVz
ZSBvZiB0aGlzIGNvbW11bmljYXRpb24gb3IgdGhlIGluZm9ybWF0aW9uIGluIGl0IGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQuDQoNCkFueSBwZXJzb25hbCB2aWV3cyBleHByZXNzZWQgaW4gdGhpcyBl
LW1haWwgYXJlIHRob3NlIG9mIHRoZSBpbmRpdmlkdWFsIHNlbmRlciBhbmQgdGhlIGNvbXBhbnkg
ZG9lcyBub3QgZW5kb3JzZSBvciBhY2NlcHQgcmVzcG9uc2liaWxpdHkgZm9yIHRoZW0uDQoNClBy
aW9yIHRvIHRha2luZyBhbnkgYWN0aW9uIGJhc2VkIHVwb24gdGhpcyBlLW1haWwgbWVzc2FnZSwg
eW91IHNob3VsZCBzZWVrIGFwcHJvcHJpYXRlIGNvbmZpcm1hdGlvbiBvZiBpdHMgYXV0aGVudGlj
aXR5Lg0KDQpUaGlzIGUtbWFpbCBoYXMgYmVlbiBzY2FubmVkIGZvciBhbGwgdmlydXNlcyBieSBN
ZXNzYWdlTGFicy4NCg==


