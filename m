Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qyprs-0003Ul-12 for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 20:50:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7VIjbSK010664
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:45:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10560-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:45:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7VIjSnJ010657
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:45:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1314772012.git.dongxiao.xu@intel.com>
References: <cover.1314772012.git.dongxiao.xu@intel.com>
Date: Wed, 31 Aug 2011 19:45:14 +0100
Message-ID: <1314816314.5939.472.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1][PULL] connman-gnome: Fix WiFi security type display issue
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
X-List-Received-Date: Wed, 31 Aug 2011 18:50:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-31 at 14:47 +0800, Dongxiao Xu wrote:
> Hi Saul,
> 
> This commit fixes the display issue of WiFi security type in connman-gnome, please help to review and pull.
> 
> Thanks,
> Dongxiao
> 
> The following changes since commit 3f4017e36410a6435f50183e76b9adb1db1f4126:
> 
>   gdb: Fix broken source directory (2011-08-31 00:49:05 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/bugfix
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/bugfix
> 
> Dongxiao Xu (1):
>   connman-gnome: Fix WiFi security display issue

Merged to master, thanks.

Richard



