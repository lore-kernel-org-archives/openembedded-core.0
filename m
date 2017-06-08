Return-Path: <michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 33E707827A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 14:37:03 +0000 (UTC)
X-AuditID: 0a000213-38bff7000000094f-d8-5939610de5c4
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	B9.73.02383.D0169395; Thu,  8 Jun 2017 09:37:04 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Thu, 8 Jun 2017 09:37:01 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Jonathan Liu <net147@gmail.com>
Thread-Topic: [OE-core] [oe-core] DISK_SIGNATURE no longer functional
Thread-Index: AdLRjNlT3YpLq7j4SnSX4LjtvYzswQM9ztKAABEshSAAHF/wgAAbk+xwADI3LoAAAzajsA==
Date: Thu, 8 Jun 2017 14:37:00 +0000
Message-ID: <655290B7709079438B7932553958E60DA1312ADA@ESS-EX01.essvote.corp.local>
References: <655290B7709079438B7932553958E60DA13093A0@ESS-EX01.essvote.corp.local>
	<CANwerB2eshSg18OsfbP7fA=EyFBBnrON-PvqeXTRkZrfFngFvQ@mail.gmail.com>
	<655290B7709079438B7932553958E60DA1311709@ESS-EX01.essvote.corp.local>
	<CANwerB2o98GhytVTMtG97AGjS+dnFEKaq9BsSNv27X=XFGwzKQ@mail.gmail.com>
	<655290B7709079438B7932553958E60DA131231B@ESS-EX01.essvote.corp.local>
	<CANwerB01SW-s_jBHv+1nykCU5WHR2eQ6xPHbi7cJ=_txbEEzpg@mail.gmail.com>
