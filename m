Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R3pqp-0000ye-18
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 15:50:07 +0200
Received: from mail409.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 567A210286B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 15:09:27 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 Sep 2011 15:09:04 +0200
Received: from unknown (HELO ?10.34.17.177?)
	(ebenard%eukrea.com@193.192.232.55)
	by ns0.ovh.net with SMTP; 14 Sep 2011 15:09:02 +0200
Message-ID: <4E70A76E.1030101@eukrea.com>
Date: Wed, 14 Sep 2011 15:09:02 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
References: <20110911172241.GA3674@chargestorm.se>
	<1315762415-18070-1-git-send-email-eric@eukrea.com>
	<201109121134.42474.paul.eggleton@linux.intel.com>
	<FF2EB738-77F7-4BC5-BB83-82ED8CBC0F96@dominion.thruhere.net>
In-Reply-To: <FF2EB738-77F7-4BC5-BB83-82ED8CBC0F96@dominion.thruhere.net>
X-Ovh-Tracer-Id: 12064580451870420418
X-Ovh-Remote: 193.192.232.55 ()
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
X-List-Received-Date: Wed, 14 Sep 2011 13:50:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 14/09/2011 13:11, Koen Kooi a =E9crit :
>
> Could you please give us an heads-up when this is going in, since it ne=
eds matching commits to meta-oe and meta-angstrom as well to keep the .bb=
appends working. If we don't succeed in merging the bbappend changes into=
 oe-core we should consider breaking the 'git mv oldrecipe newrecipe' int=
o an add and delete spaced a day apart.
>
I sent patches to update meta-oe, meta-angstrom & meta-intel : did you ge=
t them ?

Eric



