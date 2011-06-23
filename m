Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZsi5-0007iF-OU for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 00:49:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NMjgJo024128
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 23:45:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23839-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 23:45:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NMjW0m024122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 23:45:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=vPH3A6oO_OuT84nKorWiF2=N2Bg@mail.gmail.com>
References: <BANLkTi=vPH3A6oO_OuT84nKorWiF2=N2Bg@mail.gmail.com>
Date: Thu, 23 Jun 2011 23:45:30 +0100
Message-ID: <1308869130.20015.145.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] More LICENSE cleanup and additional common-licenses
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
X-List-Received-Date: Thu, 23 Jun 2011 22:49:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-15 at 14:01 -0700, Flanagan, Elizabeth wrote:
> I've added some more licenses from the SPDX project as well as
> corrected some text.
> GCC's LICENSE field was problematic and I've corrected it to the
> actual GPL exception
> license text. I've also cleaned up gdb's LICENSE field.
> 
> The following changes since commit e1f6ebba3ab2fc8a469c1d96fc6d4c4b8f16845c:
> 
>   meta-yocto: use FILESEXTRAPATHS_prepend := in all bbappends
> (2011-06-15 11:49:42 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib eflanagan/license_corrections
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_corrections
> 
> Beth Flanagan (1):
>   common-licenses: Additions and corrections

Merged to master, thanks.

Richard



