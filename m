Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTX6R-0005Ul-P2 for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 12:04:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOAvtFZ023712;
	Thu, 24 Nov 2011 10:57:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22565-09; Thu, 24 Nov 2011 10:57:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOAvjSl023706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Nov 2011 10:57:46 GMT
Message-ID: <1322132272.24143.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 10:57:52 +0000
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 0/7] Distro Tracking and Patch Status
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
X-List-Received-Date: Thu, 24 Nov 2011 11:04:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-22 at 17:18 -0800, Saul Wold wrote:
> Richard,
> 
> This should be a pretty straight forward set of changes
> to the distro_tracking_fields and patch Status Updates.
> 
> Please review and pull.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 381c7857a5b303bf9eadd7fffc39d17a2b8e31f2:
> 
>   matchbox-wm: Fix variable type in _NET_WORKAREA setting (2011-11-22 15:13:16 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/distro_track
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/distro_track
> 
> Nitin A Kamble (1):
>   at: update the upstream-status of patches
> 
> Saul Wold (2):
>   distro_tracking: Refect Recipe Updates & Status
>   distro_tracking_fields: Update after Manual Check
> 
> Scott Garman (1):
>   distro_tracking: update manual checks for various recipes
> 
> Shane Wang (3):
>   distro_tracking: update manual checks for recipes
>   distro_tracking: update manual checks for recipes
>   distro_tracking: update manual checks for recipes

Merged to master, thanks.

Richard



