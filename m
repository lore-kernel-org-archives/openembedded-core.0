Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJMiX-0005eV-TQ for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 13:02:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93AnGHU026628;
	Wed, 3 Oct 2012 11:49:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26503-01; Wed,  3 Oct 2012 11:49:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93An7Yo026621
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 3 Oct 2012 11:49:08 +0100
Message-ID: <1349261350.18301.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Wed, 03 Oct 2012 11:49:10 +0100
In-Reply-To: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Merging AArch64 support
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
X-List-Received-Date: Wed, 03 Oct 2012 11:02:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 11:51 +0200, Marcin Juszkiewicz wrote:
> Hello guys
> 
> Now, when AArch64 is buildable from public sources it came a time to
> work on merging all changes I had to do to get it working with current
> OE-Core.
> 
> All changes are available in:
> 
> git://git.openembedded.org/openembedded-core-contrib hrw/aarch64-support
> 
> Those are first versions of patches so if anything has to be changed
> feel free to tell. Probably descriptions needs to be updated etc but I
> would like to see some kind of review as it was long time since last
> time I did OE merging stuff.

The five you've sent look straightforward to me and ok...

Cheers,

Richard



