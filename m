Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 2F2F072488
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 14:38:55 +0000 (UTC)
Received: from SESTOEX09.enea.se ([fe80::94d8:372f:210c:b4da]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Tue, 9 Dec 2014 15:38:54 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [daisy][PATCH] python: Building without SSLv3
	support , The POODLE Bites Again
Thread-Index: AdATsxnxF+PHOlqQTcumAqNSYBOmXA==
Date: Tue, 9 Dec 2014 14:38:53 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48257CB01F@sestoex09.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Cc: Maxin John <Maxin.John@enea.com>,
	'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] python: Building without SSLv3 support , The POODLE Bites Again
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
X-List-Received-Date: Tue, 09 Dec 2014 14:38:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

IEhpIFBhdWwsDQoNCj4gSSB0aGluayB3ZSBzaG91bGQgYXBwbHkgdGhlIHBhdGNoIG5vdyBhbnl3
YXk7IHdlJ2xsIHdhbnQgdG8ga25vdyB0aGF0IGl0DQo+IHdvcmtzIGZvciBiYWNrcG9ydHMgdG8g
dGhlIHN0YWJsZSBicmFuY2goZXMpLCBhbmQgaW4gYW55IGNhc2UgdGhlIHVwZ3JhZGUgdG8NCj4g
Mi43LjkgaXMgbm90IGdvaW5nIHRvIGJlIGEgc3RyYWlnaHRmb3J3YXJkIHRhc2sgYmFzZWQgdXBv
biBteSBlYXJsaWVyIGF0dGVtcHQNCj4gdG8gdXBncmFkZSB0byAyLjcuNiAodGhlIGN1cnJlbnQg
c3RhdGUgb2Ygd2hpY2ggaXMgc3RpbGwgaW4gcGF1bGUvcHl0aG9uMjc2LXdpcA0KPiBpbiBwb2t5
LWNvbnRyaWIpLg0KPiANCj4gQ2hlZXJzLA0KPiBQYXVsDQo+IA0KDQpJIGhhdmUgYXBwbGllZCB0
aGlzIHBhdGNoIGluIG1hc3RlciBhbmQgaGF2ZSBydW4gc29tZSB0ZXN0cyB0byB2ZXJpZnkgdGhh
dCANClNzbHYzIGlzIHJlYWxseSBkaXNhYmxlZC4gIEl0IHNlZW1zIHRoYXQgU1NMdjMgc3RpbGwg
aXMgZW5hYmxlZC4gSSBhbSBydW5uaW5nIG1vcmUgdGVzdHMgdG8gDQpmaW5kIG91dCB3aHkgU1NM
djMgaXMgbm90IGRpc2FibGVkIGFuZCB3aGF0IG1vcmUgbmVlZHMgdG8gYmUgZG9uZS4NCg0KU1NM
djIgaXMgZGlzYWJsZWQgYWxyZWFkeSwgaWYgd2UgbWFuYWdlIHRvIGRpc2FibGUgU1NMVjMgdGhl
biBJIGd1ZXNzIHdlIG5lZWQgdG8gZGlzYWJsZSBTU0x2MjMgYXMgd2VsbCA/PyENCg0Kcm9vdEBw
MjAyMHJkYjp+IyBweXRob24NCj4+PiBpbXBvcnQgc3NsDQo+Pj4gcHJpbnQgc3NsLlBST1RPQ09M
X1NTTHYzDQoxDQo+Pj4gcHJpbnQgc3NsLlBST1RPQ09MX1NTTHYyDQowDQo+Pj4gcHJpbnQgc3Ns
LlBST1RPQ09MX1NTTHYyMw0KMg0KDQpJIHRoaW5rIHdlIHNob3VsZCBjb25zaWRlciAoc3RhcnQg
bG9va2luZyBhdCB1cGdyYWRpbmcgdG8gcHl0aG9uIDIuNy45IGluIG1hc3RlciksIHRvIGFkZHJl
c3MgdGhpcyBpc3N1ZS4gSSBmZWVsIHVuY29tZm9ydGFibGUgd2l0aCB0aGlzIERlYmlhbiBwYXRj
aC4gSXQgc2VlbXMgdGhhdCAgd2UgbmVlZCB0byBkbyBtb3JlIG1hbnVhbCBjaGFuZ2VzIGluIG9y
ZGVyIHRvIG1ha2UgdGhpcyB3b3JrLiBJIHdpbGwgc29vbiB1cGRhdGUgdGhlIGJ1ZyA3MDE1IHdp
dGggbXkgdGVzdCByZXN1bHRzLiANCg0KV2hpbGUgdGVzdGluZyB0aGlzIGlzc3VlIGEgbmV3IHZ1
bG5lcmFiaWxpdHkgd2FzIHJlbGVhc2VkIHllc3RlcmRheSA6DQpJbmNvcnJlY3QgVExTIHBhZGRp
bmcgbWF5IGJlIGFjY2VwdGVkIHdoZW4gdGVybWluYXRpbmcgVExTIDEueCBDQkMgY2lwaGVyIGNv
bm5lY3Rpb25zLiAoQ1ZFLTIwMTQtODczMCkNCg0KaHR0cHM6Ly9zdXBwb3J0LmY1LmNvbS9rYi9l
bi11cy9zb2x1dGlvbnMvcHVibGljLzE1MDAwLzgwMC9zb2wxNTg4Mi5odG1sIA0KaHR0cHM6Ly9j
b21tdW5pdHkucXVhbHlzLmNvbS9ibG9ncy9zZWN1cml0eWxhYnMvMjAxNC8xMi8wOC9wb29kbGUt
Yml0ZXMtdGxzDQoNCkNoZWVycyBTb25hDQo=

