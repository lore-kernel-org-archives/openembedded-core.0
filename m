Return-Path: <william.c.randle@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D660976E3F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 17:54:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Aug 2016 10:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,470,1464678000"; 
	d="scan'208,217";a="1008536935"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2016 10:54:07 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 4 Aug 2016 10:54:07 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.2.201]) by
	ORSMSX111.amr.corp.intel.com ([169.254.12.106]) with mapi id
	14.03.0248.002; Thu, 4 Aug 2016 10:54:06 -0700
From: "Randle, William C" <william.c.randle@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] epiphany: inherit perlnative
Thread-Index: AQHR5WrLGiKpPOAjjE2/USrFLAuMuqAqREuAgAGvoQCAAIqmgIAM8pwAgAArt4A=
Date: Thu, 4 Aug 2016 17:54:05 +0000
Message-ID: <1470333245.18988.4.camel@intel.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
	<07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
	<CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
	<57980BC4.80208@windriver.com>
	<BF50BCD4-DC5E-478D-9AF3-24C9E99C36A7@gmail.com>
	<CAJTo0LZ_9sp6+tWgoY1NSeh3H-KVWrCJfyCp0LW1YaF6AMS1tg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ_9sp6+tWgoY1NSeh3H-KVWrCJfyCp0LW1YaF6AMS1tg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.199.58]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Thu, 04 Aug 2016 17:54:08 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_1470333245189884camelintelcom_"

--_000_1470333245189884camelintelcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE2LTA4LTA0IGF0IDE2OjE3ICswMTAwLCBCdXJ0b24sIFJvc3Mgd3JvdGU6DQoN
Ck9uIDI3IEp1bHkgMjAxNiBhdCAxMDozNCwgS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbTxt
YWlsdG86cmFqLmtoZW1AZ21haWwuY29tPj4gd3JvdGU6DQo+IEkgc3RpbGwgZ2V0IHRoZSBzYW1l
IGVycm9yIGFmdGVyIHlvdXIgcGF0Y2ggYXBwbGllZDoNCj4NCj4gY29uZmlndXJlOjE2NTEzOiBj
aGVja2luZyBmb3IgcGVybA0KPiBjb25maWd1cmU6MTY1MzE6IGZvdW5kIC91c3IvYmluL3BlcmwN
Cj4gY29uZmlndXJlOjE2NTQzOiByZXN1bHQ6IC91c3IvYmluL3BlcmwNCj4gY29uZmlndXJlOjE2
NTU0OiBjaGVja2luZyBmb3IgcGVybCA+PSA1LjguMQ0KPiBjb25maWd1cmU6MTY1NjE6IHJlc3Vs
dDogNS4xOC4yDQo+IGNvbmZpZ3VyZToxNjU2NTogY2hlY2tpbmcgZm9yIFhNTDo6UGFyc2VyDQo+
IGNvbmZpZ3VyZToxNjU3MTogZXJyb3I6IFhNTDo6UGFyc2VyIHBlcmwgbW9kdWxlIGlzIHJlcXVp
cmVkIGZvciBpbnRsdG9vbA0KDQpzYW1lIGhlcmUNCg0KaHR0cDovL2Vycm9ycy55b2N0b3Byb2pl
Y3Qub3JnL0Vycm9ycy9EZXRhaWxzLzczMzMwLw0KDQpJIGRvbid0IHVuZGVyc3RhbmQgaG93IGFz
IG15IHBhdGNoIGxpdGVyYWxseSByZW1vdmVzIHRoYXQgYmxvY2sgb2YgY29kZSBmcm9tIHRoZSBp
bnRsdG9vbCBtYWNyb3MuICBDYW4geW91IHN0aWxsIHJlcGxpY2F0ZSB0aGlzLCBhbmQgaWYgc28g
Y2FuIHlvdSBzYXZlIHRoZSBidWlsZCB0cmVlPw0KDQpSb3NzDQoNCj4NCg0KSGVyZSdzIHRoZSBv
bmUgdGhhdCB3YXMgb24gdGhlIEludGVsIEFCIHRoZSBvdGhlciBkYXk6IGh0dHBzOi8vYXV0b2J1
aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy9pbnRlbC9idWlsZGVycy9uaWdodGx5LW1ldGEtaW50ZWwt
d29ybGQvYnVpbGRzLzEyNC9zdGVwcy9CdWlsZEltYWdlc18xL2xvZ3Mvc3RkaW8gLiBTZWFyY2gg
Zm9yICJFUlJPUjoiIHRoZW4gc2Nyb2xsIGRvd24gYSBiaXQuIFRoZSBidWlsZCB0cmVlIGlzIHN0
aWxsIG9uIHlvY3RvLWFiMDEub3N0Yy5pbnRlbC5jb20gdW5kZXIgbmlnaHRseS1tZXRhLWludGVs
LXdvcmxkLg0KDQogICAgLUJpbGwNCg0KDQo=

