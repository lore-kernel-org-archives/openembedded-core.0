Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id CD7F277A67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 12:44:23 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v3OCiKA5017888
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 24 Apr 2017 14:44:20 +0200
Received: from ATVIES991UGMSX.ww300.siemens.net
	(atvies991ugmsx.ww300.siemens.net [158.226.163.37])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTPS id v3OCiK26000372
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Apr 2017 14:44:20 +0200
Received: from ATNETS9912WMSX.ww300.siemens.net ([169.254.10.23]) by
	ATVIES991UGMSX.ww300.siemens.net ([158.226.163.37]) with mapi id
	14.03.0339.000; Mon, 24 Apr 2017 14:44:20 +0200
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] libevent: 2.0.22 -> 2.1.8
Thread-Index: AQHSvPKjazTKa+MGy0+KBE5/seRpZKHUcYZw
Date: Mon, 24 Apr 2017 12:44:20 +0000
Message-ID: <D55698ECEC159B488D62A508E18D7FEC0147BABB@ATNETS9912WMSX.ww300.siemens.net>
References: <1493034871-24823-1-git-send-email-andrej.valek@siemens.com>
	<CAJTo0Lau-Vc_Z1d3mCSPbOp2kjc=Hk95k6SCMxLHOQRrnyMz7Q@mail.gmail.com>
In-Reply-To: <CAJTo0Lau-Vc_Z1d3mCSPbOp2kjc=Hk95k6SCMxLHOQRrnyMz7Q@mail.gmail.com>
Accept-Language: en-US, de-AT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.226.163.18]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libevent: 2.0.22 -> 2.1.8
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
X-List-Received-Date: Mon, 24 Apr 2017 12:44:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KU2VlIGJlbG93Lg0KDQpBbmRyZWoNCg0KPiBPbiAyNCBBcHJpbCAyMDE3IGF0
IDEyOjU0LCBBbmRyZWogVmFsZWsgPGFuZHJlai52YWxla0BzaWVtZW5zLmNvbT4gd3JvdGU6DQo+
ICtGaXggbWlzc2luZyB0ZXN0IGRpcmVjdG9yeSBjcmVhdGlvbi4NCj4gKw0KPiArRHVlIHRvIHJl
bW92ZWQgbWFrZWZpbGUuYW0vaW4gZmlsZXMgaW4gdGVzdC9zYW1wbGUvaW5jbHVkZQ0KPiArZGly
ZWN0b3JpZXMsIG91dHB1dCBkaXJlY3RvcmllcyBhcmUgbm90IGNyZWF0ZWQgaW4NCj4gK2NvbmZp
Z3VyYXRpb24gc3RlcC4gQ29tcGlsYXRpb24gc3RlcCB3aWxsIGZhaWxzLCB3aGVuDQo+ICt0cnlp
bmcgdG8gd3JpdGUgdG8gbm9uLWV4aXN0aW5nIGRpcmVjdG9yeS4NCj4gKw0KPiArVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPdGhlcl0NCj4gK1dvcmthcm91bmQgc3BlY2lmaWMgdG8g
b3VyIGJ1aWxkIHN5c3RlbS4NCg0KPiBIb3cgaXMgdGhpcyBzcGVjaWZpYyB0byBvdXIgYnVpbGRz
IGFuZCBub3QganVzdCBhIGJ1aWxkIHJhY2U/DQoNCkdjYyB1c2VkIGluIE9FLWNvcmUgaGFzICJk
ZXBlbmRlbmN5IHRyYWNraW5nIiBkaXNhYmxlZCBhbmQgbmV3IHZlcnNpb24gb2YgbGliZXZlbnQg
aGFzIHByb2JsZW0gd2l0aCB0aGlzLg0KwqANCj4gLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PTQ1YzUzMTZmZjY4NGJjZmUyZjlmODZkOGIxMjc5NTU5Ig0KPiArTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTdmMjA1NzRjMGIxNTRkMTIyMzZkNWZi
ZTk2NGY1NDkiDQoNCj4gQWx3YXlzIGV4cGxhaW4gd2h5IHRoZSBjaGVja3N1bSBuZWVkZWQgY2hh
bmdpbmcuDQoNClNvcnJ5LCBJIGhhdmUgbWlzc2VkIGl0LCB0aGVyZSB3YXMgY29kZSBhZGRlZCB1
bmRlciBNSVQgbGljZW5zZS4NCklzIHRoaXMgYWNjZXB0YWJsZSBmb3Igb2UtY29yZT8NCkkgY291
bGQgY2hhbmdlIExJQ0VOU0UgPSAiQlNEIiB0byBMSUNFTlNFID0gIkJTRCAmIE1JVCIgdG8gcmVm
bGVjdCB0aGlzLg0KDQo+IFJvc3MNCg0K

