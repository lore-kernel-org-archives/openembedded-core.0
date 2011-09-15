Received: from 1.mo1.mail-out.ovh.net ([178.32.127.22]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R4H8e-0000E1-Ks
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 20:58:21 +0200
Received: from mail189.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 4B63A1000E98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 20:42:35 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 15 Sep 2011 20:41:49 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.9?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 15 Sep 2011 20:41:48 +0200
Message-ID: <4E7246EB.2070607@eukrea.com>
Date: Thu, 15 Sep 2011 20:41:47 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: sgw@linux.intel.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
References: <20110911172241.GA3674@chargestorm.se>
	<1315762415-18070-1-git-send-email-eric@eukrea.com>
	<201109121134.42474.paul.eggleton@linux.intel.com>
	<FF2EB738-77F7-4BC5-BB83-82ED8CBC0F96@dominion.thruhere.net>
	<1316107938.1058.80.camel@swold-mobl.bigsur.com>
In-Reply-To: <1316107938.1058.80.camel@swold-mobl.bigsur.com>
X-Ovh-Tracer-Id: 5110178202814360985
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrfeegucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 15 Sep 2011 18:58:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Saul,

Le 15/09/2011 19:32, Saul Wold a =C3=A9crit :
>> Could you please give us an heads-up when this is going in, since it n=
eeds matching commits to meta-oe and meta-angstrom as well to keep the .b=
bappends working. If we don't succeed in merging the bbappend changes int=
o oe-core we should consider breaking the 'git mv oldrecipe newrecipe' in=
to an add and delete spaced a day apart.
>>
> Koen,
>
> We are going to hold off on this one until we complete the 1.1 RC
> branching and open master up for development again.
>
Does that mean we have to wait the 5th of october to get this merged in o=
e-core ?

In that case, maybe we could have a dev or testing branch in oe-core in o=
rder=20
to have a more reactive development than Yocto ?

Btw, this patch is only a minor update of qt so this would be interesting=
 to=20
have it into the 1.1 release imho.

Eric


