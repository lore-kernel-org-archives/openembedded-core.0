Return-Path: <michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF8971B57
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 13:29:31 +0000 (UTC)
X-AuditID: 0a000213-38bff7000000094f-2c-5936ae380b8c
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	B8.B6.02383.83EA6395; Tue,  6 Jun 2017 08:29:31 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Tue, 6 Jun 2017 08:29:28 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Jonathan Liu <net147@gmail.com>
Thread-Topic: [OE-core] [oe-core] DISK_SIGNATURE no longer functional
Thread-Index: AdLRjNlT3YpLq7j4SnSX4LjtvYzswQM9ztKAABEshSA=
Date: Tue, 6 Jun 2017 13:29:28 +0000
Message-ID: <655290B7709079438B7932553958E60DA1311709@ESS-EX01.essvote.corp.local>
References: <655290B7709079438B7932553958E60DA13093A0@ESS-EX01.essvote.corp.local>
	<CANwerB2eshSg18OsfbP7fA=EyFBBnrON-PvqeXTRkZrfFngFvQ@mail.gmail.com>
In-Reply-To: <CANwerB2eshSg18OsfbP7fA=EyFBBnrON-PvqeXTRkZrfFngFvQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWyRiBPQ9d6nVmkwfp+ZYtDN88wWtz5+Y7d
	gclj56y77B7nNq5gDGCK4rJJSc3JLEst0rdL4MpY9yemYBZ3xY+bn1kbGL9wdTFyckgImEhM
	u/+AsYuRi0NI4ASjxPmdK1lAEkICMxkllp6pBbHZBIwkzl3fxAhiiwgoSxz6PBeshlkgWuLO
	7zPsILawgItEz/HrbBA1rhKrjk1mh7CtJBb8mAZWzyKgIvFn9i4mEJtXIEhi07Xj7BCLgXbd
	X/QSbAGnQKDEjG3NYM2MAmIS30+tYYJYJi5x68l8JoirBSSW7DnPDGGLSrx8/I8VwpaTeNfU
	BmRzANVrSqzfpQ/RqigxpfshO8ReQYmTM5+wTGAUnYVk6iyEjllIOmYh6VjAyLKKUTA3MTPH
	UC+1uLgsvyRVLzk/dxMjMDa4GJiEdzAumBF7iFGAg1GJh7chyjRSiDWxrLgy9xCjNAeLkjjv
	zWeqkUIC6YklqdmpqQWpRfFFpTmpxYcYmTg4QQSXVAPjQUXzVyVGNuq6s88vnR64Jicl+IjC
	ks9B3nkCUcUmk9lnTvvzXln87injbuH07lC95WuY8iZGen9tyVSwZ5heNf+6amelpnXUu7hs
	1qzgpNl6zokvii/KzXm82GjSsdvGWTHf3lw1td0u9Xm1lbbSK4vmGz8faIeY8fJyzFh4Uu12
	/8olRycosRRnJBpqMRcVJwIAil2Z9XMCAAA=
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
X-List-Received-Date: Tue, 06 Jun 2017 13:29:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHlyby4NCg0KR3Vlc3Npbmcgc29tZXRoaW5nIHdpdGggYWxsIHRoZSBuZXcgd2ljIGFkZGl0aW9u
cyBraWxsZWQgaXQuDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEpvbmF0
aGFuIExpdSBbbWFpbHRvOm5ldDE0N0BnbWFpbC5jb21dIA0KU2VudDogTW9uZGF5LCBKdW5lIDA1
LCAyMDE3IDc6MTcgUE0NClRvOiBEYXZpcywgTWljaGFlbA0KQ2M6IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW29lLWNvcmVd
IERJU0tfU0lHTkFUVVJFIG5vIGxvbmdlciBmdW5jdGlvbmFsDQoNCkhpIE1pY2hhZWwsDQoNCk9u
IDIxIE1heSAyMDE3IGF0IDAzOjE2LCBEYXZpcywgTWljaGFlbCA8bWljaGFlbC5kYXZpc0Blc3N2
b3RlLmNvbT4gd3JvdGU6DQo+IEkgYW0gdHJ5aW5nIHRvIGNyZWF0ZSBhIGdlbmVyaWMgTVNET1Mg
UENfQklPUyBoZGRkaXJlY3QgaW1hZ2Ugd2l0aCBhIHJvb3QNCj4gcGFydGl0aW9uIHNldCBieSB0
aGUgRElTS19TSUdOQVRVUkUuDQo+DQo+IFNZU0xJTlVYX1JPT1QgPSAicm9vdD1QQVJUVVVJRD0k
e0RJU0tfU0lHTkFUVVJFfS0wMiINCj4NCj4NCj4NCj4gSG93ZXZlciB0aGUgc2lnbmF0dXJlIGdl
bmVyYXRlZCBpbiBzeXNsaW51eC5jZmcgYW5kIHRoZSBvbmUgb24gdGhlIGRpc2sNCj4gZG9u4oCZ
dCBtYXRjaC4NCj4NCj4gSSB0cmllZCBkZWZpbmluZyBteSBvd24gc2lnbmF0dXJlIGFuZCB0aGUg
b25lIGluIHN5c2xpbnV4IGNoYW5nZXMsIGJ1dCB0aGUNCj4gb25lIG9uIHRoZSBkaXNrIGRvZXNu
4oCZdCBtYXRjaC4NCj4NCj4NCj4NCj4gcm9vdD1QQVJUVVVJRD0yMmFhZjgzYi0wMg0KPg0KPg0K
Pg0KPiBOQU1FICAgUEFSVFVVSUQNCj4NCj4gc2RkDQo+DQo+IOKUnOKUgHNkZDIgMzQxZTg0YTct
MDINCj4NCj4g4pSc4pSAc2RkMyAzNDFlODRhNy0wMw0KPg0KPiDilJTilIBzZGQxIDM0MWU4NGE3
LTAxDQoNCldoaWNoIHJlbGVhc2UgZGlkIERJU0tfU0lHTkFUVVJFIHN0b3Agd29ya2luZz8NCg0K
UmVnYXJkcywNCkpvbmF0aGFuDQo=

