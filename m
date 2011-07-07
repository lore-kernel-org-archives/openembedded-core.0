Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QenuI-0002da-BG for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 14:42:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67CcNEY027866
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 13:38:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27332-10 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2011 13:38:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67CcCL9027860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 13:38:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310027619.git.dexuan.cui@intel.com>
References: <cover.1310027619.git.dexuan.cui@intel.com>
Date: Thu, 07 Jul 2011 13:37:36 +0100
Message-ID: <1310042256.20015.824.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] the fix to bug 1208
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
X-List-Received-Date: Thu, 07 Jul 2011 12:42:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 16:39 +0800, Dexuan Cui wrote:
> The following changes since commit ad2363278f0ea86fcf3464f8f6073d3a3d06be63:
> 
>   uclibc: Fix compilation in thumb mode (2011-07-02 00:02:24 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dcui/distro
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/distro
> 
> Dexuan Cui (1):
>   powertop: inherit update-alternatives and use a higher priority than
>     busybox

Merged to master, thanks.

Richard



