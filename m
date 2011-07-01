Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QcaWv-0006LJ-I7
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 12:00:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jul 2011 02:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,457,1304319600"; d="scan'208";a="25128401"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2011 02:57:11 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 1 Jul 2011 17:56:40 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Fri, 1 Jul 2011
	17:56:39 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 17:56:39 +0800
Thread-Topic: [PATCH 0/1] busybox: bump PR to enable largefile support
Thread-Index: Acw31MoV95t49l4iRiSt2oyOLzF9egAAFc7w
Message-ID: <1865303E0DED764181A9D882DEF65FB6A1FA38BB6C@shsmsx502.ccr.corp.intel.com>
References: <cover.1309513694.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1309513694.git.dexuan.cui@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] busybox: bump PR to enable largefile support
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
X-List-Received-Date: Fri, 01 Jul 2011 10:00:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Cui, Dexuan wrote:
> The following changes since commit
> 4d60d32a60ae0fae1002b27cd7d20c28532f4932:=20
>=20
>   poky.conf: add largefile support into DISTRO_FEATURES (2011-07-01
> 17:35:26 +0800)=20
>=20
> Dexuan Cui (1):
>   busybox: bump PR to enable largefile support
>=20
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dcui/mkswap
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/mkswap
>=20
>  meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

BTW: please see my first commit in poky@yoctoproject.org.

Thanks,
-- Dexuan=


