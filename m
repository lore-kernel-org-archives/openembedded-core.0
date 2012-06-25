Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SjBol-0006YJ-SG for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 18:07:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5PFuKFx028637
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 16:56:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26026-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 16:56:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5PFuDuj028631
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 16:56:14 +0100
Message-ID: <1340639776.23146.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jun 2012 16:56:16 +0100
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/14] Package Updating
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
X-List-Received-Date: Mon, 25 Jun 2012 16:07:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-06-24 at 11:03 -0700, Saul Wold wrote:
> Richard,
> 
> Here is a patch of updates.
> 
> Sau!
> 
> The following changes since commit e2cc4a44d510e0d473d15f207c1c886db6a5ccf7:
> 
>   [PATCH] guile: fix compilation on MIPS/PPC (2012-06-21 13:41:12 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates
> 
> Saul Wold (14):
>   sqlite3: Update to 3.7.13
>   psmisc: Update to 22.19
>   sysstat: Update to 10.0.5
>   util-linux: Update to 2.21.2
>   libxml2: Update to 2.8.0
>   mx: Upgrade to 1.4.6
>   libxml-simple-perl: Upgrade to 2.20
>   cracklib: Upgrade to 2.8.19
>   resolvconf: Upgrade to 1.67
>   libtasn1: Upgrade to 2.13
>   gnutls: Upgrade to 2.12.20
>   foomatic-filters: Upgrade to 4.0.16
>   libidn: Upgrade to 1.25
>   libtiff: Upgrade to 4.0.2

I merged to master apart from mx which I had some questions about. We've
subsequently resolved those so I'll take it next time around.

Cheers,

Richard



