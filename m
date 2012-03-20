Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S9vYR-0000FX-KP for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 10:40:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2K9VhPk007990
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 09:31:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07784-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 09:31:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2K9VZei007984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 09:31:36 GMT
Message-ID: <1332235896.9740.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 20 Mar 2012 09:31:36 +0000
In-Reply-To: <8900db51c6d31c8e968d4a582c9098e028bf85d2.1332210868.git.lianhao.lu@intel.com>
References: <cover.1332210868.git.lianhao.lu@intel.com>
	<8900db51c6d31c8e968d4a582c9098e028bf85d2.1332210868.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 1/1] sysvinit-inittab: Fixed license warning.
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
X-List-Received-Date: Tue, 20 Mar 2012 09:40:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-20 at 10:36 +0800, Lianhao Lu wrote:
> WARNING: .../sysvinit-inittab-2.88dsf-r6/sysvinit-2.88dsf/COPYING could
> not be copied for some reason. It may not exist. WARN for now.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  .../recipes-core/sysvinit/sysvinit-inittab/COPYING |  339 --------------------
>  .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    9 +-
>  2 files changed, 2 insertions(+), 346 deletions(-)
>  delete mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab/COPYING

Merged to master, thanks.

Richard



