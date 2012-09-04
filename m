Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T8scj-0008NS-QF for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 14:52:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84CeY3O016988;
	Tue, 4 Sep 2012 13:40:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15631-09; Tue,  4 Sep 2012 13:40:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84CeROH016981
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 13:40:28 +0100
Message-ID: <1346762426.30964.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Constantin Musca <constantinx.musca@intel.com>
Date: Tue, 04 Sep 2012 13:40:26 +0100
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] Package upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 12:52:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-03 at 18:45 +0300, Constantin Musca wrote:
> This is another set of package upgrades compiled on all architectures and
> tested using core-image-sato.
> The following changes since commit 37c8597e7600385367257e8a513e003947ebef5b:
> 
>   distro-tracking: remove xserver-kdrive (2012-09-02 05:52:16 -0700)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib cmuscax/upgrades
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cmuscax/upgrades
> 
> Constantin Musca (9):
>   automake: upgrade to 1.12.3
>   gypsy: upgrade to 0.9
>   libdrm: upgrade to 2.4.39
>   lsof: upgrade to 4.86
>   man-pages: upgrade to 3.42
>   telepathy-glib: upgrade to 0.19.8
>   freetype: upgrade to 2.4.10
>   puzzles: upgrade to r9594
>   iproute2: upgrade to 3.5.1

Merged to master, thanks.

Richard



