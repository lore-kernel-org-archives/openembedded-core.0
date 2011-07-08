Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfCyM-0001YQ-R2 for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:28:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FOB1p021245
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:24:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20817-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 16:24:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FO5Pc021239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:24:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310070283.git.nitin.a.kamble@intel.com>
References: <cover.1310070283.git.nitin.a.kamble@intel.com>
Date: Fri, 08 Jul 2011 16:23:25 +0100
Message-ID: <1310138606.20015.876.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/7] upgrades & misc fixes
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
X-List-Received-Date: Fri, 08 Jul 2011 15:28:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 13:25 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> The following changes since commit 2c79c9eb7ef8ef0aef8c3096c3c4387e28e56ea2:
> 
>   pulseaudio: add 0.9.23 (2011-07-07 13:45:32 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/misc
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
> 
> Nitin A Kamble (7):
>   binutils: upgrade from 2.21 to 2.21.1
>   gmp: upgrade from 5.0.1 to 5.0.2
>   distro tracking: update devel.toolchain recipes's fields
>   gcc-runtime: fix installed but unpackaged files
>   elfutils: fix compilations issue with the gcc 4.7

I merged the above, thanks.

>  eglibc: fix installed but not packaged files
>  binutils: package unpackaged files

and for these I've followed up with replies against the patches.

Cheers,

Richard



