Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SFYeM-0005Be-BT
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 00:25:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 8186E315AD6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2012 00:16:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 6He9wzojkmEw
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2012 00:16:42 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d0147c1.pool.mediaWays.net [77.1.71.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 9EB26315A8C7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2012 00:16:42 +0200 (CEST)
Message-ID: <4F7CC849.5060109@opendreambox.org>
Date: Thu, 05 Apr 2012 00:16:41 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20120403131537.5CE3310218@opal>
	<20120404165943.GE4181@jama.jama.net>
	<4F7C8796.9070705@opendreambox.org>
	<20120404174521.GF4181@jama.jama.net>
	<4F7C8B6A.1000008@opendreambox.org>
	<20120404180615.GG4181@jama.jama.net>
	<20120404182250.GH4181@jama.jama.net>
	<4F7CBA1A.3040506@opendreambox.org>
In-Reply-To: <4F7CBA1A.3040506@opendreambox.org>
Subject: Re: [oe-commits] Andreas Oberritter : gdb: build with expat, add missing RRECOMMENDS_gdbserver
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
X-List-Received-Date: Wed, 04 Apr 2012 22:25:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04.04.2012 23:16, Andreas Oberritter wrote:
> I've built gdb-cross with your patch applied without problems.
> gdb-cross-canadian-mipsel is still compiling. However, since the problem
> you discovered didn't show on my machine, this may not be meaningful at all.

FWIW, gdb-cross-canadian-mipsel also finished without errors.

> Regards,
> Andreas


