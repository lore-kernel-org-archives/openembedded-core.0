Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E6DBB7719B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:51:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 04 Feb 2016 12:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; 
	d="asc'?scan'208";a="740718935"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by orsmga003.jf.intel.com with ESMTP; 04 Feb 2016 12:51:14 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<4933227.rYH5s4XHH6@peggleto-mobl.ger.corp.intel.com>
	<56B3B6E0.4000309@linux.intel.com>
	<5160543.ahmzsokFdT@peggleto-mobl.ger.corp.intel.com>
	<1454618841.27087.244.camel@linuxfoundation.org>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B3BA38.8010605@linux.intel.com>
Date: Thu, 4 Feb 2016 14:53:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1454618841.27087.244.camel@linuxfoundation.org>
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 23/28] Revert "classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable"
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
X-List-Received-Date: Thu, 04 Feb 2016 20:51:15 -0000
X-Groupsio-MsgNum: 77549
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="mN2TOJAc6F2KHxleLgwLopFP59PL56drk"

--mN2TOJAc6F2KHxleLgwLopFP59PL56drk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 02/04/2016 02:47 PM, Richard Purdie wrote:
> On Fri, 2016-02-05 at 09:40 +1300, Paul Eggleton wrote:
>> On Thu, 04 Feb 2016 14:38:56 An=C3=ADbal Lim=C3=B3n wrote:
>>> No i don't mean that way because i don't agree with this change and
>>> i
>>> consider this as *CENSURE* because if i someone don't agree a
>>> change the
>>> why? information need to be placed in the git repository for future
>>> references.
>>
>> We don't put the entire history of decisions on a change in the git
>> history=20
>> (certainly not in the form of commit and revert, anyway) or it would
>> be really=20
>> hard to follow when looking back in future. If you want to record
>> that we=20
>> discussed this alternative solution, the place to do it would be in
>> the commit=20
>> message where you make the redirection change, which was the
>> alternative to=20
>> this.
>=20
> I'd also add that this is clearly being discussed on the mailing list,
> so there *is* a very clear public record of it.
>=20
> There are patches I've disagreed with which I have merged and there are=

> patches I've written, then dropped as after discussion they weren't
> right (sstate using xz is a recent obvious one). Censorship would be
> not even allowing those discussions to happen, we don't do that, very
> much the opposite.
>=20
> As Paul says, we don't put it all into git history though.

Ok, i'll add the comments and the link to the ML in the original commit
and drop the another two.

There is a place/wiki/etc where this kind of issues are explained?

	alimon


>=20
> Cheers,
>=20
> Richard
>=20
>=20


--mN2TOJAc6F2KHxleLgwLopFP59PL56drk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWs7o7AAoJEGJqcE9h3glgj2sP/0+zZSzQXaLudynhA6P8iVvY
V/aF6ahS33joSXSqTC3cocC6eBC9jEzzTZxsEL0CDytsWPzwq6wo1dfKlQVizLUX
iiFQxBYVk+3iNx5gpiboaQ1yCCRhUo4mjTo9MQM0tl6wwrTL+t3DO135yCib+a6V
MlyJpkyIGZNr6puwMx8kAuUDmilCmfHPmPN9mm4h5eM/w/urhrHm5+npPIku4mI0
fSJNGzefGev7I0xrBiSHm/6fECjGLymQmhJi+N5tDD3W8HwBlzex4McRxbIBOka1
8ccIxCEE2IWnrJpP7Zts9jl0FwlAKnYW6IxZEA8xo35crgTU6MrrK++uq7vaSdHm
DFEKWyUFHZbHynVi6kvd46nLxR4qW8DHwatkk9hjg1nYAAKlhc6d7Sl57fe0uemz
SMslFY3AzBmKZR5EdwCGsVZeSUV/6uX8bQ47TTpH2fYqRtjbvT54RHJv/IZY5jH1
T6a1mFchd5eFqbNYWFOFZoqshkF5dkep/4RGWRlRPuN0Cs2hdabsgQGLO2Z/1xUh
prhum0MEpmLc7djp16KuFEpiHeKUMHhIjoZf26HDF5eayO4LCB84QvQf4n1f+uWK
oNmND6sdkflSw8bguXQ/OsQXgwxVLwpbrnng/Kxf/Jnz+Ews+bmg7v+MPKlTaNFU
q5s8IXQlOHLL08fFyvX9
=+5od
-----END PGP SIGNATURE-----

--mN2TOJAc6F2KHxleLgwLopFP59PL56drk--
