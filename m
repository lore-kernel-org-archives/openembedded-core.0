Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QOWZW-0005bY-R1 for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 16:57:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4NEsVRk019733
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 15:54:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18423-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 15:54:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4NEsMvD019715
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 15:54:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1306105366.git.raj.khem@gmail.com>
References: <cover.1306105366.git.raj.khem@gmail.com>
Date: Mon, 23 May 2011 15:54:20 +0100
Message-ID: <1306162460.3424.857.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Upgrade uclibc to 0.9.32rc3
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
X-List-Received-Date: Mon, 23 May 2011 14:57:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-22 at 16:04 -0700, Khem Raj wrote:
> This has been in meta-openembedded layer for a while
> with this its moving into oe-core
> 
> The following changes since commit a0c3fd1eb23ef22932b938fc124bb17225eb85c4:
> 
>   uclibc: Upgrade to 0.9.32-rc3 (2011-05-22 12:02:12 -0700)
> 
> are available in the git repository at:
>   git@git.openembedded.org:openembedded-core-contrib.git kraj/uclibc
>   http://cgit.openembedded.org/cgit.cgi//log/?h=kraj/uclibc
> 
> Khem Raj (1):
>   uclibc: Upgrade to 0.9.32-rc3

I merged this on the grounds that it can only improve the current
situation. I'd like to see if we can't clean that recipe up more at some
point though.

Cheers,

Richard



