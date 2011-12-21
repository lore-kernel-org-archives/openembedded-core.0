Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdPu7-00088X-6o for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 18:24:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLHHSYJ011693
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:17:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11590-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:17:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLHHKrG011687
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:17:21 GMT
Message-ID: <1324487843.19860.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 17:17:23 +0000
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/8] Fix old o-hand.com references
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
X-List-Received-Date: Wed, 21 Dec 2011 17:24:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-19 at 15:43 +0000, Paul Eggleton wrote:
> Most of the old o-hand.com sites are no longer available, so fix up
> SRC_URIs that reference them.
> 
> The following changes since commit ae4118a1f78f113c3d687c3aa6a86007cf977cae:
> 
>   libsdl 1.2.14: fix packaging (2011-12-19 12:17:36 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/o-hand
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/o-hand
> 
> Paul Eggleton (8):
>   xrestop: fix SRC_URI and LICENSE
>   matchbox-desktop: fix SRC_URI
>   matchbox-themes-extra: fix SRC_URI
>   libmatchbox: fix SRC_URI
>   libxsettings-client: fix SRC_URI
>   mtools: fix SRC_URI for GPLv2 version
>   libsync: move to git.yoctoproject.org
>   eds-dbus: replace o-hand example contact

Merged to master, thanks.

Richard



