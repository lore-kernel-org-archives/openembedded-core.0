Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7oJ0-0006GG-L2 for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 14:31:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDN8sb008033
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:23:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05480-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:23:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDN1Cl008026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:23:02 GMT
Message-ID: <1331731381.18586.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 13:23:01 +0000
In-Reply-To: <cover.1331713107.git.kai.kang@windriver.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/8] Update packages
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
X-List-Received-Date: Wed, 14 Mar 2012 13:31:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 17:03 +0800, Kang Kai wrote:
> Hello,
> 
> This serious patches try to update some packages.
> 
> Regards,
> 
> 
> The following changes since commit 19b38a6486086b62efbff2bf8192adbaa34ecc0a:
> 
>   package.bbclass: Drop python depends from rpmdeps (2012-03-11 18:27:45 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib kangkai/update-packages
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-packages
> 
> Kang Kai (8):
>   gobject-introspection: update to 1.31.20
>   newt: update to 0.52.14
>   libsdl: update to 1.2.15
>   alsa-lib: update to 1.0.25
>   alsa-utils: update to 1.0.25
>   alsa-tools: update to 1.0.25
>   ghostscript: update to 9.05
>   distro_tracking_fields: udpate package status

Merged to master, thanks.

Richard



