Received: from 18.mo5.mail-out.ovh.net ([178.33.45.10]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R6NKx-0000TF-7D
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 15:59:43 +0200
Received: from mail434.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 678991004F4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 15:20:47 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2011 15:16:26 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2011 15:16:26 +0200
Message-ID: <4E79E3A9.8080804@eukrea.com>
Date: Wed, 21 Sep 2011 15:16:25 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
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
	<CFEB0FCC-7E86-49A1-87AB-E9E43FBAA094@dominion.thruhere.net>
	<4E79DE1D.5000303@eukrea.com>
	<D9F00ABD-04FA-4A75-BB1C-13B9BBDC4C54@dominion.thruhere.net>
In-Reply-To: <D9F00ABD-04FA-4A75-BB1C-13B9BBDC4C54@dominion.thruhere.net>
X-Ovh-Tracer-Id: 16404924593396559298
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrvddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 21 Sep 2011 13:59:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 21/09/2011 15:05, Koen Kooi a =E9crit :
> WARNING: For recipe qt4-x11-free, the following files were installed bu=
t not shipped in any package:
> WARNING:   /usr/share/qt4/phrasebooks/swedish.qph
> WARNING:   /usr/share/qt4/phrasebooks/dutch.qph
> WARNING:   /usr/share/qt4/phrasebooks/german.qph
> WARNING:   /usr/share/qt4/phrasebooks/polish.qph
> WARNING:   /usr/share/qt4/phrasebooks/danish.qph
> WARNING:   /usr/share/qt4/phrasebooks/japanese.qph
> WARNING:   /usr/share/qt4/phrasebooks/finnish.qph
> WARNING:   /usr/share/qt4/phrasebooks/norwegian.qph
> WARNING:   /usr/share/qt4/phrasebooks/french.qph
> WARNING:   /usr/share/qt4/phrasebooks/russian.qph
> WARNING:   /usr/share/qt4/phrasebooks/spanish.qph
> WARNING:   /usr/share/qt4/phrasebooks/hungarian.qph
> WARNING:   /usr/share/qt4/phrasebooks/italian.qph

OK I forget to integrate Otavio's patch which fix the translations. I'll=20
update tonight.

Eric



