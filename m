Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfE2F-0003U6-Jq for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:36:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GWHLS021893
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:32:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21380-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 17:32:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GWCFI021887
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:32:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310080780.git.jessica.zhang@intel.com>
References: <cover.1310080780.git.jessica.zhang@intel.com>
Date: Fri, 08 Jul 2011 17:31:33 +0100
Message-ID: <1310142693.20015.906.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr
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
X-List-Received-Date: Fri, 08 Jul 2011 16:36:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 16:23 -0700, Jessica Zhang wrote:
> The following changes since commit c412674cf818e77e35857fb93353e392e7ac9e53:
>   Khem Raj (1):
>         package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib jzhang/1195
>   http://git.yoctoproject.org/cgit.cgi//log/?h=jzhang/1195
> 
> Khem Raj (1):
>   [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr

Merged to master, thanks.

Richard



