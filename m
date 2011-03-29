Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q4ZEg-0001D2-3P for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 15:45:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2TDhUbC020664;
	Tue, 29 Mar 2011 14:43:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20262-08; Tue, 29 Mar 2011 14:43:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2TDhMnO020658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Mar 2011 14:43:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Lock <josh@linux.intel.com>
In-Reply-To: <cover.1301354978.git.josh@linux.intel.com>
References: <cover.1301354978.git.josh@linux.intel.com>
Date: Tue, 29 Mar 2011 14:43:16 +0100
Message-ID: <1301406196.24596.28.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 0/4] Recipes for Clutter 1.6 v2
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
X-List-Received-Date: Tue, 29 Mar 2011 13:45:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-29 at 00:31 +0100, Joshua Lock wrote:
> From: Joshua Lock <josh@linux.intel.com>
> 
> v2 of a series series of patches adds recipes for Clutter 1.6 and versions of
> clutter-box2d and clutter-gst which build against it.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: josh/clutter
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter
> 
> Thanks,
>     Joshua Lock <josh@linux.intel.com>
> ---
> 
> 
> Joshua Lock (4):
>   clutter: add 1.6.8
>   clutter-gst: add 1.3.6 for use with clutter 1.6
>   clutter-box2d: add version 0.10.0 for use with clutter 1.6
>   clutter-gtk: remove duplicate gtk+ DEPENDS entry

Merged to master, thanks!

Richard



