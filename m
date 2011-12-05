Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RXbrh-0007Jk-Pd
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 17:58:05 +0100
Received: by eaac1 with SMTP id c1so698425eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 08:51:19 -0800 (PST)
Received: by 10.213.113.3 with SMTP id y3mr673016ebp.39.1323103878987;
	Mon, 05 Dec 2011 08:51:18 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q28sm60796759eea.6.2011.12.05.08.51.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 08:51:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 5 Dec 2011 17:51:13 +0100
In-Reply-To: <1323102278.25960.100.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
	<1323102278.25960.100.camel@ted>
Message-Id: <02152BB5-A4AD-46F8-905E-9B15842F7D16@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [RFC PATCH 0/2] introduce buildhistory.bbclass
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
X-List-Received-Date: Mon, 05 Dec 2011 16:58:05 -0000
X-Groupsio-MsgNum: 13620
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4B64584D-93D9-4275-8708-E1BA7CC81488";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4B64584D-93D9-4275-8708-E1BA7CC81488
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 5 dec. 2011, om 17:24 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-12-01 at 23:56 +0000, Paul Eggleton wrote:
>> 
>> Paul Eggleton (2):
>>  classes/buildhistory: add new output history collection class
>>  classes/buildhistory: merge in package history functionality
> 
> I've merged this. I don't think its perfect and I know Koen has found
> one potential issue but it provides a base people can send patches
> against :)

Awesome! 2 less patches for me to carry locally :)

regards,

Koen

--Apple-Mail=_4B64584D-93D9-4275-8708-E1BA7CC81488
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7c9oQACgkQMkyGM64RGpG7iwCfaqekDAQeV7NrTgkYDpWMn9zx
RecAnjDOXvx5z787fCPIYWp7Q5QRFu7l
=mAVd
-----END PGP SIGNATURE-----

--Apple-Mail=_4B64584D-93D9-4275-8708-E1BA7CC81488--
