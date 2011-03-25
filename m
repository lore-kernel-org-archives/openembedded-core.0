Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q374z-0007oC-Bg for openembedded-core@lists.openembedded.org;
	Fri, 25 Mar 2011 14:29:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2PDRb74018898;
	Fri, 25 Mar 2011 13:27:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18582-02; Fri, 25 Mar 2011 13:27:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2PDRUsK018888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 Mar 2011 13:27:30 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1300991725.git.bruce.ashfield@windriver.com>
References: <cover.1300991725.git.bruce.ashfield@windriver.com>
Date: Fri, 25 Mar 2011 13:27:23 +0000
Message-ID: <1301059643.3018.125.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 0/1] linux-yocto: update to v2.6.37.5
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
X-List-Received-Date: Fri, 25 Mar 2011 13:29:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-24 at 14:37 -0400, Bruce Ashfield wrote:
> I missed 2.6.37.4 when I was away for a week, so now that
> 2.6.37.5 is out, we can grab both of them a single update.
> 
> As the patch indicates, I built and booted this on all the
> relevant qemu targets.
> 
> This is against meta master, if I've got it in the wrong place,
> just let know.
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: zedd/kernel
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Thanks,
>     Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> 
> 
> Bruce Ashfield (1):
>   linux-yocto: update to 2.6.37.5
> 
>  .../conf/distro/include/poky-default-revisions.inc |   24 ++++++++++----------
>  1 files changed, 12 insertions(+), 12 deletions(-)

Merged to master, thanks.

Richard