--_000_1470333245189884camelintelcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <7D9E728CD5F0114AA7DC5991FE4C3E90@intel.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IGJnY29sb3I9IiNmN2Y3
ZjciIHRleHQ9IiMyYzJjMmMiIGxpbms9IiM0YTkwZDkiIHZsaW5rPSIjNGE5MGQ5Ij4NCjxkaXY+
T24gVGh1LCAyMDE2LTA4LTA0IGF0IDE2OjE3ICYjNDM7MDEwMCwgQnVydG9uLCBSb3NzIHdyb3Rl
OjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+DQo8ZGl2IGRpcj0ibHRyIj4NCjxkaXYg
Y2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gMjcg
SnVseSAyMDE2IGF0IDEwOjM0LCBLaGVtIFJhaiA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9
Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWoua2hlbUBnbWFp
bC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+
PHNwYW4gY2xhc3M9IiI+Jmd0OyBJIHN0aWxsIGdldCB0aGUgc2FtZSBlcnJvciBhZnRlciB5b3Vy
IHBhdGNoIGFwcGxpZWQ6PGJyPg0KJmd0Ozxicj4NCiZndDsgY29uZmlndXJlOjE2NTEzOiBjaGVj
a2luZyBmb3IgcGVybDxicj4NCiZndDsgY29uZmlndXJlOjE2NTMxOiBmb3VuZCAvdXNyL2Jpbi9w
ZXJsPGJyPg0KJmd0OyBjb25maWd1cmU6MTY1NDM6IHJlc3VsdDogL3Vzci9iaW4vcGVybDxicj4N
CiZndDsgY29uZmlndXJlOjE2NTU0OiBjaGVja2luZyBmb3IgcGVybCAmZ3Q7PSA1LjguMTxicj4N
CiZndDsgY29uZmlndXJlOjE2NTYxOiByZXN1bHQ6IDUuMTguMjxicj4NCiZndDsgY29uZmlndXJl
OjE2NTY1OiBjaGVja2luZyBmb3IgWE1MOjpQYXJzZXI8YnI+DQomZ3Q7IGNvbmZpZ3VyZToxNjU3
MTogZXJyb3I6IFhNTDo6UGFyc2VyIHBlcmwgbW9kdWxlIGlzIHJlcXVpcmVkIGZvciA8c3BhbiBj
bGFzcz0iaWwiPg0KaW50bHRvb2w8L3NwYW4+PGJyPg0KPGJyPg0KPC9zcGFuPnNhbWUgaGVyZTxi
cj4NCjxicj4NCjxhIGhyZWY9Imh0dHA6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMv
RGV0YWlscy83MzMzMC8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9l
cnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy83MzMzMC88L2E+PGJyPg0KPC9i
bG9ja3F1b3RlPg0KPC9kaXY+DQo8YnI+DQpJIGRvbid0IHVuZGVyc3RhbmQgaG93IGFzIG15IHBh
dGNoIGxpdGVyYWxseSByZW1vdmVzIHRoYXQgYmxvY2sgb2YgY29kZSBmcm9tIHRoZSBpbnRsdG9v
bCBtYWNyb3MuJm5ic3A7IENhbiB5b3Ugc3RpbGwgcmVwbGljYXRlIHRoaXMsIGFuZCBpZiBzbyBj
YW4geW91IHNhdmUgdGhlIGJ1aWxkIHRyZWU/PC9kaXY+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRy
YSI+PGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+Um9zczwvZGl2Pg0KPC9k
aXY+DQo8cHJlPiZndDsgPGJyIGNsYXNzPSIteC1ldm8tdGVtcC13cmFwLXRleHQtYnIiPjwvcHJl
Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+SGVyZSdzIHRoZSBvbmUg
dGhhdCB3YXMgb24gdGhlIEludGVsIEFCIHRoZSBvdGhlciBkYXk6Jm5ic3A7PGEgaHJlZj0iaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL2ludGVsL2J1aWxkZXJzL25pZ2h0bHkt
bWV0YS1pbnRlbC13b3JsZC9idWlsZHMvMTI0L3N0ZXBzL0J1aWxkSW1hZ2VzXzEvbG9ncy9zdGRp
byI+aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL2ludGVsL2J1aWxkZXJzL25p
Z2h0bHktbWV0YS1pbnRlbC13b3JsZC9idWlsZHMvMTI0L3N0ZXBzL0J1aWxkSW1hZ2VzXzEvbG9n
cy9zdGRpbzwvYT4mbmJzcDsuDQogU2VhcmNoIGZvciAmcXVvdDtFUlJPUjomcXVvdDsgdGhlbiBz
Y3JvbGwgZG93biBhIGJpdC4gVGhlIGJ1aWxkIHRyZWUgaXMgc3RpbGwgb24mbmJzcDt5b2N0by1h
YjAxLm9zdGMuaW50ZWwuY29tIHVuZGVyJm5ic3A7bmlnaHRseS1tZXRhLWludGVsLXdvcmxkLjwv
ZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+Jm5ic3A7ICZuYnNwOyAtQmlsbDwvZGl2Pg0K
PGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_1470333245189884camelintelcom_--
