Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RSvMv-0001EX-9p
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 19:46:57 +0100
Received: by wwo1 with SMTP id 1so397720wwo.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 10:40:26 -0800 (PST)
Received: by 10.227.203.145 with SMTP id fi17mr2523956wbb.5.1321987226043;
	Tue, 22 Nov 2011 10:40:26 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	fw16sm17511333wbb.13.2011.11.22.10.40.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 10:40:24 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4ECBCBA7.8080208@linux.intel.com>
Date: Tue, 22 Nov 2011 19:40:20 +0100
Message-Id: <29FD771C-BFCA-4EB8-8CB0-6268D1933203@dominion.thruhere.net>
References: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
	<4ECBCBA7.8080208@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/2] libjson: add 0.9
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
X-List-Received-Date: Tue, 22 Nov 2011 18:46:58 -0000
X-Groupsio-MsgNum: 12735
Content-Type: multipart/signed;
	boundary="Apple-Mail=_73173A44-468B-41BE-927A-645DA26760C3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_73173A44-468B-41BE-927A-645DA26760C3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 22 nov. 2011, om 17:19 heeft Saul Wold het volgende geschreven:

> On 11/21/2011 10:12 AM, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>  meta/recipes-devtools/libjson/libjson_0.9.bb |   13 +++++++++++++
>>  1 files changed, 13 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
>>=20
>> diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb =
b/meta/recipes-devtools/libjson/libjson_0.9.bb
>> new file mode 100644
>> index 0000000..4d609a6
>> --- /dev/null
>> +++ b/meta/recipes-devtools/libjson/libjson_0.9.bb
>> @@ -0,0 +1,13 @@
>> +DESCRIPTION =3D "JSON-C - A JSON implementation in C"
>> +
>> +LICENSE =3D "MIT/X11"
>=20
> I believe that LICENSE =3D "MIT" (or MIT-X) as the standard entry.
> Maybe Beth can give the correct version here.

Thanks for the feedback, I'll wait for Beth to tell use the proper form =
before sending a v2.

regrds,

Koen=

--Apple-Mail=_73173A44-468B-41BE-927A-645DA26760C3
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7L7JYACgkQMkyGM64RGpGKCgCfeT8vwcZRVRFLoutB97sBm/iJ
VxUAnjBZw19XnIFIa8XUkpyi025FLDHm
=RgrN
-----END PGP SIGNATURE-----

--Apple-Mail=_73173A44-468B-41BE-927A-645DA26760C3--
