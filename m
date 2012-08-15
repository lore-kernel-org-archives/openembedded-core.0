Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T1diI-0006He-Oo for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 15:32:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDKoRO001453
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:20:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00424-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:20:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDKgsQ001447
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:20:43 +0100
Message-ID: <1345036841.538.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 14:20:41 +0100
In-Reply-To: <ac850f471d351c0f865251c6217447453676bea3.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
	<ac850f471d351c0f865251c6217447453676bea3.1344946189.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED REQUEST 36/64] dbus: provide/replace dbus-x11 only for target
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
X-List-Received-Date: Wed, 15 Aug 2012 13:32:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-14 at 15:13 +0300, Saul Wold wrote:
> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/dbus/dbus.inc |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)

This was superseded by
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=0125438b853348e8a0869e17848173c9d8d51c5d

Cheers,

Richard



