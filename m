Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QZc2T-0007lk-JN
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 07:05:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Jun 2011 21:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,411,1304319600"; d="scan'208";a="17245913"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 22 Jun 2011 21:53:49 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 23 Jun 2011 12:52:59 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 23 Jun 2011 12:52:59 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 23 Jun 2011 12:52:58 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Otavio Salvador' <otavio@ossystems.com.br>
Date: Thu, 23 Jun 2011 12:52:57 +0800
Thread-Topic: [OE-core] BUG: intltool depends on libxml-parser-perl to be
	installed on host
Thread-Index: AcwwJ8kVyoFkt+mvRfeziTxbmVaB+wBOY0NA
Message-ID: <1865303E0DED764181A9D882DEF65FB69C0BCF2480@shsmsx502.ccr.corp.intel.com>
References: <BANLkTin20ZXvBnT9phab1KZcZ1iCkO8RaQ@mail.gmail.com>
	<4DFD379B.8010701@mentor.com>
	<BANLkTimkH5e4ViO7aNP9typLSBvBKrSNxw@mail.gmail.com>
	<1865303E0DED764181A9D882DEF65FB6997B5E766E@shsmsx502.ccr.corp.intel.com>
	<BANLkTikJq-eeWNEAdAeZ7O3+qm7OZiH+zA@mail.gmail.com>
	<1865303E0DED764181A9D882DEF65FB6997B5E7679@shsmsx502.ccr.corp.intel.com>
	<BANLkTikWr=QrC4X5OSf8UhiYv=4VZa1EFg@mail.gmail.com>
In-Reply-To: <BANLkTikWr=QrC4X5OSf8UhiYv=4VZa1EFg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: BUG: intltool depends on libxml-parser-perl to be installed on host
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
X-List-Received-Date: Thu, 23 Jun 2011 05:05:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Otavio Salvador wrote:
> On Tue, Jun 21, 2011 at 12:20, Cui, Dexuan <dexuan.cui@intel.com>
> wrote:=20
>> I think I can reproduce the issue with the same steps on a Ubuntu
>> 10.10 host. I'm going to further look into this.
>> Please report a bug on the bugzilla, so we can better track it. :-)
>=20
> Sorry but I don't have an account on the tracking system and prefer if
> you do it.
Hi, I reported http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1191 for =
the issue.

Thanks,
-- Dexuan=


