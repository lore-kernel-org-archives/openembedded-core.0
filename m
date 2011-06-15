Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QWko5-0007rR-C5
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 09:46:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jun 2011 00:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,369,1304319600"; d="scan'208";a="13006365"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by azsmga001.ch.intel.com with ESMTP; 15 Jun 2011 00:43:02 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 15 Jun 2011 15:43:00 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 15 Jun 2011 15:42:59 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 15 Jun 2011 15:42:58 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jun 2011 15:42:57 +0800
Thread-Topic: [OE-core] [PATCH 0/2] fix the mesa-dri build failure after
	upgrading to newer glproto and dri2proto
Thread-Index: AcwrLZzkTE+7L2mrTqWjwRRdXqcS0wAAcZmg
Message-ID: <1865303E0DED764181A9D882DEF65FB699650124B6@shsmsx502.ccr.corp.intel.com>
References: <cover.1308122189.git.dexuan.cui@intel.com>
	<BANLkTi=z9NEzdU2=OCxGWVhdMBwsipXvgw@mail.gmail.com>
In-Reply-To: <BANLkTi=z9NEzdU2=OCxGWVhdMBwsipXvgw@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] fix the mesa-dri build failure after upgrading to newer glproto and dri2proto
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
X-List-Received-Date: Wed, 15 Jun 2011 07:46:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Martin Jansa wrote:
> On Wed, Jun 15, 2011 at 9:19 AM, Dexuan Cui <dexuan.cui@intel.com>
> wrote:=20
>> Please review them.
>=20
> Acked-by: Martin.Jansa <Martin.Jansa@gmail.com>
>=20
> with sort of deja vu :)
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dde74afec8a=
067071d17365438d6c462664bc5054
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df02e320146=
c701ad0f02f7daf52acac6389c71fd
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df2a73450a7=
0d113d77fbf703772fbf0db81e8e61

Yes, I made the same mistake... I should be more careful.

Thanks,
-- Dexuan=


