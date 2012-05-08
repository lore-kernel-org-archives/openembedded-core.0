Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRmMd-0007Fw-9P for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 17:30:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48FKI6j004332
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 16:20:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03358-10 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 16:20:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48FK9rJ004326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 16:20:10 +0100
Message-ID: <1336490414.30349.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 May 2012 16:20:14 +0100
In-Reply-To: <cover.1336430865.git.scott.a.garman@intel.com>
References: <cover.1336430865.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] opensp and openssh recipe upgrades
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
X-List-Received-Date: Tue, 08 May 2012 15:30:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-07 at 15:49 -0700, Scott Garman wrote:
> Hello,
> 
> This pull request includes upgrades for the opensp and openssh recipes.
> They have been build-tested on all 5 of our QEMU architectures. The
> distro tracking updates include a couple of recipes that I missed in
> previous pull requests.
> 
> Scott
> 
> The following changes since commit 2929e7d590862d9649458c90804e79a1dce40423:
> 
>   glib-2.0: Fix issues with libelf dependency creeping in (2012-05-07 10:53:24 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades-oe
> 
> Scott Garman (3):
>   openssh: upgrade to 6.0p1
>   opensp: upgrade to 1.5.2
>   distro_tracking: updates for upgraded recipes

Merged to master, thanks.

Richard



