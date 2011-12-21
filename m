Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdPvA-0008Fu-Sk for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 18:25:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLHIMEk011755
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:18:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11590-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:18:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLHIC7Z011719
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:18:13 GMT
Message-ID: <1324487894.19860.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 17:18:14 +0000
In-Reply-To: <cover.1323991540.git.josh@linux.intel.com>
References: <cover.1323991540.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/10] Various license clarifications
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
X-List-Received-Date: Wed, 21 Dec 2011 17:25:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-15 at 15:30 -0800, Joshua Lock wrote:
> A few metadata massages to ensure LICENSE fields specify the correct license
> version.
> 
> The following changes since commit 0eb139619301d0efee330932eba3617dcb39284e:
> 
>   Patch Upstream Status Updates (2011-12-15 14:35:27 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/updates
> 
> Joshua Lock (10):
>   gypsy: fix LICENSE field
>   udev: fix LICENSE fields to be SPDX compliant
>   apt: clarify LICENSE as GPL-2.0
>   dpkg: clarify LICENSE as GPL-2.0
>   clutter: clarify LICENSE as LGPL-2.1
>   cogl: clarify LICENSE as LGPL-2.1 and fix metadata
>   matchbox-wm: clarify LICENSE as GPL-2.0
>   pango: clarify LICENSE is LGPL-2.0+
>   matchbox-desktop: clarify LICENSE is GPL-2.0+
>   matchbox-session-sato: clarify LICENSE in GPL-2.0

Merged to master, thanks.

Richard



