Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RWV3i-0003oX-Le for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 16:29:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB2FN907030959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Dec 2011 15:23:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30424-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2011 15:23:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB2FN2Hl030953
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Dec 2011 15:23:03 GMT
Message-ID: <1322839392.18900.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Dec 2011 15:23:12 +0000
In-Reply-To: <cover.1322812458.git.edwin.zhai@intel.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Packages Upgrade, Dec2, 2011
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
X-List-Received-Date: Fri, 02 Dec 2011 15:29:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-02 at 15:55 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> All,
> These are upgrade for libfm, pcmanfm and x11vnc. Pls. help review and pull.
> 
> The following changes since commit 9d6790c4409dee4d08fe6a47450125c406d0ba32:
> 
>   cooker.py: Allow the -e option to work with virtual classes and -b (2011-12-01 23:14:05 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib gzhai/master2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
> 
> Zhai Edwin (4):
>   libfm: Upgrade to 0.1.17
>   pcmanfm: Upgrade to 0.9.10
>   x11vnc: Upgrade to 0.9.13
>   distro-tracking: Update info after last upgrade

Merged to master, thanks.

Richard



