Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F073965EEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 09:43:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6S9gagP028939
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 02:42:36 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.155]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Mon, 28 Jul 2014 02:42:35 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Koen Kooi
	<koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [PATCH] alsa-lib: remove non PN based -dev packages
Thread-Index: AQHPqkXCKIyvdfCz3EaH61lhnxGUrJu1OkkQ
Date: Mon, 28 Jul 2014 09:42:35 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCAC06B1@ALA-MBA.corp.ad.wrs.com>
References: <1406282736-30238-1-git-send-email-jackie.huang@windriver.com>
	<FE5CD361-F77F-4383-B608-E216734EDB6E@dominion.thruhere.net>
	<1B858668EC6A94408DCA5225FDFA85AABCAC0413@ALA-MBA.corp.ad.wrs.com>
	<3EFC00D1-B81F-4618-AC38-B3557430D4EE@dominion.thruhere.net>
	<1406539481.13346.6.camel@ted>
In-Reply-To: <1406539481.13346.6.camel@ted>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.142]
MIME-Version: 1.0
Cc: "RIFENBARK, SCOTT" <scott.m.rifenbark@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: remove non PN based -dev packages
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
X-List-Received-Date: Mon, 28 Jul 2014 09:43:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
W21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBNb25k
YXksIEp1bHkgMjgsIDIwMTQgNToyNSBQTQ0KPiBUbzogS29lbiBLb29pDQo+IENjOiBIdWFuZywg
SmllIChKYWNraWUpOyBPRS1jb3JlOyBSSUZFTkJBUkssIFNDT1RUDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIXSBhbHNhLWxpYjogcmVtb3ZlIG5vbiBQTiBiYXNlZCAtZGV2IHBhY2th
Z2VzDQo+IA0KPiBPbiBNb24sIDIwMTQtMDctMjggYXQgMTA6NTEgKzAyMDAsIEtvZW4gS29vaSB3
cm90ZToNCj4gPiBPcCAyOCBqdWwuIDIwMTQsIG9tIDA4OjQ5IGhlZWZ0IEh1YW5nLCBKaWUgKEph
Y2tpZSkgPEphY2tpZS5IdWFuZ0B3aW5kcml2ZXIuY29tPiBoZXQgdm9sZ2VuZGUNCj4gZ2VzY2hy
ZXZlbjoNCj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4+IEZyb206IEtv
ZW4gS29vaSBbbWFpbHRvOmtvZW5AZG9taW5pb24udGhydWhlcmUubmV0XQ0KPiA+ID4+IFNlbnQ6
IE1vbmRheSwgSnVseSAyOCwgMjAxNCAyOjMwIFBNDQo+ID4gPj4gVG86IEh1YW5nLCBKaWUgKEph
Y2tpZSkNCj4gPiA+PiBDYzogT0UtY29yZTsgUmljaGFyZCBQdXJkaWUNCj4gPiA+PiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gYWxzYS1saWI6IHJlbW92ZSBub24gUE4gYmFzZWQgLWRl
dg0KPiA+ID4+IHBhY2thZ2VzDQo+ID4gPj4NCj4gPiA+Pg0KPiA+ID4+IE9wIDI1IGp1bC4gMjAx
NCwgb20gMTI6MDUgaGVlZnQgamFja2llLmh1YW5nQHdpbmRyaXZlci5jb20gaGV0IHZvbGdlbmRl
IGdlc2NocmV2ZW46DQo+ID4gPj4NCj4gPiA+Pj4gRnJvbTogSmFja2llIEh1YW5nIDxqYWNraWUu
aHVhbmdAd2luZHJpdmVyLmNvbT4NCj4gPiA+Pj4NCj4gPiA+Pj4gQWxsIGRldiByZWxhdGVkIGl0
ZW1zIHNob3VsZCBiZSBwYWNrYWdlZCBpbiB0aGUgY29yZSBQTi1kZXYNCj4gPiA+Pj4gcGFja2Fn
ZSBub3QgaW4gc2VwZXJhdGUgcGFja2FnZXMuDQo+ID4gPj4NCj4gPiA+PiBXaGF0J3MgdGhlIHVw
Z3JhZGUgcGF0aCBoZXJlIGZvciBpbWFnZSBhbmQgdXNlcnMgdGhhdCBoYXZlDQo+ID4gPj4gJ2Fs
c2EtZGV2JyBpbnN0YWxsZWQ/IExvb2tzIGxpa2UgdGhlcmUgYXJlDQo+ID4gPg0KPiA+ID4gTXkg
cGF0Y2ggaXMgcmVtb3ZpbmcgJ2Fsc2EtZGV2JyBhbmQgYWxsIHJlbGF0ZWQgZmlsZXMgZ29lcyBp
bnRvDQo+ID4gPiAnJHtQTn0tZGV2JyAoUE49YWxzYS1saWIgaGVyZSksIHNvIHVzZXJzIG5lZWQg
dG8gaW5zdGFsbCBhbHNhLWxpYi1kZXYgaW5zdGVhZCBvZiBhbHNhLWRldi4NCj4gPg0KPiA+ICpz
aWdoKiBTbyB5b3UgaGF2ZSBubyB1cGdyYWRlIHBhdGggZm9yIHNpdHVhdGlvbnMgd2hlcmUgJ2Fs
c2EtZGV2JyBpcw0KPiA+IGFscmVhZHkgaW5zdGFsbGVkIG9yIGxpc3RlZCBpbiBhIHBhY2thZ2Vn
cm91cCBvciBpbWFnZS4gV29yc2UsIHlvdQ0KPiA+IGRvbid0IGV2ZW4gdW5kZXJzdGFuZCB0aGUg
cHJvYmxlbSA6Lw0KPiA+DQo+ID4gPg0KPiA+ID4+IG5vdyAyIGNvbmZsaWN0aW5nIHBhY2thZ2Vz
LCAnYWxzYS1kZXYnIGluIHRoZSBmZWVkcyBhbmQNCj4gPiA+PiAnYWxzYS1saWItZGV2JyBvbiBP
RSwgd2l0aG91dCBhbmQNCj4gPiA+DQo+ID4gPiBPbmx5ICdhbHNhLWxpYi1kZXYnIG5vdyB3aXRo
IG15IHBhdGNoLCBzbyBubyBjb25mbGljdHMuDQo+ID4NCj4gPiBIYWhhaGFoYWhhaGEgeW91IGFy
ZSByZWFsbHkgZnVubnkuDQo+IA0KPiBJIGFwcHJlY2lhdGUgdGhlcmUgaXMgYSBwcm9ibGVtIGhl
cmUgYW5kIHdlIG5lZWQgdG8gZml4IHRoYXQuIFRoZXJlIGlzIGFsc28gYW4gZWR1Y2F0aW9uIGlz
c3VlLCBwZW9wbGUNCj4gd2hvIGRvbid0IGtub3cgbXVjaCBhYm91dCBpdCBkb24ndCBhcHByZWNp
YXRlIHRoZSBzdHJ1Z2dsZXMgb2Ygc29tZW9uZSBtYWludGFpbmluZyBwYWNrYWdlIGZlZWRzLg0K
DQpTb3JyeSB0aGF0IEkgZ290IG1pc3VuZGVyc3RhbmRpbmcgYWJvdXQgdGhlIGNvbW1ldHMgc2lu
Y2UgSSBkaWRuJ3Qga25vdyBtdWNoIHRoZSBpc3N1ZSwgSSBhcHByZWNpYXRlIHRoYXQNCmFuZCB3
aWxsIHNlbmQgYW5vdGhlciBwYXRjaCB0byBmaXggaXQgc2luY2UgdGhpcyBvbmUgaXMgYWxyZWFk
eSBtZXJnZWQuDQoNClRoYW5rcywNCkphY2tpZQ0KDQo+IA0KPiBQZXJoYXBzIHNvbWVvbmUgY291
bGQgd3JpdGUgYSBzaG9ydCBzZWN0aW9uIGZvciB0aGUgZG9jcyBhYm91dCB0aGUgaXNzdWVzIGhl
cmU/IEluIGZ1dHVyZSB3aGVuIHRoaXMNCj4ga2luZCBvZiBwcm9ibGVtIGNvbWVzIHVwLCB3ZSBj
YW4gdGhlbiBhdCBsZWFzdCBwb2ludCBhdCB0aGUgbWFudWFsIHNlY3Rpb24gdG8gZXhwbGFpbiBp
dC4NCj4gDQo+IEN1cnJlbnRseSwgbW9zdCBkb2NzIGNvbWUgZnJvbSB0aGUgInNhbWUgb2xkIHBl
b3BsZSIsIEknbSBwYXJ0bHkgd3JpdGluZyB0aGlzIHRvIHJlbWluZCBwZW9wbGUgdGhhdA0KPiBv
dGhlcnMgY2FuIHN1Ym1pdCB0aGVtIGFuZCB0aGF0IHRoZXkgY2FuIGhlbHAgbWFzc2l2ZWx5IGlu
IGVkdWNhdGluZyBwZW9wbGUuDQo+IA0KPiBUaGV5IGRvbid0IGV2ZW4gbmVlZCB0byBiZSBwcm9w
ZXIgcGF0Y2hlcyBhZ2FpbnN0IHRoZSBkb2NzLCBqdXN0IHdyaXRlIGEgZmV3IHBhcmFncmFwaHMs
IHNlbmQgaXQgU2NvdHQNCj4gUmlmZW5iYXJrJ3Mgd2F5IGFuZCBoZSBjYW4gdXN1YWxseSBkbyBz
b21ldGhpbmcgd2l0aCBpdC4gSGUgdGVuZHMgdG8gcmV3b3JkIHRoaW5ncyBzbyB0aGUgbWFudWFs
IGhhcw0KPiBhIGNvbnNpc3RlbnQgdG9uZSBhbmQgc3R5bGUgYW55d2F5IHNvIGl0IG5lZWRuJ3Qg
YmUgd29yZCBwZXJmZWN0IGVpdGhlciwgaXRzIHRoZSBjb250ZW50IHRoYXQgbWF0dGVycw0KPiAo
YW5kIHRoYXQgaXMgdGhlIHBhcnQgU2NvdHQgY2Fubm90IGRvKS4NCj4gDQo+IENoZWVycywNCj4g
DQo+IFJpY2hhcmQNCg0K

