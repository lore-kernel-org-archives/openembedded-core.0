Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWmZa-0008J0-PZ for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 11:39:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5F9aE9E024934
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 10:36:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24718-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 10:36:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5F9a8JG024928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 10:36:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308122189.git.dexuan.cui@intel.com>
References: <cover.1308122189.git.dexuan.cui@intel.com>
Date: Wed, 15 Jun 2011 10:36:07 +0100
Message-ID: <1308130567.15712.370.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] fix the mesa-dri build failure after upgrading to newer glproto and dri2proto
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
X-List-Received-Date: Wed, 15 Jun 2011 09:39:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-15 at 15:19 +0800, Dexuan Cui wrote:
> Please review them.
> 
> The following changes since commit 6719d1e245234767bb5409c30dd34388ab935550:
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dcui/fix_mesa-dri
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/fix_mesa-dri
> 
> Dexuan Cui (2):
>   glproto: Revert "glxproto: make GLX swap event struct match spec"
>   dri2proto: Revert "dri2proto: make DRI2 swap event match GLX spec"

Merged to master, thanks.

Richard



