Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QzXTL-0006YM-T8 for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 19:24:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82HJBFX027867
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 18:19:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27043-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2011 18:19:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82HJ2f6027861
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 18:19:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1314919495.git.sgw@linux.intel.com>
References: <cover.1314919495.git.sgw@linux.intel.com>
Date: Fri, 02 Sep 2011 18:18:44 +0100
Message-ID: <1314983924.5939.622.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3 v2] O-Hand SVN conversion to GIT
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
X-List-Received-Date: Fri, 02 Sep 2011 17:24:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-01 at 16:31 -0700, Saul Wold wrote:
> Richard,
> 
> I bumped the PV to 0.(n+1)+git* instead of creating a PE entry,
> the other grouping it to ensure they get repackged against the
> version names.
> 
> TZ* update is general updates.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit bf9e9961ec4e7b2d10f25b550b902df62b3939b1:
> 
>   Fix powerpc term and provide more template for different arches (2011-08-31 20:10:14 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Saul Wold (3):
>   o-hand recipes: convert from svn.o-hand.org to git.yoctoproject.org
>   sato recipes: Update PR because of libowl conversion to git
>   tzcode: Update to 2011i

Merged to master, thanks.

Richard



