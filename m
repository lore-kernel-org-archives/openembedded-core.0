Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLCGZ-0000Qy-84 for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 12:12:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1B6KXd027729
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 11:06:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27585-02 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2011 11:06:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1B6Bwl027723
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 11:06:11 GMT
Message-ID: <1320145571.13918.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 Nov 2011 11:06:11 +0000
In-Reply-To: <cover.1320118475.git.dongxiao.xu@intel.com>
References: <cover.1320118475.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2 v2][PULL] iptables: recipe upgrade
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
X-List-Received-Date: Tue, 01 Nov 2011 11:12:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-01 at 11:38 +0800, Dongxiao Xu wrote:
> Hi Richard and Saul,
> 
> This is the second pull request for iptables and connman, please help to review and pull.
> 
> Thanks,
> Dongxiao
> 
> The following changes since commit 4ce1f57e723cb6ccfd67ed1570228602547bd112:
> 
>   distro_tracking: polkit, libsndfile, etc (2011-10-31 23:03:11 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/upgrade
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/upgrade
> 
> Dongxiao Xu (2):
>   iptables: upgrade to version 1.4.12.1
>   connman: add xtables_version to fix xtables API change

Merged to master, thanks.

Richard



