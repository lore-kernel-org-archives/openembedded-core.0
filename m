Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3899765C78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:57:20 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so22206426wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 00:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=TritDr0UeTCqZpgNA3eGO2ij0k92q3L8QhNCVBzANUg=;
	b=WSg+zK6+2YxkjA+vBrXcqEGB+ADMVh8zUIakS54WSW1CkWn0KaUmkH1L74vv6eFtFz
	/6Q6wfZFmJ2GQn35pcewGga+JDLGMmB9Tpwp7pZv3cTXG0/pgC62GXjTURbqLpL0rHfI
	KNq1A9tsEaqocqu4GbdAEVXVPsIYyHN3uKVetCDL6GNTkJvpWlo/rRR6zpdLVPaBmHJk
	g+bFgMqaH/Ql2ak/nMQV6sXdFw3xrOM/Ucyity3wfipDrX8gN8OIzbvJJOJNxqOkwCtp
	57Ipvey5divmH+IucyLgzyhTaUJQPpleqmhcoUzJyi5VFHDPxEormKrLT/3lLWgVB1sK
	e6kA==
X-Received: by 10.180.206.147 with SMTP id lo19mr19656788wic.79.1436774240114; 
	Mon, 13 Jul 2015 00:57:20 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	m4sm27650028wjb.37.2015.07.13.00.57.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jul 2015 00:57:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAJTo0LZkMtES=kPa17dV_Sb6P3RYhdGhTK=iuLfJymzykvTBzw@mail.gmail.com>
Date: Mon, 13 Jul 2015 09:57:44 +0200
Message-Id: <635A9611-7B0D-4FB0-A643-88ACFAEE4C27@gmail.com>
References: <3EECF939-15F6-43A4-BE87-CC1D57121CD1@gmail.com>
	<CAJTo0LZkMtES=kPa17dV_Sb6P3RYhdGhTK=iuLfJymzykvTBzw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2102)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Update rrdtool from 1.4.8 to 1.5.3
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
X-List-Received-Date: Mon, 13 Jul 2015 07:57:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 10.07.2015 um 21:50 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
>=20
> On 9 July 2015 at 17:38, Jens Rehsack <rehsack@gmail.com> wrote:
> here is an update patch for meta-oe/recipes-extended/rrdtool:
> =
https://github.com/rehsack/meta-openembedded/commit/6ed5b4489beb1233bd4b3c=
9f73064e973eeef2ad
>=20
> Please send the actual patch instead of a link to the patch, and =
meta-oe patches go to openembedded-devel@ not -core@.

I was told by RP that sending patches via GitHub is fine. Unfortunately =
that's the best I can do.
When it's clear how to submit patches, I'll go ahead to oe-devel@

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


