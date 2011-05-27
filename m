Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPz9F-0000j8-DB for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 17:40:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RFbFoJ003704;
	Fri, 27 May 2011 16:37:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03111-09; Fri, 27 May 2011 16:37:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RFb8rH003696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 May 2011 16:37:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
In-Reply-To: <4DDFBF83.40805@linux.intel.com>
References: <cover.1306444161.git.dvhart@linux.intel.com>
	<e5f5d48165bcb5dc3ccf160a29e16ca700f85395.1306444161.git.dvhart@linux.intel.com>
	<1306452282.27470.214.camel@rex>  <4DDF1DDD.30001@linux.intel.com>
	<1306485644.27470.247.camel@rex>  <4DDFAD9E.7080902@linux.intel.com>
	<1306507609.27470.272.camel@rex> <1306507721.27470.273.camel@rex>
	<4DDFBF83.40805@linux.intel.com>
Date: Fri, 27 May 2011 16:37:02 +0100
Message-ID: <1306510622.27470.275.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Fri, 27 May 2011 15:40:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 08:13 -0700, Darren Hart wrote:
> OK, I haven't completely lost it then :-) In that case, are you looking
> for any additional changes/dialog/acks here? If not, the version with
> bb.debug() is now in the contrib branch:
> 
>   git://git.pokylinux.org/poky-contrib dvhart/oe/u-boot
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/oe/u-boot
> 
> I can resend as V3 if more discussion is desirable.

No, we're good.

Both patches merged to master.

Cheers,

Richard




