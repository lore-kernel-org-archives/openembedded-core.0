Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3CC57E99F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 10:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 88CE81837B;
	Fri, 28 Jun 2019 12:09:25 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id N8xRlE31mP0m; Fri, 28 Jun 2019 12:09:23 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6C9FE183C4;
	Fri, 28 Jun 2019 12:09:23 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59BC11A0C8;
	Fri, 28 Jun 2019 12:09:23 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E57D1A0C7;
	Fri, 28 Jun 2019 12:09:23 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 28 Jun 2019 12:09:23 +0200 (CEST)
Received: from xbox06.axis.com (xbox06.axis.com [10.0.15.176])
	by thoth.se.axis.com (Postfix) with ESMTP id 424BCFF;
	Fri, 28 Jun 2019 12:09:23 +0200 (CEST)
Received: from xbox06.axis.com (10.0.15.176) by xbox06.axis.com (10.0.15.176)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Fri, 28 Jun 2019 12:09:23 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Fri, 28 Jun 2019 12:09:23 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: ChenQi <Qi.Chen@windriver.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] devtool: warn user about multiple layer
	having the same base name
Thread-Index: AQHVLZmO4k9pBF/pAE2v8XYTHRFCMA==
Date: Fri, 28 Jun 2019 10:09:22 +0000
Message-ID: <c2dc0472ed9646f680f658e4297eb4df@xbox06.axis.com>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] devtool: warn user about multiple layer having the same base name
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
X-List-Received-Date: Fri, 28 Jun 2019 10:09:25 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_c2dc0472ed9646f680f658e4297eb4dfxbox06axiscom_"

--_000_c2dc0472ed9646f680f658e4297eb4dfxbox06axiscom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBoYWQgbm90IHJlYWxpemVkIHRoZSBsYXllciBuYW1lIGluIHRoZSBkZXZ0b29sIGZpbmlzaCBj
b21tYW5kIHN1cHBvcnRzIGFiYnJldmlhdGlvbnMvcGF0dGVybnMgKHdoaWNoZXZlciBpdCBpcyku
IE15IGV4cGVjdGF0aW9uIGZyb20gcnVubmluZyBgZGV2dG9vbCBmaW5pc2ggZm9vIG1ldGFgIHdv
dWxkIGJlIHRvIHVwZGF0ZSB0aGUgZm9vIHJlY2lwZSBpbiB0aGUgbWV0YSBsYXllciwgIG5vdCB0
aGF0IGl0IHNob3VsZCBnbyBsb29raW5nIGZvciBldmVyeSBsYXllciBjYWxsZWQgbWV0YS1zb21l
dGhpbmcuDQoNCkhvdyB1c2VmdWwgaXMgdGhhdCBzdXBwb3J0IGNvbXBhcmVkIHRvIGJlIGFibGUg
dG8gc3BlY2lmeSB0aGUgZXhhY3QgbGF5ZXIgbmFtZT8gTm9ybWFsbHkgaW4gdGhpcyBzaXR1YXRp
b24sIEkgd291bGQgdHlwaWNhbGx5IGV4cGVjdCB0byB1c2UgYW4gZXh0cmEgb3B0aW9uLCAgZS5n
LiwgLS1hYmJyZXYgb3IgLS1yZWdleHAsIHRvIGVuYWJsZSBzdXBwb3J0IGZvciB1c2luZyBsb29z
ZSBtYXRjaGluZy4NCg0KLy9QZXRlcg0K

--_000_c2dc0472ed9646f680f658e4297eb4dfxbox06axiscom_
Content-Type: text/html; charset="utf-8"
Content-ID: <50AD4F9F29CDCB44992F99817B9AF8CA@exhub.se.axis.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KSSBoYWQgbm90IHJl
YWxpemVkIHRoZSBsYXllciBuYW1lIGluIHRoZSBkZXZ0b29sIGZpbmlzaCBjb21tYW5kIHN1cHBv
cnRzIGFiYnJldmlhdGlvbnMvcGF0dGVybnMgKHdoaWNoZXZlciBpdCBpcykuIE15IGV4cGVjdGF0
aW9uIGZyb20gcnVubmluZyBgZGV2dG9vbCBmaW5pc2ggZm9vIG1ldGFgIHdvdWxkIGJlIHRvIHVw
ZGF0ZSB0aGUgZm9vIHJlY2lwZSBpbiB0aGUgbWV0YSBsYXllciwmbmJzcDsgbm90IHRoYXQgaXQg
c2hvdWxkIGdvIGxvb2tpbmcgZm9yDQogZXZlcnkgbGF5ZXIgY2FsbGVkIG1ldGEtc29tZXRoaW5n
LiZuYnNwOw0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+SG93IHVzZWZ1bCBpcyB0aGF0IHN1cHBv
cnQgY29tcGFyZWQgdG8gYmUgYWJsZSB0byBzcGVjaWZ5IHRoZSBleGFjdCBsYXllciBuYW1lPyBO
b3JtYWxseSBpbiB0aGlzIHNpdHVhdGlvbiwgSSB3b3VsZCB0eXBpY2FsbHkgZXhwZWN0IHRvIHVz
ZSBhbiBleHRyYSBvcHRpb24sJm5ic3A7IGUuZy4sIC0tYWJicmV2IG9yIC0tcmVnZXhwLCB0byBl
bmFibGUgc3VwcG9ydCBmb3IgdXNpbmcgbG9vc2UgbWF0Y2hpbmcuJm5ic3A7PC9kaXY+DQo8ZGl2
Pjxicj4NCjwvZGl2Pg0KPGRpdj4vL1BldGVyPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_c2dc0472ed9646f680f658e4297eb4dfxbox06axiscom_--
