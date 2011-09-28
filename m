Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8vaQ-0007VL-J9 for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 16:58:15 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SEx436010865; Wed, 28 Sep 2011 15:59:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PjxlwaJclJar; Wed, 28 Sep 2011 15:59:04 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SEwvbc010856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 28 Sep 2011 15:58:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 28 Sep 2011 15:52:32 +0100
In-Reply-To: <4E82DF1F.4040809@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<4E82DF1F.4040809@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317221559.12332.10.camel@ted>
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] kernel.bbclass: blacklist 'perf-dbg' as well for the modules metapackage
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
X-List-Received-Date: Wed, 28 Sep 2011 14:58:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 12:47 +0400, Dmitry Eremin-Solenikov wrote:
> Sorry to bother all of you, what about this patchset?

I was waiting for Bruce to review them.

I've taken three of them, the forth needs a better patch description as
per Bruce's request.

The MACHINE_PR one I have reservations about and I'll reply to that
thread.

Cheers,

Richard



