Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ShfIY-0007hj-5m for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 13:11:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LB0rdo021707
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:00:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21206-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:00:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LB0io9021701
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:00:45 +0100
Message-ID: <1340276445.1640.92.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 12:00:45 +0100
In-Reply-To: <cover.1340233133.git.scott.a.garman@intel.com>
References: <cover.1340233133.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] denzil pull request 4
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
X-List-Received-Date: Thu, 21 Jun 2012 11:11:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-20 at 16:05 -0700, Scott Garman wrote:
> Anders Darander (1):
>   qt4-embedded: fix QT_ARCH usage in QT_CONFIG_FLAGS
> 
> Bruce Ashfield (5):
>   linux-yocto/3.2: configuration and pch merge
>   linux-yocto: intel BSP config changes
>   linux-yocto: policy cleanups
>   linux-yocto/3.2: update to v3.2.18
>   linux-yocto/3.0: update to v3.0.32
> 
>  meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    6 +++---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    8 ++++----
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    6 +++---
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   16 ++++++++--------
>  meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   18 +++++++++---------
>  meta/recipes-qt/qt4/qt4-embedded.inc              |    2 +-
>  6 files changed, 28 insertions(+), 28 deletions(-)

Merged to denzil, thanks.

Richard




