Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2DACB7F3B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 13:29:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2019 06:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="174163251"
Received: from jaisharm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.36.125])
	by fmsmga007.fm.intel.com with ESMTP; 31 Jul 2019 06:29:48 -0700
To: Mike Looijmans <mike.looijmans@topic.nl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <6ce08045-fb67-aab4-9ff5-9f8d511eeb78@topic.nl>
	<99ef1d9c-c642-92b3-33b0-aafc38c8e62b@intel.com>
	<63da8199-4e73-70e2-bcea-60f7e53a2e16@topic.nl>
From: Ross Burton <ross.burton@intel.com>
Message-ID: <487ea47b-1db4-8c95-c0ad-661a56ccc07a@intel.com>
Date: Wed, 31 Jul 2019 14:29:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <63da8199-4e73-70e2-bcea-60f7e53a2e16@topic.nl>
Subject: Re: SDK does not contain pkg-config files
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
X-List-Received-Date: Wed, 31 Jul 2019 13:29:48 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMzEvMDcvMjAxOSAxNDoyMiwgTWlrZSBMb29pam1hbnMgd3JvdGU6Cj4gV2VsbCwgdGhhdCdz
IGF0IGxlYXN0IGdvb2QgdG8ga25vdy4KPiAKPiBJJ20gb24gdGhlICJ0aHVkIiBicmFuY2ggY3Vy
cmVudGx5LCBzbyBJIGhvcGUgdGhpcyBpc24ndCBzb21ldGhpbmcgdGhhdCBnb3QKPiBmaXhlZCBv
bmx5IHJlY2VudGx5Lgo+IAo+IEknbGwgdHJ5IHNvbWUgc2ltcGxlIGltYWdlcyBmaXJzdC4gSSBn
YXRoZXIgdGhlcmUncyBubyBwYXJ0aWN1bGFyIG1hZ2ljCj4gaW5jYW50YXRpb24gSSBuZWVkIHRv
IHB1dCBpbnRvIG15IGltYWdlIHJlY2lwZSB0byBnZXQgdGhlIHBrZy1jb25maWcgZmlsZXMKPiBp
bnRvIHRoZSBTREsgc3lzcm9vdD8KClJpZ2h0LCB0aGV5J3JlIGp1c3QgaW4gdGhlIC1kZXYgcGFj
a2FnZXMuICBJJ2QgdHJ5IGJ1aWxkaW5nIGEgCmNvcmUtaW1hZ2UtbWluaW1hbCBTREsgdG8gdmVy
aWZ5IHRoYXQgd29ya3MsIGFzIEkgc3VzcGVjdCB5b3UndmUgZG9uZSAKc29tZXRoaW5nIGluIHlv
dXIgaW1hZ2UgdG8gYnJlYWsgdGhlIFNESy4KClJvc3MKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIENvcnBv
cmF0aW9uIChVSykgTGltaXRlZApSZWdpc3RlcmVkIE5vLiAxMTM0OTQ1IChFbmdsYW5kKQpSZWdp
c3RlcmVkIE9mZmljZTogUGlwZXJzIFdheSwgU3dpbmRvbiBTTjMgMVJKClZBVCBObzogODYwIDIx
NzMgNDcKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlk
ZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVu
dChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHBy
b2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBj
b250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgo=


