Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 31F3D6158F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 10:51:50 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Sep 2013 03:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,922,1371106800"; d="scan'208";a="361671867"
Received: from unknown (HELO helios.localnet) ([10.252.123.194])
	by azsmga001.ch.intel.com with ESMTP; 17 Sep 2013 03:51:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jean-Charles JC =?ISO-8859-1?Q?Verdi=E9?= <jc@vtkloud.com>
Date: Tue, 17 Sep 2013 11:51:49 +0100
Message-ID: <2393464.QKBXZjeMRa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <07DD0C1F-96B0-4C4C-BC26-23EF171060F0@vtkloud.com>
References: <3047549.YMT2qeacCQ@helios> <1379345967717.a9ba8559@Nodemailer>
	<07DD0C1F-96B0-4C4C-BC26-23EF171060F0@vtkloud.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: lib ao ?
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
X-List-Received-Date: Tue, 17 Sep 2013 10:51:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Jay,

On Tuesday 17 September 2013 06:36:54 Jean-Charles JC Verdi=E9 wrote:
> > There isn't currently a libao recipe in common OE-Core based layers=

> > indexed by the layer index. FYI though there is a recipe in the
> > unofficial (and apparently unmaintained) meta-jlime layer here:
> >=20
> > https://github.com/tworaz/oe-tworaz/tree/master/meta-jlime
> >=20
> > It would be great to have this added to meta-multimedia - please te=
st it
> > and if it works for you please feel free to send a patch adding it =
to
> > meta- multimedia.
>=20
> I got a mix from theirs and mine working.
>=20
> Any recommendation on the patch process? I think I saw something on a=
 wiki
> someday about how to send patches, but I can't find it again :(

Here it is:

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

