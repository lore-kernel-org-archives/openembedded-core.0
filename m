Return-Path: <contact@jgueytat.fr>
X-Greylist: delayed 3356 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Sep 2016 17:26:31 UTC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
	[217.70.183.196])
	by mail.openembedded.org (Postfix) with ESMTP id 44B8A60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 17:26:31 +0000 (UTC)
Received: from mfilter30-d.gandi.net (mfilter30-d.gandi.net [217.70.178.161])
	by relay4-d.mail.gandi.net (Postfix) with ESMTP id 31A901720AC;
	Wed, 28 Sep 2016 19:26:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter30-d.gandi.net
Received: from relay4-d.mail.gandi.net ([IPv6:::ffff:217.70.183.196])
	by mfilter30-d.gandi.net (mfilter30-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id kpVg2DaibUlv; Wed, 28 Sep 2016 19:26:30 +0200 (CEST)
X-Originating-IP: 92.90.16.73
Received: from [100.115.239.108] (73.16.90.92.rev.sfr.net [92.90.16.73])
	(Authenticated sender: contact@jgueytat.fr)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2A77E172094;
	Wed, 28 Sep 2016 19:26:28 +0200 (CEST)
Date: Wed, 28 Sep 2016 19:26:27 +0200
From: Julien Gueytat <contact@jgueytat.fr>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: 00moses.alexander00@gmail.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] db: Upgrade to 6.0.35
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
X-List-Received-Date: Wed, 28 Sep 2016 17:26:33 -0000
Message-ID: <MADEUP.15FE20644916777A.13558@groups.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

