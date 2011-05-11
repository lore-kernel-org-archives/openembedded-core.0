Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QKBhK-0006Ta-5b for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 17:51:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BFmpf4021407
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:48:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21131-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:48:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BFmkVF021401
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:48:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1305082484.git.edwin.zhai@intel.com>
References: <cover.1305082484.git.edwin.zhai@intel.com>
Date: Wed, 11 May 2011 16:48:40 +0100
Message-ID: <1305128920.30391.383.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Some fixes, Edwin, May11, 2011,
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
X-List-Received-Date: Wed, 11 May 2011 15:51:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-11 at 10:57 +0800, Zhai Edwin wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> Upgrade qemu git to fix bug 1013, and removed some unused files.
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: gzhai/fix3
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3
> 
> Thanks,
>     Zhai Edwin <edwin.zhai@intel.com>
> ---
> 
> 
> Zhai Edwin (2):
>   qemu: Upgrade qemu git to the latest 0.14 branch
>   clutter-cairo: remove remaining files from this obsolete recipe

Merged to master, thanks.

Richard



