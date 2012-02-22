Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0LM4-0003az-4s for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 00:12:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MN3pMC002925
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:03:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02790-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:03:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MN3hXe002918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:03:44 GMT
Message-ID: <1329951824.32110.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 23:03:44 +0000
In-Reply-To: <cover.1329888524.git.edwin.zhai@intel.com>
References: <cover.1329888524.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Fixes for multilib
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
X-List-Received-Date: Wed, 22 Feb 2012 23:12:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-22 at 13:33 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> All,
> These are fixes for multilib, and [Yocto 1906].
> 
> Pls. help to pull.
> 
> Thanks,
> Edwin
> 
> The following changes since commit 41a83ccfe50ec69425a4828fb5836d38d3f99e67:
> 
>   guile: fix cross configure failure (2012-02-10 17:01:42 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib gzhai/master2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
> 
> Zhai Edwin (3):
>   quicky: Fix for multilib
>   texi2html: Fix for multilib

I merged these to master, thanks.

>   vte: fix scroll issue

I had some questions on this one.

Cheers,

Richard



