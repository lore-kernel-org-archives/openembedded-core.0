Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGRsV-0005Vu-Da for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 11:56:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8P9hZFk006886;
	Tue, 25 Sep 2012 10:43:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04326-10; Tue, 25 Sep 2012 10:43:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8P9hQ3v006880
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 25 Sep 2012 10:43:27 +0100
Message-ID: <1348566207.8662.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 25 Sep 2012 10:43:27 +0100
In-Reply-To: <cover.1348518160.git.bruce.ashfield@windriver.com>
References: <cover.1348518160.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] linux-yocto/3.4: v3.4.11 and BSP updates
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
X-List-Received-Date: Tue, 25 Sep 2012 09:56:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 16:25 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Updating the 3.4 trees SRCREVs to pickup the korg v3.4.11 -stable
> and some minor tweaks to the beagleboard config to prep for a switch
> to 3.4 as the preferred kernel version.
> 
> Build and boot tested on qemu* and build testing was done the hardware
> reference boards.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit 8b3aa00029e62df6d05710cf166fd5d09bdb29cf:
> 
>   documentation/poky-ref-manual/ref-variables.xml: Update B variable (2012-09-24 16:36:09 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (2):
>   linux-yocto/3.4: update kver to v3.4.11
>   linux-yocto/3.4: update beagleboard configs

Merged to master, thanks.

Richard



