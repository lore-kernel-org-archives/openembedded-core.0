Return-Path: <amarnath.valluri@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB71759D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:11:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jul 2015 01:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,537,1432623600"; d="scan'208";a="612019741"
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
	by orsmga003.jf.intel.com with ESMTP; 24 Jul 2015 01:11:01 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.29]) by
	IRSMSX154.ger.corp.intel.com ([169.254.12.253]) with mapi id
	14.03.0224.002; Fri, 24 Jul 2015 09:11:01 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [meta-oe][PATCH] libical: Upgrade v1.0.0 -> v1.0.1
Thread-Index: AQHQxTj36ujAq4arSEqVSJntuXGwrp3pkJwAgAC03T4=
Date: Fri, 24 Jul 2015 08:11:01 +0000
Message-ID: <D3C33C4430ACA6488F343D1125FCCECC37FCF24B@irsmsx110.ger.corp.intel.com>
References: <1437650226-27368-1-git-send-email-amarnath.valluri@intel.com>,
	<CAJTo0Lbf3xfewq5=2EsPqQ6knBmw3LNXAD8Gc9aRjv6V3uHeXw@mail.gmail.com>
In-Reply-To: <CAJTo0Lbf3xfewq5=2EsPqQ6knBmw3LNXAD8Gc9aRjv6V3uHeXw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libical: Upgrade v1.0.0 -> v1.0.1
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
X-List-Received-Date: Fri, 24 Jul 2015 08:11:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Friday, July 24, 2015 1:21 AM
To: Valluri, Amarnath
Cc: OE-core; Iorga, Cristian
Subject: Re: [OE-core] [meta-oe][PATCH] libical: Upgrade v1.0.0 -> v1.0.1


On 23 July 2015 at 12:17, Amarnath Valluri <amarnath.valluri@intel.com<mail=
to:amarnath.valluri@intel.com>> wrote:
- Build system changed from autotools to cmake.
- Perl dependency added.

We had almost exactly this patch a week or so ago from Cristian (CC'd) who =
promptly retracted it with the comment that he "hadn't done enough testing".
Sorry, I was not knowing that, so please ignore this patch.

- Amarnath

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


