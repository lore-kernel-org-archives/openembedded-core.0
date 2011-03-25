Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q37Ae-000834-IH for openembedded-core@lists.openembedded.org;
	Fri, 25 Mar 2011 14:35:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2PDXRM5019210
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 13:33:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18582-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 13:33:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2PDXMdI019202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 13:33:22 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5cf658d4af50f5478a7ef852640933844f3292e7.1300387701.git.raj.khem@gmail.com>
References: <cover.1300387701.git.raj.khem@gmail.com>
	<5cf658d4af50f5478a7ef852640933844f3292e7.1300387701.git.raj.khem@gmail.com>
Date: Fri, 25 Mar 2011 13:33:15 +0000
Message-ID: <1301059995.3018.126.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/5] qemu: Upgrade 0.13.0 -> 0.14.0
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
X-List-Received-Date: Fri, 25 Mar 2011 13:35:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 11:52 -0700, Khem Raj wrote:
> * ppc-hack patch is dropped.
> 
> * Other patches which were direct backports
>   or has been merged upstream in 0.14.0 are
>   also dropped
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I've merged this patch, thanks.

Richard



