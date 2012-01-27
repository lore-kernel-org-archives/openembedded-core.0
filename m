Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rqiba-0004xG-9r for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 11:00:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0R9qcXP006595
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:52:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06380-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:52:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0R9qVQ0006588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:52:32 GMT
Message-ID: <1327657953.19643.440.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jan 2012 09:52:33 +0000
In-Reply-To: <cover.1327650817.git.shane.wang@intel.com>
References: <cover.1327650817.git.shane.wang@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] fix the typos for package report system
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
X-List-Received-Date: Fri, 27 Jan 2012 10:00:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-27 at 15:54 +0800, Shane Wang wrote:
> Fixed the typos in distro_tracking_fields for package report system not to show duplicate stuffs.
> 
> The following changes since commit 238a47d800446996f5cb9929f33aaaffe618f7b6:
> 
>   shadow-sysroot: Simplfy login.defs installation (2012-01-26 20:53:16 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib shane/typo
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/typo
> 
> Shane Wang (1):
>   distro_tracking_fields: fix the typos in the field of maintainer.

Merged to master, thanks.

Richard