In-Reply-To: <CANwerB01SW-s_jBHv+1nykCU5WHR2eQ6xPHbi7cJ=_txbEEzpg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWyRiBPQ1cg0TLS4MtzRYtDN88wWtz5+Y7d
	gclj56y77B7nNq5gDGCK4rJJSc3JLEst0rdL4Mp4MmUfW8EriYr9H66wNTDOkOhi5OSQEDCR
	uLHnFmMXIxeHkMAJRom2q3vZIJyZjBI7Lv5nA6liEzCSOHd9EyOILSKgLHHo81wWEJtZIFri
	zu8z7CC2sICLRM/x62wQNa4Sq45NZoewwyTevv3CBGKzCKhITHvRBmbzCgRJnGhYxAqxbCez
	xPZVDawgCU6BQIk1LcvAljEKiEl8P7WGCWKZuMStJ/OZIM4WkFiy5zwzhC0q8fLxP1YIW07i
	XVMbkM0BVK8psX6XPkSrosSU7ofsEHsFJU7OfMIygVF0FpKpsxA6ZiHpmIWkYwEjyypGwdzE
	zBxDvdTi4rL8klS95PzcTYzA+OBiYBLewbhgRuwhRgEORiUe3oQIy0gh1sSy4srcQ4zSHCxK
	4rxioRaRQgLpiSWp2ampBalF8UWlOanFhxiZODhBBJdUA2Ods43od9lN7OvUHtzMXb9+o975
	8pfWQZey/sl0nJbxqppzxmhO0PSXntXzmox2JVl2G/kEf7Nuiny483tj1C31sw2T/pz/+Xff
	rollFkodNlPYTh3qDzm0qDA4pTHwprx+8K7Ikh3n/1+7a1rydd7jT/a5IS23dSXklCJ2dqkf
	vvvYvSupUUCJpTgj0VCLuag4EQA+QsTzdQIAAA==
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: DISK_SIGNATURE no longer functional
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
X-List-Received-Date: Thu, 08 Jun 2017 14:37:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Sm9uYXRoYW4sDQoNClllcCB0aGF0IGZpeGVkIGl0Lg0KDQpUaGFua3MsDQpNaWtlDQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEpvbmF0aGFuIExpdSBbbWFpbHRvOm5ldDE0
N0BnbWFpbC5jb21dIA0KU2VudDogVGh1cnNkYXksIEp1bmUgMDgsIDIwMTcgNjowOCBBTQ0KVG86
IERhdmlzLCBNaWNoYWVsDQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbb2UtY29yZV0gRElTS19TSUdOQVRVUkUgbm8g
bG9uZ2VyIGZ1bmN0aW9uYWwNCg0KSGkgTWljaGFlbCwNCg0KSSBoYXZlIHNlbnQgYSBwYXRjaCB0
byB0aGUgbWFpbGluZyBsaXN0IGFuZCBDQy1lZCB5b3UuDQpMZXQgbWUga25vdyBpZiBpdCBmaXhl
cyB0aGUgaXNzdWUuDQoNClJlZ2FyZHMsDQpKb25hdGhhbg0KDQpPbiA4IEp1bmUgMjAxNyBhdCAw
MjoxMiwgRGF2aXMsIE1pY2hhZWwgPG1pY2hhZWwuZGF2aXNAZXNzdm90ZS5jb20+IHdyb3RlOg0K
PiBJIHRyaWVkIHVzaW5nICBST09UX1ZNID0gInJvb3Q9UEFSVFVVSUQ9JHtESVNLX1NJR05BVFVS
RX0tMDIiDQo+DQo+IFRoZSByZXN1bHRpbmcgUEFSVFVVSUQgaW4gc3lzbGludXggYXBwZW5kIGxp
bmUgc3RpbGwgZG9lc27igJl0IG1hdGNoIHRoZSBvbmUNCj4gb24gdGhlIGFjdHVhbCBkaXNrLg0K
Pg0KPg0KPg0KPg0KPg0KPiBGcm9tOiBKb25hdGhhbiBMaXUgW21haWx0bzpuZXQxNDdAZ21haWwu
Y29tXQ0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDA2LCAyMDE3IDU6MDEgUE0NCj4NCj4NCj4gVG86
IERhdmlzLCBNaWNoYWVsDQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW29lLWNvcmVdIERJU0tfU0lHTkFUVVJF
IG5vIGxvbmdlciBmdW5jdGlvbmFsDQo+DQo+DQo+DQo+IEhpIE1pY2hhZWwsDQo+DQo+DQo+DQo+
IFNlZSBodHRwczovL3BhdGNod29yay5vcGVuZW1iZWRkZWQub3JnL3BhdGNoLzEyODU2NS8uIFNZ
U0xJTlVYX1JPT1Qgd2FzDQo+IHJlbmFtZWQgdG8gUk9PVF9WTSBpbiBLcm9nb3RoLg0KPg0KPg0K
Pg0KPiBSZWdhcmRzLA0KPg0KPiBKb25hdGhhbg0KPg0KPg0KPg0KPiBPbiBUdWUuLCA2IEp1bi4g
MjAxNyBhdCAxMToyOSBwbSwgRGF2aXMsIE1pY2hhZWwgPG1pY2hhZWwuZGF2aXNAZXNzdm90ZS5j
b20+DQo+IHdyb3RlOg0KPg0KPiBQeXJvLg0KPg0KPiBHdWVzc2luZyBzb21ldGhpbmcgd2l0aCBh
bGwgdGhlIG5ldyB3aWMgYWRkaXRpb25zIGtpbGxlZCBpdC4NCj4NCj4NCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9uYXRoYW4gTGl1IFttYWlsdG86bmV0MTQ3QGdtYWls
LmNvbV0NCj4gU2VudDogTW9uZGF5LCBKdW5lIDA1LCAyMDE3IDc6MTcgUE0NCj4gVG86IERhdmlz
LCBNaWNoYWVsDQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW29lLWNvcmVdIERJU0tfU0lHTkFUVVJFIG5vIGxv
bmdlciBmdW5jdGlvbmFsDQo+DQo+IEhpIE1pY2hhZWwsDQo+DQo+IE9uIDIxIE1heSAyMDE3IGF0
IDAzOjE2LCBEYXZpcywgTWljaGFlbCA8bWljaGFlbC5kYXZpc0Blc3N2b3RlLmNvbT4gd3JvdGU6
DQo+PiBJIGFtIHRyeWluZyB0byBjcmVhdGUgYSBnZW5lcmljIE1TRE9TIFBDX0JJT1MgaGRkZGly
ZWN0IGltYWdlIHdpdGggYSByb290DQo+PiBwYXJ0aXRpb24gc2V0IGJ5IHRoZSBESVNLX1NJR05B
VFVSRS4NCj4+DQo+PiBTWVNMSU5VWF9ST09UID0gInJvb3Q9UEFSVFVVSUQ9JHtESVNLX1NJR05B
VFVSRX0tMDIiDQo+Pg0KPj4NCj4+DQo+PiBIb3dldmVyIHRoZSBzaWduYXR1cmUgZ2VuZXJhdGVk
IGluIHN5c2xpbnV4LmNmZyBhbmQgdGhlIG9uZSBvbiB0aGUgZGlzaw0KPj4gZG9u4oCZdCBtYXRj
aC4NCj4+DQo+PiBJIHRyaWVkIGRlZmluaW5nIG15IG93biBzaWduYXR1cmUgYW5kIHRoZSBvbmUg
aW4gc3lzbGludXggY2hhbmdlcywgYnV0IHRoZQ0KPj4gb25lIG9uIHRoZSBkaXNrIGRvZXNu4oCZ
dCBtYXRjaC4NCj4+DQo+Pg0KPj4NCj4+IHJvb3Q9UEFSVFVVSUQ9MjJhYWY4M2ItMDINCj4+DQo+
Pg0KPj4NCj4+IE5BTUUgICBQQVJUVVVJRA0KPj4NCj4+IHNkZA0KPj4NCj4+IOKUnOKUgHNkZDIg
MzQxZTg0YTctMDINCj4+DQo+PiDilJzilIBzZGQzIDM0MWU4NGE3LTAzDQo+Pg0KPj4g4pSU4pSA
c2RkMSAzNDFlODRhNy0wMQ0KPg0KPiBXaGljaCByZWxlYXNlIGRpZCBESVNLX1NJR05BVFVSRSBz
dG9wIHdvcmtpbmc/DQo+DQo+IFJlZ2FyZHMsDQo+IEpvbmF0aGFuDQo=

