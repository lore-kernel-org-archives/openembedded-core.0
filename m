Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiPaE-0003zW-Rn for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 13:04:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04BvLmH018189
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 11:57:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17902-03 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 11:57:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04BvCDC018183
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 11:57:12 GMT
Message-ID: <1325678231.3555.130.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 11:57:11 +0000
In-Reply-To: <cover.1325631444.git.nitin.a.kamble@intel.com>
References: <cover.1325631444.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] prelink & vte fixes
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
X-List-Received-Date: Wed, 04 Jan 2012 12:04:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-03 at 14:59 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> The vte commit is redone to avoid adding introspection package in DEPENDS.
> 
> Thanks,
> Nitin
> 
> The following changes since commit 0ff1d667dc23b0cc903c18f1b5e032c2b6630aae:
> 
>   distro: Add poky-tiny distro definition (2012-01-03 21:33:15 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/work
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work
> 
> Nitin A Kamble (2):
>   prelink: also look at nonstandard lib paths
>   vte: upgrade from 0.24.3 to 0.28.2

Merged to master, thanks.

Richard



