Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkDTR-0005d8-27 for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 13:00:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MAuhLg027652;
	Fri, 22 Jul 2011 11:56:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27636-01; Fri, 22 Jul 2011 11:56:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MAuYBG027646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 22 Jul 2011 11:56:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311329679-2872-1-git-send-email-koen@dominion.thruhere.net>
References: <1311329679-2872-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 22 Jul 2011 11:56:31 +0100
Message-ID: <1311332191.2344.133.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] consolekit 0.4.5: fix PAM installation dir
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
X-List-Received-Date: Fri, 22 Jul 2011 11:00:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-22 at 12:14 +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../recipes-support/consolekit/consolekit_0.4.5.bb |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)

Merged to master, thanks.

Richard



