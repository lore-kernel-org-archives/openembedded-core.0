Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R9bw6-0006hl-VM
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 14:11:27 +0200
Received: from mail180.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 5C55EDCA705
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 13:48:44 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Sep 2011 13:47:07 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 30 Sep 2011 13:47:05 +0200
Message-ID: <4E85AC39.6000500@eukrea.com>
Date: Fri, 30 Sep 2011 13:47:05 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
References: <20110911172241.GA3674@chargestorm.se>
	<D9F00ABD-04FA-4A75-BB1C-13B9BBDC4C54@dominion.thruhere.net>
	<4E79E3A9.8080804@eukrea.com>
	<201109281111.33193.paul.eggleton@linux.intel.com>
	<4E82F59B.7080808@eukrea.com>
In-Reply-To: <4E82F59B.7080808@eukrea.com>
X-Ovh-Tracer-Id: 12409950250339904962
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrheehucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Fri, 30 Sep 2011 12:11:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

I've updated and tested the branches by rebasing on current oe-core and
integrating Otavio's patch concerning the translations :
https://github.com/eukrea/oe-core/tree/qt4_improve
https://github.com/eukrea/oe-core/tree/qt4_upgrade

Is that OK for you or should I rework something ?

Eric


