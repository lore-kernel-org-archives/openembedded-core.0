Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0117.outbound.protection.outlook.com [207.46.100.117])
	by mail.openembedded.org (Postfix) with ESMTP id 0021D71FE8
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 16:50:34 +0000 (UTC)
Received: from BLUPR05MB039.namprd05.prod.outlook.com (10.255.210.148) by
	BLUPR05MB500.namprd05.prod.outlook.com (10.141.29.27) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Thu, 6 Nov 2014 16:50:32 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB039.namprd05.prod.outlook.com (10.255.210.148) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Thu, 6 Nov 2014 16:50:31 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.45]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.45]) with mapi id
	15.01.0011.000; Thu, 6 Nov 2014 16:50:31 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: PR server import/export operation
Thread-Index: Ac/53RpaLPLcfdrrTaqWNAcdPZkADQ==
Date: Thu, 6 Nov 2014 16:50:30 +0000
Message-ID: <efe4c40ae01c417689d5bfa5176544cc@BLUPR05MB037.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 00D8A1CE00870200D8A31B
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB039;UriScan:;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(101416001)(4396001)(87936001)(2656002)(76576001)(108616004)(99396003)(120916001)(21056001)(229853001)(105586002)(31966008)(99286002)(2351001)(106356001)(95666004)(110136001)(33646002)(450100001)(46102003)(86362001)(92566001)(64706001)(74316001)(20776003)(77156002)(66066001)(107046002)(97736003)(107886001)(54356999)(40100003)(77096003)(62966003)(122556002)(50986999)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR05MB039;
	H:BLUPR05MB037.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB500;
X-OriginatorOrg: melinkcorp.com
Subject: PR server import/export operation
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
X-List-Received-Date: Thu, 06 Nov 2014 16:50:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxsLA0KDQpJIGFtIG9uIHBva3kvZHlsYW4gYW5kIEkgaGF2ZSBub3QgeWV0IGNoYW5nZWQgdG8g
dXNpbmcgdGhlIFBSIHNlcnZlci4gIFRoZXJlIGFyZSBzb21lIHBpZWNlcyBvZiB0aGUgUFIgc2Vy
dmVyIG9wZXJhdGlvbiB0aGF0IEkgZG9uJ3QgdW5kZXJzdGFuZCwgYW5kIEkgd2FudCB0byBjb25m
aXJtIGhvdyBjZXJ0YWluIGFzcGVjdHMgb2YgdGhlIFBSIHNlcnZlciB3b3JrIGJlZm9yZSBJIG1h
a2UgdGhlIHN3aXRjaCB0byBtYWtlIHN1cmUgSSBkb24ndCBtYWtlIGEgbWVzcyBvZiBteSBidWls
ZHMuIA0KDQpJIHNlZSB0aGF0IHRoZXJlIGlzIGltcG9ydC9leHBvcnQgZnVuY3Rpb25hbGl0eSBm
b3IgdGhlIFBSIHNlcnZlciAoImJpdGJha2UtcHJzZXJ2LXRvb2wgZXhwb3J0IiBhbmQgImJpdGJh
a2UtcHJzZXJ2LXRvb2wgaW1wb3J0IikgZm9yIHNhdmluZyB0aGUgUFIgc2VydmVyIHN0YXRlLiAg
SG93ZXZlciwgSSdtIGNvbmZ1c2VkIG9uIGhvdyBpdCB3b3JrcyBmb3IgaW5kZXBlbmRlbnQgYnVp
bGQgc3lzdGVtcy4NCg0KRXhhbXBsZSBzY2VuYXJpbzoNCjEuIEkgbWFrZSBzb21lIGNoYW5nZXMg
Zm9yIGEgcHJvZHVjdCByZWxlYXNlIGFuZCBidWlsZCBhIG5ldyBpbWFnZS4gIEkgcHVzaCBhbGwg
bGF5ZXIgY2hhbmdlcyB0byBvdXIgbG9jYWwgR2l0IHJlcG9zaXRvcmllcyBhbmQgc3RvcmUgdGhl
IHJlc3VsdGluZyBpbWFnZSBhbmQgcGFja2FnZXMgb24gb3VyIHNlcnZlci4NCjIuIEkgY2FsbCAi
Yml0YmFrZS1wcnNlcnYtdG9vbCBleHBvcnQiIGFuZCBwdXNoIHRoZSBleHBvcnRlZCB0YWJsZSB0
byBvdXIgbG9jYWwgR2l0IHJlcG9zaXRvcnkuDQozLiBJIHRhZyBvdXIgbG9jYWwgR2l0IHJlcG9z
aXRvcmllcyAidjEuMCIgdG8gbWFyayB0aGUgbGF0ZXN0IHByb2R1Y3QgcmVsZWFzZS4NCjQuIE15
IGhhcmQgZHJpdmUgY3Jhc2hlcyBhbmQgSSBuZWVkIHRvIGdldCBhIG5ldyBvbmUuICBJIGdldCBt
eSBjb21wdXRlciBiYWNrIHVwIGFuZCBydW5uaW5nIGFuZCBkbyBhIGZyZXNoIGNsb25lIG9mIG91
ciBsb2NhbCBHaXQgcmVwb3NpdG9yaWVzIGFuZCBjaGVja291dCAidjEuMCIuDQo1LiBJIGNhbGwg
ImJpdGJha2UtcHJzZXJ2LXRvb2wgaW1wb3J0IiB1c2luZyB0aGUgUFIgdGFibGUgZnJvbSBvdXIg
bG9jYWwgR2l0IHJlcG9zaXRvcnkuDQo2LiBJIGRvIG15IGluaXRpYWwgaW1hZ2UgYnVpbGQsIHdo
aWNoIHB1bGxzIGluIGFsbCB0aGUgc291cmNlIGNvZGUgYW5kIGJ1aWxkcyBhbGwgcGFja2FnZXMg
Zm9yIHRoZSBmaXJzdCB0aW1lLg0KDQpNeSBxdWVzdGlvbiBpczogd2lsbCB0aGUgcGFja2FnZSB2
ZXJzaW9ucyBmb3IgYWxsIHBhY2thZ2VzIGJlIHRoZSBzYW1lIGFmdGVyIHN0ZXAgNiBhcyB0aGV5
IHdlcmUgYWZ0ZXIgc3RlcCAxPyAgT3Igd2lsbCBldmVyeSBQUiBnZXQgaW5jcmVtZW50ZWQgYnkg
dGhlIFBSIHNlcnZlciBpbiBzdGVwIDY/ICBJZiBzbywgaXMgdGhlcmUgYW4gb3JkZXIgdG8gZG9p
bmcgdGhpbmdzIHNvIHRoYXQgSSBjYW4gZ2V0IHRoZSBQUnMgdG8gbWF0Y2ggaW4gc3RlcCAxIGFu
ZCBpbiBzdGVwIDY/DQoNClJlZ2FyZHMsDQpCcnlhbg0K

