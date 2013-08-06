Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A735260886
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 07:00:40 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Aug 2013 00:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,824,1367996400"; d="scan'208";a="342273784"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by azsmga001.ch.intel.com with ESMTP; 06 Aug 2013 00:00:40 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.83]) with mapi id
	14.03.0123.003; Tue, 6 Aug 2013 08:00:38 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 4/4] harfbuzz: upgrade to v0.9.19
Thread-Index: AQHOkf/w+x7oH8MvVke2FoOMR0vIcJmHvxpg
Date: Tue, 6 Aug 2013 07:00:37 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C12030@IRSMSX105.ger.corp.intel.com>
References: <cover.1375714695.git.cristian.iorga@intel.com>
	<ac2478839baa47707462f083c300ce22cdb8e1f0.1375714695.git.cristian.iorga@intel.com>
	<CAJTo0Lbo_v=SAxKTM8vSa_=LK295uZVjgukpsXKJ+uhAZWOq9g@mail.gmail.com>
In-Reply-To: <CAJTo0Lbo_v=SAxKTM8vSa_=LK295uZVjgukpsXKJ+uhAZWOq9g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] harfbuzz: upgrade to v0.9.19
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
X-List-Received-Date: Tue, 06 Aug 2013 07:00:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KRm9yIGV2YWx1YXRpbmcgdGhlIGNvcnJlY3QgZnVuY3Rpb25hbGl0eSBvZiBo
YXJmYnV6eiwgSSBidWlsdCBhbmQgcmFuIGNvcmUtaW1hZ2Utc2F0by4NClRoZSB0ZXh0IGxvb2tl
ZCBPSywgSSB0cnkgdG8gc2VlIGlmIHRoZXJlIGFyZSBzb21lIGlzc3VlcyBpbiBhbnkgb2YgdGhl
IGluY2x1ZGVkIGFwcHMuDQpEaWQgbm90IGZpbmQgYW55LCBzbyBJIGNvbnNpZGVyZWQgdGhhdCB0
aGUgaGFyZmJ1enogdXBncmFkZSB3ZW50IE9LLg0KQXJlIHRoZXJlIGFueSBvdGhlciBtb3JlIGNv
bXBsZXggdGVzdHMgdG8gcGVyZm9ybT8NCg0KSSB3aWxsIHRyeSB0byBkaXNzZW1pbmF0ZSB0aGUg
aW5mb3JtYXRpb24gdGhhdCB5b3UgcHJvdmlkZWQgYW5kIGNvbWUgYmFjayB3aXRoIGZpeGVzLg0K
R2l2ZW4gdGhlIGxvYWQgdGhhdCBJIGFtIGV4cGVyaWVuY2luZywgSSBhbSBub3Qgc3VyZSBpdCB3
aWxsIGhhcHBlbiB0aGlzIHdlZWsuDQpSZWdhcmRzLA0KQ3Jpc3RpYW4NCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGlu
dGVsLmNvbV0gDQpTZW50OiBNb25kYXksIEF1Z3VzdCAwNSwgMjAxMyA4OjE5IFBNDQpUbzogSW9y
Z2EsIENyaXN0aWFuDQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggNC80XSBoYXJmYnV6ejogdXBncmFkZSB0
byB2MC45LjE5DQoNCkhpIENyaXN0aWFuLA0KDQpJIGRpZCBhIGJ1aWxkaGlzdG9yeS1kaWZmIGFu
ZCBub3RpY2VkIG1vcmUgdGhhbiB0aGUgZXhwZWN0ZWQgY2h1cm4uDQpTZWUgdGhlIHVwc3RyZWFt
IE5FV1MgZm9yIHNvbWUgaW1wb3J0YW50IGNoYW5nZXM6DQpodHRwOi8vY2dpdC5mcmVlZGVza3Rv
cC5vcmcvaGFyZmJ1enovdHJlZS9ORVdTDQoNCiIiIg0KTW9yZW92ZXIsIElDVSBzdXBwb3J0IGlz
IG5vdyBidWlsZCBpbnRvIGEgc2VwYXJhdGUgbGlicmFyeToNCmxpYmhhcmZidXp6LWljdS5zbywg
YW5kIGEgbmV3IGhhcmZidXp6LWljdS5wYyBpcyBzaGlwcGVkIGZvciBpdC4NCkRpc3Ryb3MgY2Fu
IGVuYWJsZSBJQ1Ugbm93IHdpdGhvdXQgZXZlcnkgYXBwbGljYXRpb24gb24gZWFydGggZ2V0dGlu
ZyBsaW5rZWQgdG8gdmlhIGxpYmhhcmZidXp6LnNvLg0KDQpGb3IgZGlzdHJvcyBJIHJlY29tbWVu
ZCB0aGF0IHRoZXkgbWFrZSBzdXJlIHRoZXkgYXJlIGJ1aWxkaW5nIC0td2l0aC1nbGliIC0td2l0
aC1mcmVldHlwZSAtLXdpdGgtY2Fpcm8sIC0td2l0aC1pY3UsIGFuZCBvcHRpb25hbGx5IC0td2l0
aC1ncmFwaGl0ZTI7IEFuZCBwYWNrYWdlIGhhcmZidXp6IGFuZCBoYXJmYnV6ei1pY3Ugc2VwYXJh
dGVseS4NCiIiIg0KDQpXZSBzaG91bGQgc3BsaXQgb3V0IHRoZSBJQ1UgcGFja2FnZSwgYW5kIHJl
LWV2YWx1YXRlIGRpc2FibGVfZ3JhcGhpdGUucGF0Y2gvc3VibWl0IHVwc3RyZWFtIGlmIGl0IGlz
IGEgZ2VudWluZSBwcm9ibGVtIHdpdGggdGhlIGJ1aWxkIHN5c3RlbS4NCg0KUm9zcw0K

