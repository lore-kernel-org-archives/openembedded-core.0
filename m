Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q7UJu-0006o7-Ri for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 17:06:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36F4km1019871;
	Wed, 6 Apr 2011 16:04:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19327-09; Wed,  6 Apr 2011 16:04:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36F4X8b019865
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 6 Apr 2011 16:04:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1302039585.git.sgw@linux.intel.com>
References: <cover.1302039585.git.sgw@linux.intel.com>
Date: Wed, 06 Apr 2011 08:04:28 -0700
Message-ID: <1302102268.22904.70.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Scott Rifenbark <scott.m.rifenbark@intel.com>
Subject: Re: [PATCH 0/6] Consolidated Pull Request
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
X-List-Received-Date: Wed, 06 Apr 2011 15:06:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-04-05 at 14:47 -0700, Saul Wold wrote:
> From: Saul Wold <sgw@linux.intel.com>
> 
> Richard,
> 
> Here are a half dozen pull requests for oe-core and poky.
> 
> Thanks
> 	Sau!
> 
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: distro/oe-core
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-core
> 
> Thanks,
>     Saul Wold <sgw@linux.intel.com>
> ---
> 
> 
> Dongxiao Xu (1):
>   gst-meta-base: Support http/https remote streams
> 
> Kang Kai (1):
>   xdg-utils: add xdg-utils to pass the lsb test
> 
> Mei Lei (1):
>   distrodata.bbclass: Merge the get_pkg_info.log into checkpkg.csv
> 
> Saul Wold (1):
>   desktop-file-utils: Add SRC_URI checksums
> 
> Scott Rifenbark (1):
>   documentation/adt-manual/adt-eclipse.xml:  Updated repo URL for
>     Eclipse Plug-in
> 
> Xiaofeng Yan (1):
>   LSB_Setup.sh: Add function to install all test packages

Merged to master, thanks.

Richard



