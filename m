Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QKB0V-0003Qt-4u for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 17:07:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BF4ahS020859
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:04:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20413-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:04:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BF4UCk020853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 16:04:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1305109178.git.leon@sidebranch.com>
References: <cover.1305109178.git.leon@sidebranch.com>
Date: Wed, 11 May 2011 16:04:25 +0100
Message-ID: <1305126265.30391.369.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Re-add powerpc-linux-gnuspe support.
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
X-List-Received-Date: Wed, 11 May 2011 15:07:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-11 at 12:29 +0200, Leon Woestenberg wrote:
> From: Leon Woestenberg <leon@sidebranch.com>
> 
> (Re-)add powerpc-linux-gnuspe support, as from OpenEmbedded.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: likewise/gnuspe
>   Browse: http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=likewise/gnuspe
> 
> Thanks,
>     Leon Woestenberg <leon@sidebranch.com>
> ---
> 
> 
> Leon Woestenberg (1):
>   siteinfo.bbclass: Add powerpc-linux-gnuspe.

Merged to master but I had to sync this up against the recent distro
config files re-org.

Cheers,

Richard



