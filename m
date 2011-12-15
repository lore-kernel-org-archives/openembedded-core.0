Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RbHth-0006c2-J4
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 21:27:21 +0100
Received: by faaa20 with SMTP id a20so2763192faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 12:20:23 -0800 (PST)
Received: by 10.180.91.137 with SMTP id ce9mr8522157wib.5.1323980423381;
	Thu, 15 Dec 2011 12:20:23 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bs13sm9897255wib.21.2011.12.15.12.20.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 12:20:22 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 15 Dec 2011 21:20:19 +0100
In-Reply-To: <4EEA4B27.6010908@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1322665120-29586-1-git-send-email-koen@dominion.thruhere.net>
	<D72EA3E2-0752-4F03-875F-77F5764313B1@dominion.thruhere.net>
	<4EEA4B27.6010908@linux.intel.com>
Message-Id: <CDCD2050-2245-497E-BCA8-5CCD67942034@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] webkit-gtk svn: update to r101488
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
X-List-Received-Date: Thu, 15 Dec 2011 20:27:21 -0000
X-Groupsio-MsgNum: 14277
Content-Type: multipart/signed;
	boundary="Apple-Mail=_02C7D198-66E1-4A27-B2A8-C4F2AE6B111A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_02C7D198-66E1-4A27-B2A8-C4F2AE6B111A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 15 dec. 2011, om 20:31 heeft Saul Wold het volgende geschreven:

> On 12/15/2011 07:16 AM, Koen Kooi wrote:
>> ping
>>=20
> I think there was a pending question about why zlib was needed the =
answer was quite terse, do you have any more information, is it a needed =
missing dependency or ???

"configure.ac wants it" sums it up completely and accurately. Is it =
really needed to turn short and simple answers into longwinded prose?=

--Apple-Mail=_02C7D198-66E1-4A27-B2A8-C4F2AE6B111A
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7qVoUACgkQMkyGM64RGpENsQCfUizJW7iaUgcy8Uh1Tli/5JUN
LsAAoI9bNjEcfYDcl1t50ze0ylGYPcjy
=31Sm
-----END PGP SIGNATURE-----

--Apple-Mail=_02C7D198-66E1-4A27-B2A8-C4F2AE6B111A--
