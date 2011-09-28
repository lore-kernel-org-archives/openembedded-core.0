Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R8rXb-0000Rm-Rx
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 12:39:06 +0200
Received: from mail618.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 716A8FF9250
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 12:24:14 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 28 Sep 2011 12:23:24 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 28 Sep 2011 12:23:23 +0200
Message-ID: <4E82F59B.7080808@eukrea.com>
Date: Wed, 28 Sep 2011 12:23:23 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
References: <20110911172241.GA3674@chargestorm.se>
	<D9F00ABD-04FA-4A75-BB1C-13B9BBDC4C54@dominion.thruhere.net>
	<4E79E3A9.8080804@eukrea.com>
	<201109281111.33193.paul.eggleton@linux.intel.com>
In-Reply-To: <201109281111.33193.paul.eggleton@linux.intel.com>
X-Ovh-Tracer-Id: 17697739160889830845
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -200
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrfeeiucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmneculddquddttddm
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 28 Sep 2011 10:39:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Le 28/09/2011 12:11, Paul Eggleton a =E9crit :
> On Wednesday 21 September 2011 14:16:25 Eric B=E9nard wrote:
>> Le 21/09/2011 15:05, Koen Kooi a =E9crit :
>>> WARNING: For recipe qt4-x11-free, the following files were installed =
but
>>> not shipped in any package:
>>> WARNING:   /usr/share/qt4/phrasebooks/swedish.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/dutch.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/german.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/polish.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/danish.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/japanese.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/finnish.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/norwegian.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/french.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/russian.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/spanish.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/hungarian.qph
>>> WARNING:   /usr/share/qt4/phrasebooks/italian.qph
>>
>> OK I forget to integrate Otavio's patch which fix the translations. I'=
ll
>> update tonight.
>
> Did you have a chance to do this? I don't see an additional commit in t=
he
> qt4_upgrade branch in your repo.
>
I have the patch locally and I will (really) work on this tonight.
Sorry for the delay I've been overbusy since last wednesday.

Eric


