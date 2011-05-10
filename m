Received: from mail.fim.uni-passau.de ([132.231.1.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leitl@fim.uni-passau.de>) id 1QJvmx-00051e-HT
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 00:52:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.fim.uni-passau.de (Postfix) with ESMTP id A830792239;
	Wed, 11 May 2011 00:49:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.fim.uni-passau.de
Received: from mail.fim.uni-passau.de ([127.0.0.1])
	by localhost (mail.fim.uni-passau.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id E-Up4gfePWRW; Wed, 11 May 2011 00:49:39 +0200 (CEST)
Received: from darkx.localnet (p5DC751CD.dip.t-dialin.net [93.199.81.205])
	by mail.fim.uni-passau.de (Postfix) with ESMTPSA id 6E61292236;
	Wed, 11 May 2011 00:49:39 +0200 (CEST)
From: Franz Leitl <leitl@fim.uni-passau.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2011 00:50:04 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38.4-23-default; KDE/4.6.1; x86_64; ; )
References: <201105090016.46391.leitl@fim.uni-passau.de>
	<201105100356.05227.leitl@fim.uni-passau.de>
	<4DC99EB1.1090506@linux.intel.com>
In-Reply-To: <4DC99EB1.1090506@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201105110050.04234.leitl@fim.uni-passau.de>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: Patch for fixing build issues with external kernel modules.
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
X-List-Received-Date: Tue, 10 May 2011 22:52:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Darren,

Am Dienstag 10 Mai 2011, 22:23:13 schrieben Sie:
> Hi Franz, I'm not ignoring you, I'm laid up in bed with a nasty stomach
> flu and not thinking very clearly right now. I'll try and responds as
> soon as I can...
No need to rush. I can wait. I used the workaround from Koen Kooi for getting 
the bounds.h in the meantime and changed the Makefile to use KERNEL_SRC. Just 
cannot test anything as I pulled the latest stuff from openembedded-core and 
something is broken now. I'm also busy with other things, so it's not too 
important to me.


Regards,
Franz


