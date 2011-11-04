Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RMM2F-0003p7-P7 for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 16:50:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA4Fi8c5021548;
	Fri, 4 Nov 2011 15:44:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18690-02; Fri,  4 Nov 2011 15:44:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA4Fi11r021538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 4 Nov 2011 15:44:03 GMT
Message-ID: <1320421441.20107.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 04 Nov 2011 15:44:01 +0000
In-Reply-To: <1320312113-2492-1-git-send-email-koen@dominion.thruhere.net>
References: <1320312113-2492-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] rt-tests: update to 0.83
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
X-List-Received-Date: Fri, 04 Nov 2011 15:50:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-03 at 10:21 +0100, Koen Kooi wrote:
> Fetch from github, kernel.org uri is gone
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../{rt-tests_0.73.bb => rt-tests_0.83.bb}         |   16 ++++++++++------
>  1 files changed, 10 insertions(+), 6 deletions(-)
>  rename meta/recipes-rt/rt-tests/{rt-tests_0.73.bb => rt-tests_0.83.bb} (68%)

Merged to master, thanks.

Richard



