Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TwC9H-0005Ef-S5 for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 14:38:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0IDMvkl009164;
	Fri, 18 Jan 2013 13:22:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05490-06; Fri, 18 Jan 2013 13:22:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0IDMpfR009158
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 18 Jan 2013 13:22:52 GMT
Message-ID: <1358515371.27799.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cristian Iorga <cristian.iorga@intel.com>
Date: Fri, 18 Jan 2013 13:22:51 +0000
In-Reply-To: <1358509171-19924-2-git-send-email-cristian.iorga@intel.com>
References: <1358509171-19924-1-git-send-email-cristian.iorga@intel.com>
	<1358509171-19924-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] alsa-utils: upgrade to 1.0.26
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
X-List-Received-Date: Fri, 18 Jan 2013 13:38:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-18 at 13:39 +0200, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../alsa/alsa-utils-1.0.25/ncursesfix.patch        |   44 --------------------
>  ...-t-let-systemd-unit-restore-the-volume-wh.patch |    0
>  .../obsolete_automake_macros.patch                 |    0
>  .../uclibc-exp10-replacement.patch                 |    0
>  .../{alsa-utils_1.0.25.bb => alsa-utils_1.0.26.bb} |    7 ++--
>  5 files changed, 3 insertions(+), 48 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch

What happened to the patch?

Cheers,

Richard



