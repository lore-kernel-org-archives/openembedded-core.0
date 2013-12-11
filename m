Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A2C2C6A59E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 17:15:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 Dec 2013 09:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,872,1378882800"; d="scan'208";a="442523509"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2013 09:13:57 -0800
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 11 Dec 2013 17:13:32 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.215]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.169]) with mapi id
	14.03.0123.003; Wed, 11 Dec 2013 17:13:32 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] Various comms PUs
Thread-Index: AQHO8pOX5yH/wXF4e0yAAg9hg//PWJpPQ1dQ
Date: Wed, 11 Dec 2013 17:13:32 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CD067E@IRSMSX105.ger.corp.intel.com>
References: <cover.1386341976.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1386341976.git.cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Various comms PUs
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
X-List-Received-Date: Wed, 11 Dec 2013 17:15:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.
Integration?

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Cristian Iorga
Sent: Friday, December 6, 2013 5:00 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 0/2] Various comms PUs

The following changes since commit 184038bedb20f74ba4dcad6ef2d92e87a9ba5f9a=
:

  bitbake: fetch2/git: Ensure check is made in the correct directory (2013-=
12-06 14:10:15 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dciorga/PUs

Cristian Iorga (2):
  iptables: upgrade to 1.4.21
  iproute2: upgrade to 3.12.0

 .../iproute2/{iproute2_3.11.0.bb =3D> iproute2_3.12.0.bb}               | =
4 ++--
 .../iptables/{iptables_1.4.19.1.bb =3D> iptables_1.4.21.bb}             | =
4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)  rename meta/recipes-conn=
ectivity/iproute2/{iproute2_3.11.0.bb =3D> iproute2_3.12.0.bb} (68%)  renam=
e meta/recipes-extended/iptables/{iptables_1.4.19.1.bb =3D> iptables_1.4.21=
.bb} (92%)

--
1.8.3.2

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

