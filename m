Received: from mo4.mail-out.ovh.net ([178.32.228.4])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TcxFN-0002FX-Jo
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 12:53:09 +0100
Received: from mail413.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 3DD8A104FA47
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 09:07:07 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Nov 2012 09:59:10 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 26 Nov 2012 09:59:09 +0200
Date: Mon, 26 Nov 2012 08:59:09 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Message-ID: <20121126085909.64b59d37@eb-e6520>
In-Reply-To: <20121122111552.77470adb@eb-e6520>
References: <1353334373-16509-1-git-send-email-eric@eukrea.com>
	<20121122111552.77470adb@eb-e6520>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 2399574177325559193
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrvdehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehprhhofhhushhiohhnrdhmohgsihenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrvdehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehprhhofhhushhiohhnrdhmohgsihenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Subject: Re: [PATCH] kmod: fix git repo URL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 11:53:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Thu, 22 Nov 2012 11:15:52 +0100,
Eric B=E9nard <eric@eukrea.com> a =E9crit :
> is it possible to include this patch in danny as it fix a fetching
> error ?
> In master that's commit 156e0fca979585f72323041f8d8aeafcbd43dfc3
>=20
this patch fix :
ERROR: Function failed: Fetcher failure for URL:
'git://git.profusion.mobi/kmod.git;protocol=3Dgit;branch=3Dmaster'. Unable
to fetch URL from any source.

Is it possible to merge it into oe-core's danny branch ?

Thanks
Eric


