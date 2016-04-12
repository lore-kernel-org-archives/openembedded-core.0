Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.44])
	by mail.openembedded.org (Postfix) with ESMTP id BC4AE6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 11:11:49 +0000 (UTC)
Received: from 1apwEW-00074o-Us by out11a.electric.net with emc1-ok (Exim 4.85)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1apwEW-00075L-Vt; Tue, 12 Apr 2016 04:11:48 -0700
Received: by emcmailer; Tue, 12 Apr 2016 04:11:48 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11a.electric.net with smtp (Exim 4.85)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1apwEW-00074o-Us; Tue, 12 Apr 2016 04:11:48 -0700
Received: from SESTOEX09.enea.se ([fe80::94d8:372f:210c:b4da]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0294.000; Tue, 12 Apr 2016 13:11:48 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH][fido] bind: CVE-2016-1285 CVE-2016-1286
Thread-Index: AQHRkVZtOvrfQxTvQkOkjDrFggpzjJ+GEVoAgAAj1/A=
Date: Tue, 12 Apr 2016 11:11:47 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48ABBA7F11@sestoex09.enea.se>
References: <1460092326-34326-1-git-send-email-sona.sarmadi@enea.com>
	<1460458938.3309.7.camel@linux.intel.com>
In-Reply-To: <1460458938.3309.7.camel@linux.intel.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-PolicySMART: 6030817
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: Re: [PATCH][fido] bind: CVE-2016-1285 CVE-2016-1286
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
X-List-Received-Date: Tue, 12 Apr 2016 11:11:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBndWVzcyB5b3UgbmVlZCB0aGlzIHBhdGNoOiBodHRwczovL3NvdXJjZS5pc2Mub3JnL2NnaS1i
aW4vZ2l0d2ViLmNnaT9wPWJpbmQ5LmdpdDthPXBhdGNoO2g9YTA3OGM5ZWVhZThjMmRiN2VkZjJi
MTVmZjFkMjVhM2EyOTdjNzUxDQoNCkNhbiBJIHNlbmQgeW91IGEgbmV3IHBhdGNoIG9yIGNhbiB5
b3UgYWRkIHRoaXM/IA0KDQoNCj4gVW5mb3J0dW5hdGVseSBJIGNhbid0IGJ1aWxkIGJpbmQgd2l0
aCB0aGlzIHBhdGNoIGFwcGxpZWQ6DQo+IA0KPiB8IGNjLmM6IEluIGZ1bmN0aW9uICd2ZXJpZnkn
Og0KPiB8IGNjLmM6MjkzOjI3OiBlcnJvcjogJ2htYWMnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKQ0KPiB8wqDCoMKgaWYgKCFpc2NjY19zZXhwcl9iaW5hcnlwKGhtYWMp
KQ0KPiB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBeDQo+IHwgY2MuYzoyOTM6Mjc6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVy
IGlzIHJlcG9ydGVkIG9ubHkgb25jZQ0KPiBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGlu
DQo+IHwgbWFrZVsyXTogKioqIFtjYy5vXSBFcnJvciAxDQo+IA0KPiBCYXNlZCBvbiBhIHF1aWNr
IHNraW0gcmVhZCBvZiB0aGUgcGF0Y2hlcyBJIHRoaW5rIHRoaXMgaXMgY2F1c2VkIGJ5wqBDVkUt
DQo+IDIwMTYtMTI4NS5wYXRjaDoNCj4gDQoNCg==

