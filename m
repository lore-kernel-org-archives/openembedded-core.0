Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW4JY-0001Ds-1V
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 11:56:28 +0100
Received: by faaa19 with SMTP id a19so955879faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 02:49:47 -0800 (PST)
Received: by 10.180.88.106 with SMTP id bf10mr4461872wib.25.1322736586985;
	Thu, 01 Dec 2011 02:49:46 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o3sm262608wiy.14.2011.12.01.02.49.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 02:49:46 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 11:49:44 +0100
In-Reply-To: <CAGiJk9dH=1aV-YFkcr8aAkNsMq+dM4625FuOJHF_et4bYBPA+A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAGiJk9dH=1aV-YFkcr8aAkNsMq+dM4625FuOJHF_et4bYBPA+A@mail.gmail.com>
Message-Id: <528C3B90-90CF-48F7-AD32-0200B1F16F82@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: RFC: On-screen- / virtual-keyboard
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
X-List-Received-Date: Thu, 01 Dec 2011 10:56:28 -0000
X-Groupsio-MsgNum: 13412
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7AC34358-70A6-4F74-889A-DEE91562BB5D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7AC34358-70A6-4F74-889A-DEE91562BB5D
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 1 dec. 2011, om 11:47 heeft Samuel Stirtzel het volgende geschreven:

> Hi,
> some devices like the Nokia N900 or the OpenPandora provide a hardware
> keyboard,
> other devices need USB keyboards to operate, but how could a user
> input text into a touchscreen-only device?
> 
> 
> #1. The situation
> 
> Portable devices with a touchscreen usually provide virtual keyboards,
> looking around in OE-dev and OE-Core,
> there is illume-keyboard but i doubt it can be used with XFCE that easily.
> 
> To tell the user that he has to buy a (small) hardware keyboard to use
> a touchscreen device isn't an "appropriate" solution,
> if you know what I mean ;)
> 
> 
> 
> #2. What was already discovered
> 
> There are plenty of virtual keyboards out there, for example:
> -gok (gnome on-screen keyboard) [1]
> -kvkbd (kde virtual keyboard) [2]
> -illume-keyboard (e17 enlightenment on-screen-keyboard add-on) [3]
> -onboard (generic on-screen keyboard) [4]
> -(Qt) Colibri (in application virtual keyboard) [5]
> -(Qt/Gtk2/Gtk3) Maliit (in application virtual keyboard) [6]

Don't forget matchbox-keyboard and matchbox-keyboard2 :)



--Apple-Mail=_7AC34358-70A6-4F74-889A-DEE91562BB5D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XW8gACgkQMkyGM64RGpF+sgCdFq05F+xa6cUusIwJSRGfv7aH
nYAAn1Cl4oyodEXuIRrJfE4ujCYb7Ez7
=EKCz
-----END PGP SIGNATURE-----

--Apple-Mail=_7AC34358-70A6-4F74-889A-DEE91562BB5D--
