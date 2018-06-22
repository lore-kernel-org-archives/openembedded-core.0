Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 381CA784DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 11:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 85E0C18367;
	Fri, 22 Jun 2018 13:06:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 2axQ07TI4zuG; Fri, 22 Jun 2018 13:06:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C6DDA1835B;
	Fri, 22 Jun 2018 13:06:50 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A08AA1A067;
	Fri, 22 Jun 2018 13:06:50 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 934681A065;
	Fri, 22 Jun 2018 13:06:50 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 22 Jun 2018 13:06:50 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 866903058;
	Fri, 22 Jun 2018 13:06:50 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 22 Jun 2018 13:06:50 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 22 Jun 2018 13:06:50 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Fri, 22 Jun 2018 13:06:50 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alex Kiernan <alex.kiernan@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "juro.bystricky@intel.com"
	<juro.bystricky@intel.com>
Thread-Topic: [OE-core] reproducible_final_image_task failing when
	REPRODUCIBLE_TIMESTAMP_ROOTFS unset
Thread-Index: AQHUChkeb6mts6nDc0iYvs8wR9Egnw==
Date: Fri, 22 Jun 2018 11:06:50 +0000
Message-ID: <a8f064e60d3445f9ba11862f6efc5805@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: reproducible_final_image_task failing when REPRODUCIBLE_TIMESTAMP_ROOTFS unset
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
X-List-Received-Date: Fri, 22 Jun 2018 11:06:52 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_a8f064e60d3445f9ba11862f6efc5805XBOX02axiscom_"

--_000_a8f064e60d3445f9ba11862f6efc5805XBOX02axiscom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TXkgZ3Vlc3MgaXMgdGhhdCBpdCBpcyBleHBlY3RpbmcgUG9reSBhdCB0aGUgdG9wLiBIb3dldmVy
LCB0aGF0IGlzIGEgcHJldHR5IGJhZCBhc3N1bXB0aW9uLg0KDQovL1BldGVyDQoNCi0tLS0tLS0t
IE9yaWdpbmFsbWVkZGVsYW5kZSAtLS0tLS0tLQ0KRnLDpW46IEFsZXggS2llcm5hbiA8YWxleC5r
aWVybmFuQGdtYWlsLmNvbT4NCkRhdHVtOiAyMDE4LTA2LTIyIDEyOjIwIChHTVQrMDE6MDApDQpU
aWxsOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnLCBqdXJvLmJ5c3Ry
aWNreUBpbnRlbC5jb20NClJ1YnJpazogW09FLWNvcmVdIHJlcHJvZHVjaWJsZV9maW5hbF9pbWFn
ZV90YXNrIGZhaWxpbmcgd2hlbiBSRVBST0RVQ0lCTEVfVElNRVNUQU1QX1JPT1RGUyB1bnNldA0K
DQpJJ20gdHJ5aW5nIHRvIHVzZSBCVUlMRF9SRVBST0RVQ0lCTEVfQklOQVJJRVMsIGJ1dCBJIHRy
aXBwZWQgb3ZlciBhDQpwcm9ibGVtIHdoZW4gSSdkIG5vdCBzZXQgUkVQUk9EVUNJQkxFX1RJTUVT
VEFNUF9ST09URlMuDQoNCkluIHRoZSByZXByb2R1Y2libGVfZmluYWxfaW1hZ2VfdGFzayAoKSwg
d2UgdHJ5IHRvIHNldA0KUkVQUk9EVUNJQkxFX1RJTUVTVEFNUF9ST09URlMgYmFzZWQgb24gdGhl
IHRvcCBtb3N0IGdpdCB0aW1lc3RhbXAsIGJ1dA0KdGhhdCdzIGZhaWxpbmcgYmVjYXVzZSB0aGUg
d29ya2luZyBkaXJlY3RvcnkgYXQgdGhhdCBwb2ludCBpcyBteSBidWlsZA0KZGlyZWN0b3J5LCB3
aGljaCBpc24ndCBnaXQgY29udHJvbGxlZDoNCg0KfCBOT1RFOiBFeGVjdXRpbmcgcmVwcm9kdWNp
YmxlX2ZpbmFsX2ltYWdlX3Rhc2sgLi4uDQp8IERFQlVHOiBFeGVjdXRpbmcgc2hlbGwgZnVuY3Rp
b24gcmVwcm9kdWNpYmxlX2ZpbmFsX2ltYWdlX3Rhc2sNCnwgZmF0YWw6IE5vdCBhIGdpdCByZXBv
c2l0b3J5IChvciBhbnkgb2YgdGhlIHBhcmVudCBkaXJlY3Rvcmllcyk6IC5naXQNCnwgV0FSTklO
RzogL2hvbWUvdmFncmFudC9wb2t5LW1hc3Rlci9idWlsZC90bXAvd29yay9uYW5vaHViLXBva3kt
bGludXgtZ251ZWFiaS9uYW5vLWltYWdlLWNvcmUvMS4wLXIwL3RlbXAvcnVuLnJlcHJvZHVjaWJs
ZV9maW5hbF9pbWFnZV90YXNrLjM2NjQ6MQ0KZXhpdCAxMjggZnJvbSAnUkVQUk9EVUNJQkxFX1RJ
TUVTVEFNUF9ST09URlM9YGdpdCBsb2cgLTENCi0tcHJldHR5PSVjdGAnDQoNCkNsZWFybHkganVz
dCBzZXR0aW5nIFJFUFJPRFVDSUJMRV9USU1FU1RBTVBfUk9PVEZTIGluIG15IGdsb2JhbCBjb25m
aWcNCmZpeGVzIHRoZSBwcm9ibGVtLCBidXQgdGhhdCBkb2Vzbid0IGhlbHAgYW55b25lIGVsc2Ug
dHJ5aW5nIHRvIHVzZQ0KdGhpcy4uLiBJJ20gcmVhbGx5IG5vdCBzdXJlIHdoYXQgcmVwbyB0aGF0
IHBpZWNlIG9mIGNvZGUgaXMgaW50ZW5kaW5nDQp0byB0YXJnZXQuDQoNCi0tDQpBbGV4IEtpZXJu
YW4NCi0tDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
T3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=

