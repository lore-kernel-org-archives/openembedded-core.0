Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzJ15-0003Qs-DP for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 02:25:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2F1Nv9P011159;
	Tue, 15 Mar 2011 01:23:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10827-07; Tue, 15 Mar 2011 01:23:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2F1NqAn011153
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 15 Mar 2011 01:23:52 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1299940883.git.raj.khem@gmail.com>
References: <cover.1299940883.git.raj.khem@gmail.com>
Date: Tue, 15 Mar 2011 01:23:45 +0000
Message-ID: <1300152225.30423.958.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: Re: [PATCH 0/1] Import own-mirrors class from OE
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
X-List-Received-Date: Tue, 15 Mar 2011 01:25:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-03-12 at 07:04 -0800, Khem Raj wrote:
> Hi Richard
> 
> 
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib.git
>   Branch: kraj/own-mirror
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/own-mirror
> 
> Thanks,
>     Khem Raj <raj.khem@gmail.com>
> ---
> 
> 
> Khem Raj (1):
>   own-mirrors.bbclass: Bring own-mirrors.bbclass from oe commit
>     0ef914b250df46a41348479446214575668943fb
> 
>  meta/classes/own-mirrors.bbclass |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 meta/classes/own-mirrors.bbclass

Merged into OECore master, thanks.

(and the git tree commits really do help me, thanks)

Cheers,

Richard




