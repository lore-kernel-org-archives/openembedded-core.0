Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHcmK-0006PZ-UU for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 16:10:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p44E7YB6032077
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 May 2011 15:07:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31885-03 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2011 15:07:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p44E7NvS032071
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 May 2011 15:07:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1304515719.git.ke.yu@intel.com>
References: <cover.1304515719.git.ke.yu@intel.com>
Date: Wed, 04 May 2011 15:07:22 +0100
Message-ID: <1304518043.21461.154.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] poky-default-revisions: move SRCREV to every recipe
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
X-List-Received-Date: Wed, 04 May 2011 14:10:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-04 at 22:05 +0800, Yu Ke wrote:
> From: Yu Ke <ke.yu@intel.com>
> 
> move the SRCREV from poky-default-revisions.inc to its corresponding recipe,
> in this case, those non poky distro can also use its SRCREV.
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: kyu3/srcrev-recipe
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/srcrev-recipe
> 
> Thanks,
>     Yu Ke <ke.yu@intel.com>
> ---
> 
> 
> Yu Ke (1):
>   poky-default-revisions: move the SRCREV to recipe file

Merged to master, thanks for resolving this issue! :)

Cheers,

Richard



