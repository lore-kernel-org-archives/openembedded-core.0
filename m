Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RxAVt-0000N4-AN
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 06:01:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Feb 2012 20:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="109707278"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga002.jf.intel.com with ESMTP; 13 Feb 2012 20:53:01 -0800
Received: from pgsmsx101.gar.corp.intel.com (10.221.44.78) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 14 Feb 2012 12:52:39 +0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 14 Feb 2012 12:52:39 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Tue, 14 Feb 2012 12:52:31 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
Thread-Index: AQHM5Jp97Pbc8lqZrEypBMe+2Mjq8ZYwkCYAgAB7r4CAAAfhgIAAePiAgAASi4CAAB4EgIAE6RCAgAABJgCAA1EYgIAAXW8AgAAFRgCAAYPjAA==
Date: Tue, 14 Feb 2012 04:52:30 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FCE7381@SHSMSX102.ccr.corp.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<20120213074852.GA3832@jama.jama.net>
	<CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
	<60152733-3093-4B6D-8D98-517DEA75C5A2@dominion.thruhere.net>
In-Reply-To: <60152733-3093-4B6D-8D98-517DEA75C5A2@dominion.thruhere.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Tue, 14 Feb 2012 05:01:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>>>>=20
>>>> It works if you -c cleansstate on a bunch of recipes, pango, cairo, fo=
ntconfig, gtk+, etc
>>>=20

I tried rpm-native after "-c cleansstate", but it still asks for libz.la? A=
nyone has the clue?

Best Regards,
Lianhao




