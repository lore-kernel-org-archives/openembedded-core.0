Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW5j9-0004qB-NS for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:27:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1CKIwu014793
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 12:20:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14034-09 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 12:20:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1CK9Gt014787
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 12:20:10 GMT
Message-ID: <1322742019.17484.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 12:20:19 +0000
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5][PULL] Recipe upgrades for glib and telepathy-*.
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
X-List-Received-Date: Thu, 01 Dec 2011 12:27:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 07:21 +0800, Dongxiao Xu wrote:
> Hi Saul,
> 
> This pull request upgrades some recipes.
> Please help to review and pull.
> 
> Thanks,
> Dongxiao
> 
> The following changes since commit 36654d6d393cb8c8a545835184a96be4ae0c885d:
> 
>   grub: Use COMPATIBLE_HOST (2011-11-30 22:21:53 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/upgrade
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/upgrade
> 
> Dongxiao Xu (5):
>   telepathy-idle: upgrade to version 0.1.11
>   telepathy-glib: upgrade to version 0.17.0
>   glib-2.0: upgrade to version 2.30.1
>   telepathy-mission-control: upgrade to version 5.10.1
>   distro_trakcing_fields: update for glib, telepathy-idle, etc

Merged to master, thanks.

Richard



