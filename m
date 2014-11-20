Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0125.outbound.protection.outlook.com [207.46.100.125])
	by mail.openembedded.org (Postfix) with ESMTP id 3D43365C78
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 19:43:35 +0000 (UTC)
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB040.namprd05.prod.outlook.com (10.255.210.156) with Microsoft
	SMTP Server (TLS) id 15.1.16.15; Thu, 20 Nov 2014 19:43:33 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.224]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.224]) with mapi id
	15.01.0026.003; Thu, 20 Nov 2014 19:43:34 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Resetting PR for PR service
Thread-Index: AdAE93K3zIhl51tUQwmy17JexpScUw==
Date: Thu, 20 Nov 2014 19:43:33 +0000
Message-ID: <1273c0d32efd40dda18770de4d5e90b4@BLUPR05MB037.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 017877F400889601787941
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB040;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB040;
x-forefront-prvs: 0401647B7F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(107046002)(107886001)(101416001)(92566001)(62966003)(77096003)(77156002)(2351001)(19580395003)(2656002)(86362001)(106356001)(87936001)(76576001)(95666004)(108616004)(99286002)(54356999)(97736003)(105586002)(21056001)(74316001)(4396001)(64706001)(66066001)(122556002)(33646002)(31966008)(110136001)(50986999)(450100001)(46102003)(99396003)(120916001)(229853001)(40100003)(20776003)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR05MB040;
	H:BLUPR05MB037.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
Subject: Resetting PR for PR service
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
X-List-Received-Date: Thu, 20 Nov 2014 19:43:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBhbSBvbiBwb2t5L2R5bGFuIGFuZCBJIGFtIHVzaW5nIHRoZSBQUiBzZXJ2aWNlIGZvciB0aGUg
Zmlyc3QgdGltZS4gIEF0IHRoaXMgdGltZSBJIGFtIG1ha2luZyBzb21lIGNvc21ldGljIC5iYmFw
cGVuZCByZWNpcGUgY2hhbmdlcyAocmVvcmRlcmluZyBhbmQgc3BhY2luZyB3aXRoIG5vIGFmZmVj
dCBvbiB0aGUgZmluYWwgYnVpbHQgcGFja2FnZSkuICBPZiBjb3Vyc2UsIGFmdGVyIHJlYnVpbGRp
bmcgdGhlIHJlY2lwZSB0aGUgUFIgc2VydmljZSBidW1wZWQgdGhlIFBSIHNpbmNlIGl0IHNhdyBh
IGNoYW5nZSBpbiB0aGUgbWV0YWRhdGEuICBJIGRvbid0IHdhbnQgdGhpcyBwYWNrYWdlIFBSIHRv
IGNoYW5nZSBhdCB0aGlzIHRpbWU7IHRoZSBwYWNrYWdlIHdvdWxkICJ1cGdyYWRlIiBvbiB0aGUg
bmV4dCByZWxlYXNlIGV2ZW4gdGhvdWdoIHRoZSBjb250ZW50cyBhcmUgaWRlbnRpY2FsLiAgSSB3
b3VsZCBsaWtlIHRvIHJldmVydCB0aGUgUFIgZm9yIHRoaXMgcGFja2FnZSBidXQgSSBhbSBoYXZp
bmcgZGlmZmljdWx0eS4NCg0KSSBoYWQgbm90IHByZXZpb3VzbHkgdXNlZCB0aGUgUFIgc2Vydmlj
ZSwgc28gdGhlIG9sZCBwYWNrYWdlIG5hbWUgd2FzIGZvb18xLjAuMC1yMF9hcm05MjZlanN0ZS5p
cGsuICBBZnRlciBiZWluZyByZWJ1aWx0LCB0aGUgbmV3IHBhY2thZ2UgbmFtZSB3YXMgZm9vXzEu
MC4wLXIwLjBfYXJtOTI2ZWpzdGUuaXBrIChhZGRlZCB0aGUgLjApLiAgSSB0cmllZCB0byByZXZl
cnQgdGhlIFBSIGZvciB0aGlzIHBhY2thZ2UgYXMgZm9sbG93czoNCjEuIEV4cG9ydCB0aGUgY3Vy
cmVudCBQUiBzZXJ2aWNlIGRhdGEgYnkgY2FsbGluZyAiYml0YmFrZS1wcnNlcnYtdG9vbCBleHBv
cnQgcHJzZXJ2X2V4cG9ydC5pbmMiDQoyLiBNb3ZlZCB0aGUgZmlsZSBjYWNoZS9wcnNlcnYuc3Fs
aXRlMyB0byBlZmZlY3RpdmVseSBkZWxldGUgdGhlIFBSIFNlcnZpY2UgZGF0YWJhc2UuDQozLiBP
cGVuZWQgcHJzZXJ2X2V4cG9ydC5pbmMgYW5kIHJlbW92ZWQgdGhlIHR3byBsaW5lcyByZWxhdGVk
IHRvIHBhY2thZ2UgZm9vLg0KNC4gQ2xlYW5lZCBwYWNrYWdlIGZvbyBieSBjYWxsaW5nICJiaXRi
YWtlIC1jIGNsZWFuIGZvbyINCjUuIEltcG9ydGVkIHRoZSBQUiBzZXJ2aWNlIGRhdGEgYnkgY2Fs
bGluZyAiYml0YmFrZS1wcnNlcnYtdG9vbCBpbXBvcnQgcHJzZXJ2X2V4cG9ydC5pbmMiDQo2LiBS
ZWJ1aWx0IHBhY2thZ2UgZm9vIGJ5IGNhbGxpbmcgImJpdGJha2UgZm9vIg0KDQpBZnRlciBzdGVw
IDYsIHRoZSByZXN1bHRpbmcgcGFja2FnZSBuYW1lIHdhcyBzdGlsbCBmb29fMS4wLjAtcjAuMF9h
cm05MjZlanN0ZS5pcGsuICBJcyB0aGVyZSBhIHN0ZXAgSSdtIG1pc3NpbmcgaW4gcmV2ZXJ0aW5n
IHRoZSBQUiB2YWx1ZT8NCg0KT24gYW5vdGhlciBub3RlLCBJIGRpc2NvdmVyZWQgdGhhdCB0byBp
bXBvcnQgdGhlIHByc2VydiBkYXRhIHRoZSBmaWxlbmFtZSBuZWVkcyB0byBlbmQgd2l0aCAuaW5j
LCBvdGhlcndpc2UgeW91IGdldCBhbiBlcnJvciBzdGF0aW5nIHRoYXQgQml0YmFrZSBkb2VzIG5v
dCBrbm93IHdoYXQgdG8gZG8gd2l0aCB0aGUgZmlsZS4gIE9yIG1vcmUgc3BlY2lmaWNhbGx5LCB0
aGUgZmlsZSB0byBiZSBpbXBvcnRlZCBhdCBsZWFzdCBjYW4ndCBiZSBhIC50eHQgZXh0ZW5zaW9u
LiAgSWYgdGhlcmUgaXMgYSBzcGVjaWZpYyBmaWxlIGV4dGVuc2lvbiBuZWVkZWQgZm9yIGltcG9y
dCwgSSdkIHN1Z2dlc3QgdGhlIGluZm8gYmUgaW5jbHVkZWQgb24gdGhlIFBSIFNlcnZpY2Ugd2lr
aS4NCg0KUmVnYXJkcywNCkJyeWFuDQoNCg0K

