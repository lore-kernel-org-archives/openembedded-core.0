Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C1C4460745
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:05:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2016 08:04:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; 
	d="asc'?scan'208";a="15475402"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.142])
	([10.219.5.142])
	by orsmga002.jf.intel.com with ESMTP; 08 Dec 2016 08:04:46 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
	<2b7e685f6ff33f4c12d0f4d025db3689df43ad83.1481142664.git.anibal.limon@linux.intel.com>
	<CAJTo0LYP1kqqLOy6w_L_bh1uAF8pta8d7mZQyJgF2r=zaiLUhg@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <5849851C.80102@linux.intel.com>
Date: Thu, 8 Dec 2016 10:06:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYP1kqqLOy6w_L_bh1uAF8pta8d7mZQyJgF2r=zaiLUhg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 16/32] oeqa/core: Change name of d to td
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
X-List-Received-Date: Thu, 08 Dec 2016 16:05:59 -0000
X-Groupsio-MsgNum: 90466
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="2WK2ABpxbF0x1QARvkErr09vGTCOKKftI"

--2WK2ABpxbF0x1QARvkErr09vGTCOKKftI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sure, sending v3.

	alimon

On 12/08/2016 08:41 AM, Burton, Ross wrote:
> On 7 December 2016 at 20:32, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux=
=2Eintel.com>
> wrote:
>=20
>> The d variable references the test data into a test context, so
>> makes a more sense to call it: td (test data).
>>
>=20
> Can you squash this into the commits where they are introduced (don't n=
eed
> to see your working, etc).
>=20
> Ross
>=20


--2WK2ABpxbF0x1QARvkErr09vGTCOKKftI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYSYUeAAoJEGJqcE9h3glgxnAP/RGxTqAJ4dqZAHswJ06eYsZ5
WPnhd01O1X4Rs5XcWCDEVAJK2zEQRNGv8HIkD6JISJqvA7fjUbngF9I8BNDeR7EK
jA+Gzsmfw2sJETDSd0uUs7PIUO8P1F8VAIyElL17yvXd/mYm8LyBiCzscLRk3j8Y
+MHcso6xsTeeVVtnYJ/KyvCxWTTG7q9qXDim4eak2VFV3I+pdSCc/FjdaQxf/vS0
Ib1otsOKYhcd8TmE3Ax0dUadvZp76Mafvb8hVa6KCQ3PLbNr6vL02ffxAZxLMfJ4
b6no/SWyGTfV31z9qTgBKF+DPze2sxtt3l61cz1H3ry4gSzkNjUOgEAGEbQJwPc3
itdC9+P10qtKmk/BC5dVm8KHS6WoCGosRCCLwW0smJCfYO9raktiou0x9aaQ+TIV
pzzq6/JIeNkHkcNMP1g8khvsBNOXYrpK9Y76jQRBO6jy6ijjR3AAlXkNtwWj10RT
3rX0lsxUlvzDYsYv9yIN259EcBDqhC/6qjs5iVlKKQ3tRfgshY2PArkxaeVZp2Ro
XOtYQLWrj+1nS3QU0COrsCAEjWjDcXrS7RSGYTLcbGy40FPAYl08N5Ci6gdSGRU8
O8OvRyQXy2O/Yl2OunRBwX6to8RbOqt3ECOzE+ZCyzOYBbbr3PED12u5KS0Ilj/A
cZx91HpBqmvHy6pL/Sef
=z7QJ
-----END PGP SIGNATURE-----

--2WK2ABpxbF0x1QARvkErr09vGTCOKKftI--
