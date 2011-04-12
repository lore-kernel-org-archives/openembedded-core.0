Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q9Wgn-0003vU-27
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 08:03:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Apr 2011 23:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,194,1301900400"; d="scan'208";a="677907005"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2011 23:00:38 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 12 Apr 2011 13:59:05 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 12 Apr 2011 13:59:05 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Tue, 12 Apr 2011 13:59:04 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Saul Wold' <sgw@linux.intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Apr 2011 13:59:03 +0800
Thread-Topic: [OE-core] [PATCH 00/12] recipe upgrades and fix
Thread-Index: Acv40ZOT/xao0m9xTAG9NlmvWATGfAAAt7ag
Message-ID: <1865303E0DED764181A9D882DEF65FB68A9519E86E@shsmsx502.ccr.corp.intel.com>
References: <cover.1302576423.git.dexuan.cui@intel.com>
	<4DA3E17D.9060702@linux.intel.com>
In-Reply-To: <4DA3E17D.9060702@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 00/12] recipe upgrades and fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Apr 2011 06:03:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote:
> On 04/11/2011 08:16 PM, Dexuan Cui wrote:
>> From: Dexuan Cui<dexuan.cui@intel.com>
>>=20
>> The upgrades are mostly filename/checksum changes.
>> Add --enable-specs=3Dno for xextproto, libxi.
>=20
> This patch set contains a number of recipes that include patches, non
> of those patches have been upgraded with Upstream-Status: tag.  At a
> minimum they should include the "pending" status, if you can identify
> that they are non-upstreamable, then add the correct information in
> the tag and commit message.
Sorry for the missing info. I'll add that and resend the pull request.

Thanks,
-- Dexuan


