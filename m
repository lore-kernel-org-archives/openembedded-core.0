Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG609-0004lQ-4b for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:34:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAFAkA027581;
	Mon, 24 Sep 2012 11:15:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27527-02; Mon, 24 Sep 2012 11:15:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAF2oo027565
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 11:15:02 +0100
Message-ID: <1348481702.4654.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 24 Sep 2012 11:15:02 +0100
In-Reply-To: <302d0a0fcb7450756a88775e9ffd01e1f834e67d.1348455913.git.bruce.ashfield@windriver.com>
References: <cover.1348455913.git.bruce.ashfield@windriver.com>
	<302d0a0fcb7450756a88775e9ffd01e1f834e67d.1348455913.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-yocto/3.4: Update fri2 and sys940x to emgd-1.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 10:34:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-09-23 at 23:06 -0400, Bruce Ashfield wrote:
> Bumping the meta SRCREV to pickup a newer emgd for the fri2 and
> sys940x.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    3 ++-
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



