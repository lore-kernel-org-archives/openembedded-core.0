Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzqfW-0008P3-U0 for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 14:21:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GDJxGZ002591
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:19:59 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02279-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:19:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2GDJrEB002585
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 13:19:53 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1300247367.git.raj.khem@gmail.com>
References: <cover.1300247367.git.raj.khem@gmail.com>
Date: Wed, 16 Mar 2011 13:19:43 +0000
Message-ID: <1300281583.30423.1867.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH, v2 0/1] Grok git config sendmail.to if available
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
X-List-Received-Date: Wed, 16 Mar 2011 13:21:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-15 at 20:53 -0700, Khem Raj wrote:
> includes Darren's review comments
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: kraj/scripts
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/scripts
> 
> Thanks,
>     Khem Raj <raj.khem@gmail.com>
> ---
> 
> 
> Khem Raj (1):
>   send-pull-request: Fetch TO email address from git config if
>     specified
> 
>  scripts/send-pull-request |   21 +++++++++++++++------
>  1 files changed, 15 insertions(+), 6 deletions(-)

Merged to master, thanks.

Richard




