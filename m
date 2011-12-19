Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RccFe-00063n-D8 for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 13:23:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBJCGJ8H013607
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:16:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08999-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:16:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBJCG8qZ013601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:16:10 GMT
Message-ID: <1324296969.4568.162.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2011 12:16:09 +0000
In-Reply-To: <cover.1324251354.git.scott.a.garman@intel.com>
References: <cover.1324251354.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] mktemp: mark patch as upstreamed
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
X-List-Received-Date: Mon, 19 Dec 2011 12:23:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-12-18 at 15:37 -0800, Scott Garman wrote:
> Hello,
> 
> I submitted a parallel make patch upstream to the mktemp maintainer,
> who has accepted it. This just updates our patch's Upstream-Status
> field accordingly.
> 
> Scot
> 
> 
> The following changes since commit 3e05acab1c119a3b2a4703ea8729cc768935d36e:
> 
>   license.bbclass: remove bashism (2011-12-16 16:50:39 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib sgarman/upstreamed
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/upstreamed
> 
> Scott Garman (1):
>   mktemp: mark patch as upstreamed

Merged to master, thanks.

Richard



