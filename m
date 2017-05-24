Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 54226780D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 20:53:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2017 13:53:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,388,1491289200"; 
	d="asc'?scan'208";a="1173930668"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.138])
	([10.219.128.138])
	by fmsmga002.fm.intel.com with ESMTP; 24 May 2017 13:53:56 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4.1494837087.git-series.patrick.ohly@intel.com>
	<237a1d6e-7c01-2488-c6a2-e5d0c95aff53@linux.intel.com>
	<1494851042.1179.246.camel@intel.com>
	<CAJTo0La_VMBTkXKD2Df5RAEWtEO5NFcQu29j-yO_PS-qZoT5bA@mail.gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <3a84eeba-58d0-bf74-61c3-b3b0d5292ad6@linux.intel.com>
Date: Wed, 24 May 2017 15:54:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La_VMBTkXKD2Df5RAEWtEO5NFcQu29j-yO_PS-qZoT5bA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] manpages.bbclass: avoid QA warning when "manpages" feature not supported
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
X-List-Received-Date: Wed, 24 May 2017 20:53:56 -0000
X-Groupsio-MsgNum: 97681
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="vpwuTEWwnag6uBjeFRHQV8katGKTEMNAA"

--vpwuTEWwnag6uBjeFRHQV8katGKTEMNAA
Content-Type: multipart/mixed; boundary="kPDtPx4pK72qj9BNC6J5Ffnbn8KbU1hDB";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <3a84eeba-58d0-bf74-61c3-b3b0d5292ad6@linux.intel.com>
Subject: Re: [OE-core] [PATCH] manpages.bbclass: avoid QA warning when
 "manpages" feature not supported
References: <9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4.1494837087.git-series.patrick.ohly@intel.com>
 <237a1d6e-7c01-2488-c6a2-e5d0c95aff53@linux.intel.com>
 <1494851042.1179.246.camel@intel.com>
 <CAJTo0La_VMBTkXKD2Df5RAEWtEO5NFcQu29j-yO_PS-qZoT5bA@mail.gmail.com>
In-Reply-To: <CAJTo0La_VMBTkXKD2Df5RAEWtEO5NFcQu29j-yO_PS-qZoT5bA@mail.gmail.com>

--kPDtPx4pK72qj9BNC6J5Ffnbn8KbU1hDB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 05/15/2017 08:06 AM, Burton, Ross wrote:
> Hi Jose,
>=20
> On 15 May 2017 at 13:24, Patrick Ohly <patrick.ohly@intel.com
> <mailto:patrick.ohly@intel.com>> wrote:
>=20
>     Patchwork-Status: Rejected
>=20
>=20
> The patch in patchworks hasn't been updated
> (https://patchwork.openembedded.org/series/6723/), I thought patchworks=

> was listening for these commands now?

Sorry is miss this message.

The command line is missing the squared brackets (the following should
do the work since I may have permissions):

[Patchwork-Status: Rejected]

Guys: Do you believe we should drop the brackets requirement?

>=20
> Ross=20
>=20
>=20


--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--kPDtPx4pK72qj9BNC6J5Ffnbn8KbU1hDB--

--vpwuTEWwnag6uBjeFRHQV8katGKTEMNAA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZJfLsAAoJEFJAtowlSEbnh3EH/jlYwPc1y7CgQQPaTQ9apPjv
Fm5oJhcsjGbBK+vz6WGajNEgcoTKKtxF/Ja3MnWY3Ezzh8GZlMKg4VNmKlNJGeGV
ZDck94ZPBld7GIhc/Q9q/VO4lF3Z+SICz0F2YhSt3lFtOSb641P1Jt/gEFaRvQm7
cvIWutzVbIKQV0FkUrq00DSXHkjP/xIDTw+5aCQB5QWKvwBkDHNju/eFTJP3wCND
atx+O3cmY896qRUTTNptLbCudUN4h6yWGM9z6zhMx8+R7NJyxi6lvQiOlgFXOCTr
Kw0f59kXnxkvurukUiiKMwSyEdZAtNXqU8zILez6EvC4wFum83kK7Bt81Bqqy3I=
=/vBa
-----END PGP SIGNATURE-----

--vpwuTEWwnag6uBjeFRHQV8katGKTEMNAA--
