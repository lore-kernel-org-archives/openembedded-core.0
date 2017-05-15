Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C063272F2D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 14:40:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 15 May 2017 07:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,345,1491289200"; 
	d="asc'?scan'208";a="261797195"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.129])
	([10.219.128.129])
	by fmsmga004.fm.intel.com with ESMTP; 15 May 2017 07:40:47 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	Patrick Ohly <patrick.ohly@intel.com>
References: <1494607799-32105-1-git-send-email-anibal.limon@linux.intel.com>
	<5247c79d-2131-0bff-8970-4c4bcef387a0@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <5919BDFD.5080308@linux.intel.com>
Date: Mon, 15 May 2017 09:41:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5247c79d-2131-0bff-8970-4c4bcef387a0@linux.intel.com>
Subject: Re: [PATCH] qemu: Upgrade to 2.8.1.1
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
X-List-Received-Date: Mon, 15 May 2017 14:40:54 -0000
X-Groupsio-MsgNum: 97291
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="l4p4DFhB0Ljl4hgsivucushxms3iVSLFj"

--l4p4DFhB0Ljl4hgsivucushxms3iVSLFj
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 05/15/2017 05:49 AM, Alexander Kanavin wrote:
> On 05/12/2017 07:49 PM, An=C3=ADbal Lim=C3=B3n wrote:
>> Removed patch target-ppc-fix-user-mode.patch [1] already on
>> upstream.
>>
>> [1] http://git.qemu.org/?p=3Dqemu.git;a=3Dhistory;f=3Dlinux-user/main.=
c;
>> h=3D65a769cf797254a86a7cf589d69e67595a9e1adb;hb=3Drefs/heads/stable-2.=
8
>>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>=20
> Upstream is already at 2.9, why this version?

Patrick has a patches for enable TPM into QEMU 2.8.x line, but there
apply into 2.9.x but the compile fails.

I guess there's a need to work on those patches before 2.9.x upgrade.

Cheers,
	Anibal

>=20
> Alex
>=20


--l4p4DFhB0Ljl4hgsivucushxms3iVSLFj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJZGb4CAAoJEGJqcE9h3glg+n0QAIIk4lw8ikhAv2prwjQJOk2X
R/11CFWhYsWWVNsIUA4LVVxTGSfI6XIE423yF0jI4TV3u+Rr2eqbKK69ZjoMKo6o
d/D9gkBmPXADrUnrhoDJcv1n4deJeie24VuaFwr9XgHs58IA/xFLVWxDCwJB9uf3
xLx3fOyrQfnuOiU6CFIn9YwSzfh2UsyeciCEiuXNuiXL9EyS+YoqGEcKFffE+a7s
1t0xPuz0bkpaarw7VqoFRIkovp+S3JXUAK519I/hfk5hmL0g3bTzaMjcS9syl3+O
KgY3yt+YsRLB1SWK6xxLLxUx/ZRx847BU4ESOpc0L+/OvQpXoOKvQ8bqlY3pH0Ny
JHA3zKEZouX/KfeVV76S/zgB0JdhpH6MvRq9h5UvLx9WTZzpF2WU9Htnwr0OoVVB
joLrqLNMM7N7tUdzsuaOYvi/mfa9oSV+3f61FNfHRE3VFqMRd7T2YDhAncsSzNYL
XMpILfwxrjDmHfYfB1Yt/om4wH4jj1LZwpep6Ebf8R8o2Xxbu+tE+3DtvAs2fooW
qmFvgTwVw1Z0yvV1UANAn/Q7ZcBZIKsZc8ZQ8JYj7ihxgivD00VDwignY2Frvk6b
0/PsJ/MYH/PEAGchMFUpdjoOQo3ZI6MnrR54LmhY/0Q4rtBmUdFA7tt3/xiXENNb
Nf/BScrQwVLzvFQK4yJ9
=Jh6E
-----END PGP SIGNATURE-----

--l4p4DFhB0Ljl4hgsivucushxms3iVSLFj--
