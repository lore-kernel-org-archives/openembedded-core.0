Return-Path: <paul.barker.ct@bp.renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A11EC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 09:51:15 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlie5.idc.renesas.com [210.160.252.171])
 by mx.groups.io with SMTP id smtpd.web11.10087.1699437072652402383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 01:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: bp.renesas.com, ip: 210.160.252.171, mailfrom: paul.barker.ct@bp.renesas.com)
X-IronPort-AV: E=Sophos;i="6.03,285,1694703600"; 
   d="asc'?scan'208";a="182161881"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Nov 2023 18:51:11 +0900
Received: from unknown (unknown [10.226.92.197])
	by relmlir5.idc.renesas.com (Postfix) with SMTP id 64EE540065D0;
	Wed,  8 Nov 2023 18:51:09 +0900 (JST)
Date: Wed, 8 Nov 2023 09:51:08 +0000
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Neal Caidin <ncaidin@linuxfoundation.org>
Cc: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org,
	Stephen Jolley <sjolley.yp.pm@gmail.com>
Subject: Re: Yocto Project Status 07 November 2023 (WW45)
Message-ID: <20231108095108.isgnbfwa3jwl7ua4@GBR-5CG2373LKG.adwin.renesas.com>
References: <CAODMxsKUy025tWwNjod1mKu2WF4iyMmOUOigOxb-pt5jBMzhHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uxh2bpdrif3fhyyk"
Content-Disposition: inline
In-Reply-To: <CAODMxsKUy025tWwNjod1mKu2WF4iyMmOUOigOxb-pt5jBMzhHQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 09:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190309


--uxh2bpdrif3fhyyk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 07, 2023 at 10:52:53AM -0500, Neal Caidin wrote:
>    The Yocto Project website has had a refresh (www.yoctoproject.org)

The new website looks great!

Just a quick note - the links at the bottom of the page are mostly going
to https://yocto.dev-lfprojects3.linuxfoundation.org/.

E.g. "Technical Overview" goes to
https://yocto.dev-lfprojects3.linuxfoundation.org/development/technical-overview/

Thanks,
Paul

--uxh2bpdrif3fhyyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZUtZ+gAKCRDbaV4Vf/JG
vfvhAP93eGH1OUrJ/wG3Mto+5es36J3g2vWa093g0/lRlDyivgD/ZIsOSk2+5PHJ
9zHrlpuWDHtHOmdKBkABC1gaXXSMZQM=
=nQ1O
-----END PGP SIGNATURE-----

--uxh2bpdrif3fhyyk--

