Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbvRM-0005Ci-Gg for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:08:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TE4l3c004863
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:04:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04497-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:04:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TE4fT1004857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 15:04:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309352791.git.dexuan.cui@intel.com>
References: <cover.1309352791.git.dexuan.cui@intel.com>
Date: Wed, 29 Jun 2011 15:04:24 +0100
Message-ID: <1309356264.20015.391.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] fix to bug #1099, updates to Upstream-Status and distro_tracking_fields.inc
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
X-List-Received-Date: Wed, 29 Jun 2011 14:08:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 21:09 +0800, Dexuan Cui wrote:
> The following changes since commit a4f3e006e1f2fd93f156012af2a05adccf41d065:
> 
>   u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:19 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dcui/master
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master
> 
> Dexuan Cui (3):
>   grub: add -fno-reorder-functions into STAGE2_COMPILE
>   lttng-ust: change the patch's Upstream-Status to Accepted.
>   distro_tracking_fields.inc: update RECIPE_MANUAL_CHECK_DATE for
>     screen and tcf-agent

Merged to master, thanks.

Richard