--_000_a8f064e60d3445f9ba11862f6efc5805XBOX02axiscom_
Content-Type: text/html; charset="utf-8"
Content-ID: <70487C9EC844C040B0A4EDFECC6A8CC0@exhub.se.axis.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KTXkgZ3Vlc3MgaXMg
dGhhdCBpdCBpcyBleHBlY3RpbmcgUG9reSBhdCB0aGUgdG9wLiBIb3dldmVyLCB0aGF0IGlzIGEg
cHJldHR5IGJhZCBhc3N1bXB0aW9uLiZuYnNwOw0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+Ly9Q
ZXRlcjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMDAl
O2NvbG9yOiMwMDAwMDAiPjwhLS0gb3JpZ2luYWxNZXNzYWdlIC0tPg0KPGRpdj4tLS0tLS0tLSBP
cmlnaW5hbG1lZGRlbGFuZGUgLS0tLS0tLS08L2Rpdj4NCjxkaXY+RnLDpW46IEFsZXggS2llcm5h
biAmbHQ7YWxleC5raWVybmFuQGdtYWlsLmNvbSZndDsgPC9kaXY+DQo8ZGl2PkRhdHVtOiAyMDE4
LTA2LTIyIDEyOjIwIChHTVQmIzQzOzAxOjAwKSA8L2Rpdj4NCjxkaXY+VGlsbDogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZywganVyby5ieXN0cmlja3lAaW50ZWwuY29t
IDwvZGl2Pg0KPGRpdj5SdWJyaWs6IFtPRS1jb3JlXSByZXByb2R1Y2libGVfZmluYWxfaW1hZ2Vf
dGFzayBmYWlsaW5nIHdoZW4gUkVQUk9EVUNJQkxFX1RJTUVTVEFNUF9ST09URlMgdW5zZXQNCjwv
ZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjwvZGl2Pg0KPGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMHB0OyI+DQo8ZGl2IGNsYXNzPSJQbGFpblRleHQiPkknbSB0cnlpbmcg
dG8gdXNlIEJVSUxEX1JFUFJPRFVDSUJMRV9CSU5BUklFUywgYnV0IEkgdHJpcHBlZCBvdmVyIGE8
YnI+DQpwcm9ibGVtIHdoZW4gSSdkIG5vdCBzZXQgUkVQUk9EVUNJQkxFX1RJTUVTVEFNUF9ST09U
RlMuPGJyPg0KPGJyPg0KSW4gdGhlIHJlcHJvZHVjaWJsZV9maW5hbF9pbWFnZV90YXNrICgpLCB3
ZSB0cnkgdG8gc2V0PGJyPg0KUkVQUk9EVUNJQkxFX1RJTUVTVEFNUF9ST09URlMgYmFzZWQgb24g
dGhlIHRvcCBtb3N0IGdpdCB0aW1lc3RhbXAsIGJ1dDxicj4NCnRoYXQncyBmYWlsaW5nIGJlY2F1
c2UgdGhlIHdvcmtpbmcgZGlyZWN0b3J5IGF0IHRoYXQgcG9pbnQgaXMgbXkgYnVpbGQ8YnI+DQpk
aXJlY3RvcnksIHdoaWNoIGlzbid0IGdpdCBjb250cm9sbGVkOjxicj4NCjxicj4NCnwgTk9URTog
RXhlY3V0aW5nIHJlcHJvZHVjaWJsZV9maW5hbF9pbWFnZV90YXNrIC4uLjxicj4NCnwgREVCVUc6
IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiByZXByb2R1Y2libGVfZmluYWxfaW1hZ2VfdGFzazxi
cj4NCnwgZmF0YWw6IE5vdCBhIGdpdCByZXBvc2l0b3J5IChvciBhbnkgb2YgdGhlIHBhcmVudCBk
aXJlY3Rvcmllcyk6IC5naXQ8YnI+DQp8IFdBUk5JTkc6IC9ob21lL3ZhZ3JhbnQvcG9reS1tYXN0
ZXIvYnVpbGQvdG1wL3dvcmsvbmFub2h1Yi1wb2t5LWxpbnV4LWdudWVhYmkvbmFuby1pbWFnZS1j
b3JlLzEuMC1yMC90ZW1wL3J1bi5yZXByb2R1Y2libGVfZmluYWxfaW1hZ2VfdGFzay4zNjY0OjE8
YnI+DQpleGl0IDEyOCBmcm9tICdSRVBST0RVQ0lCTEVfVElNRVNUQU1QX1JPT1RGUz1gZ2l0IGxv
ZyAtMTxicj4NCi0tcHJldHR5PSVjdGAnPGJyPg0KPGJyPg0KQ2xlYXJseSBqdXN0IHNldHRpbmcg
UkVQUk9EVUNJQkxFX1RJTUVTVEFNUF9ST09URlMgaW4gbXkgZ2xvYmFsIGNvbmZpZzxicj4NCmZp
eGVzIHRoZSBwcm9ibGVtLCBidXQgdGhhdCBkb2Vzbid0IGhlbHAgYW55b25lIGVsc2UgdHJ5aW5n
IHRvIHVzZTxicj4NCnRoaXMuLi4gSSdtIHJlYWxseSBub3Qgc3VyZSB3aGF0IHJlcG8gdGhhdCBw
aWVjZSBvZiBjb2RlIGlzIGludGVuZGluZzxicj4NCnRvIHRhcmdldC48YnI+DQo8YnI+DQotLSA8
YnI+DQpBbGV4IEtpZXJuYW48YnI+DQotLSA8YnI+DQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXzxicj4NCk9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlz
dDxicj4NCk9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8YnI+DQo8YSBo
cmVmPSJodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5l
bWJlZGRlZC1jb3JlIiB0YXJnZXQ9Il9CTEFOSyI+aHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZTwvYT48L2Rpdj4NCjwvc3Bhbj48
L2ZvbnQ+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_a8f064e60d3445f9ba11862f6efc5805XBOX02axiscom_--
