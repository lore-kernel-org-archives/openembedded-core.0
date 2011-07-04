Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QdhfJ-000694-Hn for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 13:50:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64BkQE2017069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jul 2011 12:46:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17016-02 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2011 12:46:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64BkIZs017063
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jul 2011 12:46:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
Date: Mon, 04 Jul 2011 12:45:50 +0100
Message-ID: <1309779950.20015.665.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] upgrade recipes
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
X-List-Received-Date: Mon, 04 Jul 2011 11:50:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-07-03 at 21:03 +0800, Yu Ke wrote:
> upgrade the recipe libidn, libdrm, xauth, sqlite, also update the manual check
> field in distro_tracking_field
> 
> The following changes since commit ad2363278f0ea86fcf3464f8f6073d3a3d06be63:
>   Khem Raj (1):
>         uclibc: Fix compilation in thumb mode
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib kyu3/upgrade-0701
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/upgrade-0701
> 
> Yu Ke (5):
>   libidn: upgrade from 1.20 to 1.22
>   libdrm: upgrade to 2.4.26
>   xauth: upgrade from 1.05 to 1.06
>   sqlite: upgrade from 3.7.6.2 to 3.7.7.1
>   distro_tracking_field: update the manually check field

Merged to master, thanks.

Richard



