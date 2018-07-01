Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89B6F60079
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Jul 2018 17:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 274CD18367;
	Sun,  1 Jul 2018 19:41:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id lCEgrRQIY4zb; Sun,  1 Jul 2018 19:40:58 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id D02001814A;
	Sun,  1 Jul 2018 19:40:58 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B35E01A061;
	Sun,  1 Jul 2018 19:40:58 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6F6D1A05F;
	Sun,  1 Jul 2018 19:40:58 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sun,  1 Jul 2018 19:40:58 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 9AD5123B7;
	Sun,  1 Jul 2018 19:40:58 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sun, 1 Jul 2018 19:40:58 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sun, 1 Jul 2018 19:40:58 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Sun, 1 Jul 2018 19:40:58 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QWxwIMOWem1lcnQ=?= <info@ib-oezmert.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Fix & extend recommendations for license
	packages.
Thread-Index: AQHUD8EDHY/GYR+tOEywV8Q3yQI7y6R6o+8A
Date: Sun, 1 Jul 2018 17:40:58 +0000
Message-ID: <1a9071779ae144b396a707fa4454478d@XBOX02.axis.com>
References: <1530286862-35452-1-git-send-email-info@ib-oezmert.de>
In-Reply-To: <1530286862-35452-1-git-send-email-info@ib-oezmert.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] Fix & extend recommendations for license packages.
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
X-List-Received-Date: Sun, 01 Jul 2018 17:41:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBBbHAgw5Z6
bWVydA0KPiBTZW50OiBkZW4gMjkganVuaSAyMDE4IDE3OjQxDQo+IFRvOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0hd
IEZpeCAmIGV4dGVuZCByZWNvbW1lbmRhdGlvbnMgZm9yIGxpY2Vuc2UNCj4gcGFja2FnZXMuDQo+
IA0KPiBDaGFuZ2VkIHBhY2thZ2UgcmVjb21tZW5kYXRpb25zIHNvIHRoYXQgdGhlIGxpY2Vuc2Ug
cGFja2FnZSBvZiBhDQo+IHJlY2lwZSBpcyByZWNvbW1lbmRlZCBmb3IgYWxsIHBhY2thZ2VzIG9m
IGEgcmVjaXBlIGluc3RlYWQgb2YgZm9yIG9uZQ0KPiBwYWNrYWdlIGdpdmVuIGJ5IHRoZSByZWNp
cGUgbmFtZS4NCj4gDQo+IFByZS1wYXRjaCBiZWhhdmlvdXIgcmVzdWx0cyBpbiBhIG1pc3Npbmcg
cmVjb21tZW5kYXRpb24gd2hlbiBhIHJlY2lwZQ0KPiBkb2VzIG5vdCBoYXZlIGEgcGFja2FnZSB3
aXRoIHRoZSBzYW1lIG5hbWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbHAgw5Z6bWVydCA8aW5m
b0BpYi1vZXptZXJ0LmRlPg0KPiAtLS0NCj4gIG1ldGEvY2xhc3Nlcy9saWNlbnNlLmJiY2xhc3Mg
fCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL21ldGEvY2xhc3Nlcy9saWNlbnNlLmJiY2xhc3MNCj4gYi9tZXRhL2NsYXNzZXMvbGljZW5z
ZS5iYmNsYXNzDQo+IGluZGV4IDA2ZGQ0YTguLjc5ZWE3ZWQgMTAwNjQ0DQo+IC0tLSBhL21ldGEv
Y2xhc3Nlcy9saWNlbnNlLmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2VzL2xpY2Vuc2UuYmJj
bGFzcw0KPiBAQCAtMzQwLDYgKzM0MCw3IEBAIGRlZiBhZGRfcGFja2FnZV9hbmRfZmlsZXMoZCk6
DQo+ICAgICAgICAgICMgZmlyc3QgaW4gUEFDS0FHRVMgdG8gYmUgc3VyZSB0aGF0IG5vdGhpbmcg
ZWxzZSBnZXRzIExJQ0VOU0VfRklMRVNfRElSRUNUT1JZDQo+ICAgICAgICAgIGQuc2V0VmFyKCdQ
QUNLQUdFUycsICIlcyAlcyIgJSAocG5fbGljLCBwYWNrYWdlcykpDQo+ICAgICAgICAgIGQuc2V0
VmFyKCdGSUxFU18nICsgcG5fbGljLCBmaWxlcykNCj4gKyAgICBmb3IgcG4gaW4gcGFja2FnZXMu
c3BsaXQoKToNCg0KWW91IHNob3VsZCBhdm9pZCBhZGRpbmcgYSByZWNvbW1lbmRhdGlvbiBvZiB0
aGUgJHtQTn0tbGljIHBhY2thZ2UgdG8gDQppdHNlbGYgaWYgaXQgaGFwcGVucyB0byBiZSBsaXN0
ZWQgaW4gUEFDS0FHRVM6DQoNCiAgICAgICAgIGlmIHBuID09IHBuX2xpYzoNCiAgICAgICAgICAg
ICBjb250aW51ZQ0KDQo+ICAgICAgICAgIHJyZWNvbW1lbmRzX3BuID0gZC5nZXRWYXIoJ1JSRUNP
TU1FTkRTXycgKyBwbikNCj4gICAgICAgICAgaWYgcnJlY29tbWVuZHNfcG46DQo+ICAgICAgICAg
ICAgICBkLnNldFZhcignUlJFQ09NTUVORFNfJyArIHBuLCAiJXMgJXMiICUgKHBuX2xpYywgcnJl
Y29tbWVuZHNfcG4pKQ0KPiAtLQ0KPiAyLjcuNA0KDQovL1BldGVyDQoNCg==

