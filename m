Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qlj0w-00066Q-JZ for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 16:53:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QEnS9Z022368;
	Tue, 26 Jul 2011 15:49:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22091-06; Tue, 26 Jul 2011 15:49:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QEnN7J022362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 26 Jul 2011 15:49:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <2aed395afe3732615610806e513d991aeef6f9d5.1311664242.git.ke.yu@intel.com>
References: <cover.1311664242.git.ke.yu@intel.com>
	<2aed395afe3732615610806e513d991aeef6f9d5.1311664242.git.ke.yu@intel.com>
Date: Tue, 26 Jul 2011 15:49:15 +0100
Message-ID: <1311691755.2344.258.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] upstream status: add for libsdl and xserver patches
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
X-List-Received-Date: Tue, 26 Jul 2011 14:53:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 15:12 +0800, Yu Ke wrote:
> Signed-off-by: Yu Ke <ke.yu@intel.com>
> ---
>  .../libsdl/files/directfb_obsolete_calls.patch     |    2 ++
>  .../recipes-graphics/libsdl/files/extra-keys.patch |    2 ++
>  .../libsdl/files/kernel-asm-page.patch             |    2 ++
>  meta/recipes-graphics/mesa/mesa-dri/uclibc.patch   |    2 ++
>  .../xorg-xserver/files/macro_tweak.patch           |    2 ++
>  .../xserver-kdrive/fbdev_xrandr_ioctl.patch        |    2 ++
>  6 files changed, 12 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



