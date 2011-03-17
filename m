Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q012M-0004mf-So for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 01:25:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2H0OFOT011928
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 00:24:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11626-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 00:24:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2H0O7wq011922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 00:24:07 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1300297594.git.paul.eggleton@linux.intel.com>
References: <cover.1300297594.git.paul.eggleton@linux.intel.com>
Date: Thu, 17 Mar 2011 00:23:54 +0000
Message-ID: <1300321434.30423.1927.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] check bitbake wrapper/pseudo functionality
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
X-List-Received-Date: Thu, 17 Mar 2011 00:25:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-16 at 17:52 +0000, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> This patch detects basic problems with the bitbake wrapper and pseudo.
> 
> (previously sent to poky@yoctoproject.org, forgot to CC)
> 
> Fixes [YOCTO #653]
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: paule/master-pseudo-sanity
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=paule/master-pseudo-sanity
> 
> Thanks,
>     Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> 
> 
> Paul Eggleton (1):
>   sanity: detect if bitbake wrapper is not being used or pseudo is
>     broken

Merged to master, thanks.

Richard