QWxyaWdodCEgSSdtIGdpdmluZyB5b3UgdGhhdCBxdWlja2x5LgoKU2VudCBmcm9tIG15IFdJS08g
UkFJTkJPVyBMSVRFIDRHTGUgMjggc2VwdC4gMjAxNiAxODo1OCwgQW7DrWJhbCBMaW3Ds24gPGFu
aWJhbC5saW1vbkBsaW51eC5pbnRlbC5jb20+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiAwOS8yOC8y
MDE2IDExOjMwIEFNLCBKdWxpZW4gR3VleXRhdCB3cm90ZTogCj4gPiBSZWxhdGVkIHRvIHRoZSBk
YiByZWNpcGUuIFRoZXJlIGFyZSBhbHNvIHRoZSBwYXRjaGVzIHRoYXQgbmVlZHMgdG8gYmUgCj4g
PiByZWdlbmVyYXRlZCBhcyB0aGUgc2FtZSBwYXRjaGVzIGFyZSBhcHBsaWVkIGZvciB0aGUgdHdv
IGN1cnJlbnQgdmVyc2lvbnMuIAo+ID4gQXQgbGVhc3Qgb24gVWJ1bnR1IDE2LjA2IHRoZSBzYW1l
IHBhdGNoIGNhbid0IGJlIGFwcGxpZWQgYW55bW9yZSBvbiB0aGUgCj4gPiB0d28gdmVyc2lvbnMg
YXMgdGhlIGxpbmVzIHdoZXJlIHRvIGFwcGx5IHRoZSBwYXRjaGVzIGRpZmZlcnMgdG9vIG11Y2gu
IAo+Cj4gVGhpcyBpcyBhIHF1aXRlIHN0cmFuZ2UsIGknbSB3b25kZXJpbmcgd2h5IGNhbid0IGJl
IGFwcGxpZWQsIGkgZXhwZWN0IGlmIAo+IGEgcGF0Y2ggZmFpbHMgaW4gY29uZmlndXJlL2NvbXBp
bGUgc3RhZ2VzIG5vdCBhdCBwYXRjaCBhcHBseS4gCj4KPiBDb3VsZCB5b3UgcHV0IGhlcmUgdGhl
IGVycm9yIGxvZyBwbGVhc2U/IAo+Cj4gYWxpbW9uIAo+Cj4gPiAKPiA+IAo+ID4gTGUgMjgvMDkv
MjAxNiAxODoyNCwgQnVydG9uLCBSb3NzIGEgw6ljcml0IDogCj4gPj4gCj4gPj4gT24gMjggU2Vw
dGVtYmVyIDIwMTYgYXQgMTc6MDYsIEFuw61iYWwgTGltw7NuIAo+ID4+IDxhbmliYWwubGltb25A
bGludXguaW50ZWwuY29tIDxtYWlsdG86YW5pYmFsLmxpbW9uQGxpbnV4LmludGVsLmNvbT4+IAo+
ID4+IHdyb3RlOiAKPiA+PiAKPiA+PsKgwqDCoMKgIEBAIC0xOCwxNiArMTgsMTUgQEAgUkNPTkZM
SUNUU18ke1BOfSA9ICJkYjMiIAo+ID4+wqDCoMKgwqDCoCBQUiA9ICJyMSIgCj4gPj4gCj4gPj4g
Cj4gPj4gUmVtb3ZlIHRoaXMgUFIgcGxlYXNlLiAKPiA+PiAKPiA+PsKgwqDCoMKgwqAgIyBOb3Rl
LCB3aGVuIHVwZ3JhZGVkIHRvIDYuMS54LCBhIHBhdGNoIGluIFJQTSB3aWxsIG5lZWQgdG8gYmUg
Cj4gPj7CoMKgwqDCoCByZW1vdmVkIHRvIGFjdGl2YXRlIGRiIDYuMSBzdXBwb3J0LiAKPiA+PsKg
wqDCoMKgIC0gCj4gPj7CoMKgwqDCoCAtU1JDX1VSSSA9ICJodHRwOi8vZG93bmxvYWQub3JhY2xl
LmNvbS9iZXJrZWxleS1kYi9kYi0ke1BWfS50YXIuZ3ogCj4gPj7CoMKgwqDCoCA8aHR0cDovL2Rv
d25sb2FkLm9yYWNsZS5jb20vYmVya2VsZXktZGIvZGItJCU3QlBWJTdELnRhci5nej4gXCAKPiA+
PsKgwqDCoMKgICtTUkNfVVJJID0gImh0dHA6Ly9kaXN0ZmlsZXMuZ2VudG9vLm9yZy9kaXN0Zmls
ZXMvZGItJHtQVn0udGFyLmd6IAo+ID4+wqDCoMKgwqAgPGh0dHA6Ly9kaXN0ZmlsZXMuZ2VudG9v
Lm9yZy9kaXN0ZmlsZXMvZGItJCU3QlBWJTdELnRhci5nej4gXCAKPiA+PiAKPiA+PiAKPiA+PiBX
aGF0IGlzIGRpc3RmaWxlcy5nZW50b28ub3JnIDxodHRwOi8vZGlzdGZpbGVzLmdlbnRvby5vcmc+
J3MgcG9saWN5IAo+ID4+IHdoZW4gZGItNi4wLjM2IGlzIHJlbGVhc2VkP8KgIENvdWxkIHRoZSB0
YXJiYWxsIGJlIGRlbGV0ZWQgdGhlIGRheSAKPiA+PiBhZnRlciB3ZSByZWxlYXNlP8KgIEluIGdl
bmVyYWwgd2UndmUgYmVlbiBlaXRoZXIgdXNpbmcgCj4gPj4gc25hcHNob3QuZGViaWFuLm9yZyA8
aHR0cDovL3NuYXBzaG90LmRlYmlhbi5vcmc+IG9yIHBvaW50aW5nIGRpcmVjdGx5IAo+ID4+IGF0
IHRoZSB5b2N0b3Byb2plY3Qub3JnIDxodHRwOi8veW9jdG9wcm9qZWN0Lm9yZz4gc291cmNlIG1p
cnJvciBmb3IgCj4gPj4gdGFyYmFsbHMgd2UgY2FuJ3QgcmVseSB1cG9uIG92ZXIgdGltZS4gCj4g
Pj4gCj4gPj4gUm9zcyAKPiA+PiAKPiA+PiAKPiA+IAo+ID4gCj4K


