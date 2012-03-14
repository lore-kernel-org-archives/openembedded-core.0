Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7oPV-0006Xp-8e for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 14:38:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDToq9008127
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:29:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08036-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:29:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDTeQY008120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:29:41 GMT
Message-ID: <1331731774.18586.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 13:29:34 +0000
In-Reply-To: <cover.1331705212.git.wenzong.fan@windriver.com>
References: <cover.1331705212.git.wenzong.fan@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Update ccache and chkconfig to latest version
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
X-List-Received-Date: Wed, 14 Mar 2012 13:38:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 14:24 +0800, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> Update ccache and chkconfig, also update their distro tracking fields
> accordingly.
> 
> The following changes since commit 8e9f6fc77ac4763f4ed1f6e7b720420c220ba6e2:
>   Richard Purdie (1):
>         dates: Fix unpackaged files warning
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib wenzong/upd-ccache-chkconfig
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/upd-ccache-chkconfig
> 
> Wenzong Fan (2):
>   ccache: update it from 3.1.6 to 3.1.7
>   chkconfig: update it from 1.3.57 to 1.3.58

Merged to master, thanks.

Richard



