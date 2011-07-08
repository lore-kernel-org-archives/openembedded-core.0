Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfDxw-0003Og-1Q for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:31:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GRqJA021808
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:27:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21380-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 17:27:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GRl9Z021802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:27:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310082575.git.paul.eggleton@linux.intel.com>
References: <cover.1310082575.git.paul.eggleton@linux.intel.com>
Date: Fri, 08 Jul 2011 17:27:08 +0100
Message-ID: <1310142428.20015.903.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Update OLDEST_KERNEL v2
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
X-List-Received-Date: Fri, 08 Jul 2011 16:31:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 00:51 +0100, Paul Eggleton wrote:
> Since v1, this now updates the value to 2.6.16 instead of 2.6.0.
> 
> The following changes since commit f1fc6d084b079dea21ff1a30b815496452042490:
> 
>   pulseaudio: add 0.9.23 (2011-07-07 13:44:36 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/oldest-kernel-26
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oldest-kernel-26
> 
> Paul Eggleton (2):
>   bitbake.conf: update OLDEST_KERNEL to 2.6.16
>   eglibc: bump PR for OLDEST_KERNEL change

Merged to master, thanks.

Richard



