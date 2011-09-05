Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0eol-00024N-9P for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 21:26:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JLnwx000943
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:21:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00906-01 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 20:21:45 +0100 (BST)
Received: from [192.168.1.40] (dynamic10.rpnet.com [192.168.1.40])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JLgP0000937
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:21:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1315186871.git.xiaofeng.yan@windriver.com>
References: <cover.1315186871.git.xiaofeng.yan@windriver.com>
Date: Mon, 05 Sep 2011 20:21:42 +0100
Message-ID: <1315250502.1243.6.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1]:qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Mon, 05 Sep 2011 19:26:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-05 at 09:47 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> "/bin/sh" is needed by qt4e-demo-image. I add "busybox" to this image.
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: xiaofeng/qt4e-demo-image
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/qt4e-demo-image
> 
> Thanks,
>     Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> 
> 
> Xiaofeng Yan (1):
>   qt4e-demo-image:Fix bug 999

Merged to master, thanks.

In the future can you make the short description as show in the line
above a little more informative though please as not many people know
what bug 999 is...

Cheers,

Richard



