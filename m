Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QS8MQ-0007sU-J8 for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 15:54:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52Dph2I013366
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 14:51:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13073-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 14:51:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52DpZmH013360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 14:51:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1307002336.git.dexuan.cui@intel.com>
References: <cover.1307002336.git.dexuan.cui@intel.com>
Date: Thu, 02 Jun 2011 14:51:15 +0100
Message-ID: <1307022675.27470.542.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Upstream-status --> Upstream-Status and a fix to send-pull-request
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
X-List-Received-Date: Thu, 02 Jun 2011 13:54:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 16:17 +0800, Dexuan Cui wrote:
> Upstream-status --> Upstream-Status:
> As a keyword, it's case sensitive, so let's fix the lowercase s here.
> 
> The fix to send-pull-request:
> I don't know why othes doesn't complain about this, but without this patch,
> the script can't run properly in my side.
> 
> 
> Thanks,
> -- Dexuan
> 
> The following changes since commit 484c4e73245c93a08413cd204513bf5c5698b994:
> 
>   clutter-1.6: Add patch to update gettext macro version (2011-06-01 18:34:37 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dcui/master
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master
> 
> Dexuan Cui (2):
>   recipes: Upstream-status --> Upstream-Status: for multiple patches
>   send-pull-request: fix a small typo that fails the script

Merged to master, thanks.

Richard



