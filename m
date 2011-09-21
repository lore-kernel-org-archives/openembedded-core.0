Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6KNe-00052z-I4
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 12:50:18 +0200
Received: by fxi1 with SMTP id 1so1511917fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 03:45:00 -0700 (PDT)
Received: by 10.223.50.76 with SMTP id y12mr32488faf.71.1316601900449;
	Wed, 21 Sep 2011 03:45:00 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f25sm3911171faf.7.2011.09.21.03.44.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 03:44:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E790328.2010604@eukrea.com>
Date: Wed, 21 Sep 2011 12:44:53 +0200
Message-Id: <CFEB0FCC-7E86-49A1-87AB-E9E43FBAA094@dominion.thruhere.net>
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
	<CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
	<DD23E745-87D9-4831-85D4-C038CD79DCF7@dominion.thruhere.net>
	<CAP9ODKoemW81Sob3uUe-1LedWXcoJqEdkUGTj-+ZjgrUsytb_Q@mail.gmail.com>
	<49A59D49-5FF1-4F8D-A259-F6F8CA42ADC9@dominion.thruhere.net>
	<CAP9ODKpbVD-2AyXEMQG9D=6=F1n2kC-J=jOU7EPc2hWa_bjq6A@mail.gmail.com>
	<1316437421.14488.13.camel@ted> <4E77990A.5080504@eukrea.com>
	<4E790328.2010604@eukrea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Wed, 21 Sep 2011 10:50:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 20 sep. 2011, om 23:18 heeft Eric B=E9nard het volgende geschreven:

> Hi,
>=20
> ok 2 branches are available here : git://github.com/eukrea/oe-core.git
> - qt4_improve for improvement to existing qt 4.7.3,
> - qt4_upgrade for adding qt 4.7.4 (with DEFAULT_PREFERENCE=3D-1 as =
suggested by Koen.
>=20
> Please test them so that we can fix potential failures and send the =
pull request (I have compile test actually running with the latest =
changes in qt4_upgrade branch so this one is not yet fully tested).

I'm building the qt4_upgrade branch + =
http://patches.openembedded.org/patch/11289/ + PREFERRED_VERSION change =
in angstrom. If you don't hear anything the test went OK :)=


