Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcQYq-0004Wa-Lb for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:22:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UNITTq003487;
	Fri, 1 Jul 2011 00:18:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00360-04; Fri,  1 Jul 2011 00:18:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UNILCW003464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jul 2011 00:18:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309380310.git.dvhart@linux.intel.com>
References: <cover.1309380310.git.dvhart@linux.intel.com>
Date: Fri, 01 Jul 2011 00:18:01 +0100
Message-ID: <1309475881.20015.497.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/1] kernel: move menuconfig task after configure
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
X-List-Received-Date: Thu, 30 Jun 2011 23:22:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 13:46 -0700, Darren Hart wrote:
> The following changes since commit e0fc42b51a8209dac1163ae8126f8c687b6bfddf:
> 
>   distro_tracking_fields.inc: update RECIPE_MANUAL_CHECK_DATE for screen and tcf-agent (2011-06-29 15:04:59 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dvhart/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/kernel
> 
> Darren Hart (1):
>   kernel: move menuconfig task after configure

Merged to master, thanks.

Richard



