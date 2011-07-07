Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QelgK-00049R-29 for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 12:19:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67AFn7x026818
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 11:15:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26785-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2011 11:15:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67AFgtl026812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 11:15:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309928392.git.lei.mei@intel.com>
References: <cover.1309928392.git.lei.mei@intel.com>
Date: Thu, 07 Jul 2011 11:15:07 +0100
Message-ID: <1310033707.20015.814.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3]upgrade recipes
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
X-List-Received-Date: Thu, 07 Jul 2011 10:19:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-06 at 13:20 +0800, Mei Lei wrote:
> Upgrade recipe gupnp and gawk, also update the distro_tracking_fields.inc.
> 
> The following changes since commit c6dac094ac79f6eae6998527e025417e16b46eed:
>   Yu Ke (1):
>         xauth: upgrade from 1.05 to 1.06
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib lmei3/upgrade-0704
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/upgrade-0704
> 
> Mei Lei (3):
>   gupnp: Upgrade from 0.16.0 to 0.16.1
>   gawk: Upgrade from 3.1.8 to 4.0.0
>   distro_tracking_fields.inc: Update recipes upgrade and manual check
>     information

Merged to master, thanks.

Richard



