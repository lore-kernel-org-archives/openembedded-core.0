Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QU311-0002EV-LL for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 22:36:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p57KXQn7023232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jun 2011 21:33:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23045-05 for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2011 21:33:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p57KXJVp023225
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jun 2011 21:33:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Date: Tue, 07 Jun 2011 21:33:15 +0100
Message-ID: <1307478795.15712.58.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/13] 06-June-2011
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
X-List-Received-Date: Tue, 07 Jun 2011 20:36:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-07 at 00:01 -0700, Saul Wold wrote:
> Updates for the kernel and lots of distro tracking updates for
> manual based updates checking.
> 
> Sau!
> 
> 
> The following changes since commit 925de3b3e74d15547840a2edaceff437e135bddd:
> 
>   tzcode: Update to 2011g (2011-06-06 15:52:18 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (2):
>   linux-yocto: update target/meta SRCREVs
>   linux-yocto: make e1000e structure common [commit: bec3f1e8c]
> 
> Koen Kooi (1):
>   util-linux: package agetty seperately
> 
> Phil Blundell (1):
>   sqlite: remove dependency on tcl-native
> 
> Saul Wold (4):
>   json-glib: Update to 0.12.4
>   distro tracking: update Qing -> Saul
>   distro tracking: fixup some bad entries
>   distro tracking: Manual Updates
> 
> Scott Garman (5):
>   distro-tracking: updates
>   openssh: upgrade to v5.8p2
>   grep: upgrade to v2.8
>   tar: upgrade to v1.26
>   distro-tracking: update openssh, tar, and grep

Merged to master, thanks.

Richard



